package main

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"
)

// Carol represents a carol with its title and verses
type Carol struct {
	Title  string
	Verses []string
}

// CarolMapping maps README carol names to LilyPond file names
var CarolMapping = map[string]string{
	"Silent Night":                 "22-SilentNight-Complete.ly",
	"While Shepherds watched":      "27-WhileShepherdsWatched-Complete.ly",
	"In the bleak midwinter":       "09-InTheBleakMid-Winter-Complete.ly",
	"Away in a Manger":             "03-AwayInAManger-Complete.ly",
	"Good King Wencelas":           "07-GoodKingWenceslas.ly",
	"Once in Royal David's city":   "19-OnceInRoyal-Complete.ly",
	"O little town of Bethlehem":   "16-OLittleTown-Complete.ly",
	"Hark! the herald angels sing": "08-HarkTheHerald-Complete.ly",
	"O Come all we faithful":       "14OComeAllYeFaithful-Complete.ly",
	"Twelve Days of Christmas":     "TwelveDaysOfChristmas.ly",
}

// CarolOrder is the order of carols from the README
var CarolOrder = []string{
	"Silent Night",
	"While Shepherds watched",
	"In the bleak midwinter",
	"Away in a Manger",
	"Good King Wencelas",
	"Once in Royal David's city",
	"O little town of Bethlehem",
	"Hark! the herald angels sing",
	"O Come all we faithful",
	"Twelve Days of Christmas",
}

func main() {
	lilypondDir := "Lilypond carols"
	outputFile := "carol_booklet.tex"
	imageFile := "20211212.jpg"

	carols := make([]Carol, 0, len(CarolOrder))

	for _, name := range CarolOrder {
		filename, ok := CarolMapping[name]
		if !ok {
			fmt.Printf("Warning: No mapping for carol '%s'\n", name)
			continue
		}

		filepath := filepath.Join(lilypondDir, filename)
		carol, err := parseLilypondFile(filepath)
		if err != nil {
			fmt.Printf("Error parsing %s: %v\n", filename, err)
			continue
		}

		carols = append(carols, carol)
	}

	err := generateLatex(carols, imageFile, outputFile)
	if err != nil {
		fmt.Printf("Error generating LaTeX: %v\n", err)
		os.Exit(1)
	}

	fmt.Printf("Generated %s with %d carols\n", outputFile, len(carols))
	fmt.Println("Run: pdflatex carol_booklet.tex")
}

// parseLilypondFile extracts the title and lyrics from a LilyPond file
// If a corresponding -lyrics.txt file exists, use that instead
func parseLilypondFile(filename string) (Carol, error) {
	// Check for lyrics.txt file first
	lyricsFile := strings.TrimSuffix(filename, ".ly") + "-lyrics.txt"
	if _, err := os.Stat(lyricsFile); err == nil {
		return parseLyricsFile(lyricsFile)
	}

	file, err := os.Open(filename)
	if err != nil {
		return Carol{}, err
	}
	defer file.Close()

	var carol Carol
	var content strings.Builder
	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		content.WriteString(scanner.Text())
		content.WriteString("\n")
	}

	if err := scanner.Err(); err != nil {
		return Carol{}, err
	}

	text := content.String()

	// Extract title from header
	titleRe := regexp.MustCompile(`title\s*=\s*"([^"]+)"`)
	if match := titleRe.FindStringSubmatch(text); len(match) > 1 {
		carol.Title = match[1]
	}

	// Extract all stanzas (stanzaa, stanzab, etc.)
	// Use a more robust approach to handle nested braces
	stanzaStartRe := regexp.MustCompile(`stanza[a-z]\s*=\s*\\lyricmode\s*\{`)
	starts := stanzaStartRe.FindAllStringIndex(text, -1)

	for _, start := range starts {
		// Find matching closing brace by counting braces
		braceCount := 1
		contentStart := start[1]
		contentEnd := contentStart
		for i := contentStart; i < len(text) && braceCount > 0; i++ {
			if text[i] == '{' {
				braceCount++
			} else if text[i] == '}' {
				braceCount--
			}
			if braceCount == 0 {
				contentEnd = i
			}
		}

		if contentEnd > contentStart {
			content := text[contentStart:contentEnd]
			verse := cleanLyrics(content)
			// Skip verses that are empty or just contain LilyPond commands
			if verse != "" && !strings.HasPrefix(verse, "sixth") {
				carol.Verses = append(carol.Verses, verse)
			}
		}
	}

	return carol, nil
}

// parseLyricsFile parses a plain text lyrics file
// Format: Title on line 1, optional attribution on line 2, then numbered verses
func parseLyricsFile(filename string) (Carol, error) {
	file, err := os.Open(filename)
	if err != nil {
		return Carol{}, err
	}
	defer file.Close()

	var carol Carol
	var lines []string
	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		return Carol{}, err
	}

	// First line is the title
	if len(lines) > 0 {
		carol.Title = strings.TrimSpace(lines[0])
	}

	// Parse verses - they start with "N." where N is a number
	verseRe := regexp.MustCompile(`^\d+\.`)
	var currentVerse []string
	inVerse := false

	for i := 1; i < len(lines); i++ {
		line := lines[i]
		trimmed := strings.TrimSpace(line)

		if verseRe.MatchString(trimmed) {
			// Save previous verse if exists
			if inVerse && len(currentVerse) > 0 {
				carol.Verses = append(carol.Verses, strings.Join(currentVerse, "\n"))
			}
			// Start new verse (remove the "N. " prefix)
			verseText := verseRe.ReplaceAllString(trimmed, "")
			currentVerse = []string{strings.TrimSpace(verseText)}
			inVerse = true
		} else if inVerse && trimmed != "" {
			// Continue current verse (remove leading whitespace for indented lines)
			currentVerse = append(currentVerse, trimmed)
		} else if inVerse && trimmed == "" {
			// Empty line might end a verse, but we'll keep going
			// Verses are actually ended when a new "N." is found
		}
	}

	// Don't forget the last verse
	if inVerse && len(currentVerse) > 0 {
		carol.Verses = append(carol.Verses, strings.Join(currentVerse, "\n"))
	}

	return carol, nil
}

// cleanLyrics removes LilyPond markup and formats the lyrics
// Preserves line breaks from the source file
func cleanLyrics(raw string) string {
	result := raw

	// First, remove multi-line patterns from the entire string
	multiLinePatterns := []string{
		`(?s)\\repeat\s+unfold\s+\d+\s*\{[^}]*\}`, // (?s) makes . match newlines
	}
	for _, pattern := range multiLinePatterns {
		re := regexp.MustCompile(pattern)
		result = re.ReplaceAllString(result, "")
	}

	// Split into lines to preserve structure
	lines := strings.Split(result, "\n")
	var cleanedLines []string

	for _, line := range lines {
		result := line

		// Remove LilyPond commands with various patterns
		commands := []string{
			`\\tiny`,
			`\\set\s+stanza\s*=\s*#"[^"]*"`,
			`\\set\s+ignoreMelismata\s*=\s*##[tf]`,
			`\\unset\s+ignoreMelismata`,
			`\\skip\s*\d*`,
			`\\bar\s+"[^"]*"`,
			`\\break`,
			`\\slurDashed`,
		}

		for _, cmd := range commands {
			re := regexp.MustCompile(cmd)
			result = re.ReplaceAllString(result, "")
		}

		// Replace -- with nothing (syllable separator)
		result = strings.ReplaceAll(result, " -- ", "")
		result = strings.ReplaceAll(result, "-- ", "")
		result = strings.ReplaceAll(result, " --", "")
		result = strings.ReplaceAll(result, "--", "")

		// Remove standalone underscores (rests/extenders in lyrics)
		result = regexp.MustCompile(`_+`).ReplaceAllString(result, " ")

		// Clean up whitespace within line
		result = regexp.MustCompile(`\s+`).ReplaceAllString(result, " ")
		result = strings.TrimSpace(result)

		// Only add non-empty lines
		if result != "" {
			cleanedLines = append(cleanedLines, result)
		}
	}

	// Join with newlines to preserve line structure
	return strings.Join(cleanedLines, "\n")
}

// generateLatex creates a LaTeX file for the carol booklet
func generateLatex(carols []Carol, imageFile, outputFile string) error {
	file, err := os.Create(outputFile)
	if err != nil {
		return err
	}
	defer file.Close()

	// Write LaTeX preamble - A5 for booklet printing on A4
	fmt.Fprintln(file, `\documentclass[a5paper,12pt]{article}`)
	fmt.Fprintln(file, `\usepackage[utf8]{inputenc}`)
	fmt.Fprintln(file, `\usepackage[T1]{fontenc}`)
	fmt.Fprintln(file, `\usepackage{graphicx}`)
	fmt.Fprintln(file, `\usepackage{geometry}`)
	fmt.Fprintln(file, `\usepackage{multicol}`)
	fmt.Fprintln(file, ``)
	fmt.Fprintln(file, `% Page setup for A5 booklet printing`)
	fmt.Fprintln(file, `\geometry{a5paper, margin=1.2cm}`)
	fmt.Fprintln(file, `\setlength{\parskip}{0.5em}`)
	fmt.Fprintln(file, `\setlength{\parindent}{0pt}`)
	fmt.Fprintln(file, `\setlength{\columnsep}{1em}`)
	fmt.Fprintln(file, ``)
	fmt.Fprintln(file, `\begin{document}`)
	fmt.Fprintln(file, ``)

	// Title page
	fmt.Fprintln(file, `% Title Page`)
	fmt.Fprintln(file, `\begin{titlepage}`)
	fmt.Fprintln(file, `\centering`)
	fmt.Fprintln(file, `\vspace*{1cm}`)
	fmt.Fprintln(file, `{\LARGE\bfseries Asseily Carols}\\[1cm]`)
	fmt.Fprintf(file, `\includegraphics[width=0.9\textwidth]{%s}\\[1cm]`+"\n", imageFile)
	fmt.Fprintln(file, `\vfill`)
	fmt.Fprintln(file, `\end{titlepage}`)
	fmt.Fprintln(file, ``)

	// Generate each carol
	for i, carol := range carols {
		fmt.Fprintf(file, `\begin{center}{\Large\bfseries %s}\end{center}`+"\n", escapeLatex(carol.Title))
		fmt.Fprintln(file, `\vspace{0.3em}`)

		// Determine if we need two columns (more than 3 verses)
		useColumns := len(carol.Verses) > 3

		for j, verse := range carol.Verses {
			// First 3 verses: 12pt bold, single column
			// Verses 4+: smaller font in two columns
			if j == 3 && useColumns {
				fmt.Fprintln(file, `\begin{multicols}{2}`)
				fmt.Fprintln(file, `\small`)
			}

			// Split verse into lines and format with line breaks
			lines := strings.Split(verse, "\n")
			fmt.Fprintf(file, `\textbf{%d.} `, j+1)
			for k, line := range lines {
				fmt.Fprint(file, escapeLatex(line))
				if k < len(lines)-1 {
					fmt.Fprintln(file, `\\`)
				} else {
					fmt.Fprintln(file, ``)
				}
			}
			fmt.Fprintln(file, ``)
		}

		// Close multicols if opened
		if useColumns {
			fmt.Fprintln(file, `\end{multicols}`)
		}

		// Add page break between carols (except for the last one)
		if i < len(carols)-1 {
			fmt.Fprintln(file, `\newpage`)
		}
		fmt.Fprintln(file, ``)
	}

	fmt.Fprintln(file, `\end{document}`)

	return nil
}

// escapeLatex escapes special LaTeX characters
func escapeLatex(s string) string {
	result := s
	// Escape special LaTeX characters (lyrics shouldn't have backslashes after cleaning)
	result = strings.ReplaceAll(result, `&`, `\&`)
	result = strings.ReplaceAll(result, `%`, `\%`)
	result = strings.ReplaceAll(result, `$`, `\$`)
	result = strings.ReplaceAll(result, `#`, `\#`)
	result = strings.ReplaceAll(result, `~`, `\textasciitilde{}`)
	result = strings.ReplaceAll(result, `^`, `\textasciicircum{}`)
	// Note: underscores and braces should already be removed from lyrics
	return result
}
