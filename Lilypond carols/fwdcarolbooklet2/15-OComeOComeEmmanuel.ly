\version "2.15.19"
\header {
	filename = "OComeOComeEmmanuel.ly"
	enteredby = "Gordon Gilbert"
	composer = ""
	poet = ""
	date=""
	title = "O Come O Come Emmanuel"
	metre = ""
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2011/Dec/11"
}
global = {
	\autoBeamOff
	\override Staff.TimeSignature #'stencil = ##f
%	\numericTimeSignature
	\key g \major
	\time 11/8
}
#(set-global-staff-size 16)
#(set! paper-alist (cons '("7x8.5" cons (* 7 in) (* 8.5 in)) paper-alist))
#(set-default-paper-size "7x8.5")
sopMusic = \relative c' {
	e8 g8 b8 b8 b8 a8[ c8 b8] a8 g4 | \break
	a8 b8 g8 e8 g8 a8[ fis8 e8] d8 e4 | \break
	\time 10/8
	a8 a8 e8 e8 fis8 g8[ fis8] e8 d4 | \break
	\time 11/8
	g8 a8 b8 b8 b8 a8[ c8 b8] a8 g4 | \break
	\time 3/8
	d'8 d4 |
	b8 b4 |
	\time 10/8
	b8 a8[ c8 b8] a8 g8 a8 b8 g8 e8 |
	\time 7/8
	g8 a8[ fis8 e8] d8 e4 \bar "|." |
}

verseOne = \lyricmode {
	\set vocalName = #"1."
	\set shortVocalName = "1."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, O come, Em -- man -- u -- el,
	And ran -- some cap -- tive Is -- ra -- el,
	That mourns in lone -- ly ex -- ile here
	Un -- til the Son of God ap -- pear.
	\set vocalName = #""
	\set shortVocalName = ""
	Re -- joice! Re -- joice! Em -- man -- u -- el
	Shall come to thee, O Is -- ra -- el!
}
verseTwo = \lyricmode {
	\set vocalName = #"2."
	\set shortVocalName = "2."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, Thou Wis -- dom from on high,
	Who ord -- 'rest all things migh -- ti -- ly;
	To us the path of knowl -- edge show,
	And teach us in her ways to go.
}
verseThree = \lyricmode {
	\override LyricText #'font-shape = #'italic
	\override InstrumentName #'font-shape = #'italic
	\set vocalName = #"3."
	\set shortVocalName = "3."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, O come, thou Lord of might,
	Who to Thy tribes on Si -- nai's height
	In an -- cient times didst give the law,
	In cloud, and ma -- jes -- ty, and awe.
}
verseFour = \lyricmode {
	\set vocalName = #"4."
	\set shortVocalName = "4."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, Thou Rod of Jes -- se's stem,
	From ev -- ery foe de -- li -- ver them
	That trust Thy migh -- ty pow'r to save,
	And give them vict -- 'ry o'er the grave.
}
verseFive = \lyricmode {
	\set vocalName = #"5."
	\set shortVocalName = "5."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, Thou Key of Da -- vid, come,
	And o -- pen wide our heav -- 'nly home;
	Make safe the way that leads on high,
	And close the path to mis -- er -- y.
}
verseSix = \lyricmode {
	\override LyricText #'font-shape = #'italic
	\override InstrumentName #'font-shape = #'italic
	\set vocalName = #"6."
	\set shortVocalName = "6."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, Thou Day -- spring from on high,
	And cheer us by Thy draw -- ing nigh;
	Dis -- perse the gloom -- y clouds of night,
	And death's dark sha -- dow put to flight.
}
verseSeven = \lyricmode {
	\set vocalName = #"7."
	\set shortVocalName = "7."
	\override InstrumentName #'X-offset = #2
	\override InstrumentName #'font-series = #'bold
	O come, De -- sire of na -- tions, bind
	In one the hearts of all man -- kind;
	Bid Thou our sad di -- vi -- sions cease,
	And be Thy -- self our King of Peace.
}

accompaniment = \chordmode {    
	s8 e2:m a:m e4.:m 
	e2:m a:m e4.:m
	a2:m e4.:m b4.:m
	e2:m a:m e4:m
	g8 d4 e8:m b4:m g8
	a2:m e2.:m a2:m e4:m
	}

\score {
	<<
		\context ChordNames \accompaniment
		\new Staff = women <<
			\tempo 4 = 72
			$(set-accidental-style 'modern-voice)
			\new Voice = "sopranos" {
				\voiceOne
				<< \global \sopMusic >>
			}
		>>
		\new Lyrics \lyricsto sopranos \verseOne
		\new Lyrics \lyricsto sopranos \verseTwo
		\new Lyrics \lyricsto sopranos \verseThree
		\new Lyrics \lyricsto sopranos \verseFour
		\new Lyrics \lyricsto sopranos \verseFive
		\new Lyrics \lyricsto sopranos \verseSix
		\new Lyrics \lyricsto sopranos \verseSeven
    >>
	\header {
		title = "O Come, O Come, Emmanuel"
		poet = ""
		composer = "Thomas Helmore"
%		opus = "VENI EMMANUEL"
	}
	\midi {}
	\layout {
		\context {
			\Score
			\remove "Bar_number_engraver"
		}
	}
}
