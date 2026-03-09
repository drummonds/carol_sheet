% Created on Tue Dec 01 22:21:31 EST 2009
\version "2.15.19"

\header {
	title = "Angels From the Realms of Glory"
	subtitle = ""
	poet = "James Montgomery, 1771 - 1854"
	composer = "Henry Thomas Smart, 1813 - 1879"
	meter = "Regent Square 87.87.87"
	instrument = ""
	copyright = "Public Domain"
}


verseI= \lyricmode {
	\set stanza = "1."	
	An -- gels from the realms of glo -- ry,
	Wing your flight o'er all the earth;
	Ye you sang cre -- a -- tion's sto -- ry, 
	Now pro -- claim Mes -- si -- ah's birth:
	Come and wor -- ship, come and wor -- ship,
	Wor -- ship Christ the new -- born King.
}
 
verseII= \lyricmode {
	\set stanza = "2."	
	Shep -- herds in the field a -- bid -- ing,
	Watch -- ing o'er your flocks by night,
	God with man is now re -- sid -- ing,
	Yon -- der shines the in -- fant Light:
	
}
 
verseIII= \lyricmode {
	\set stanza = "3."	
	Sa -- ges, leave your con -- tem -- pla -- tions;
	Bright -- er vis -- ions beam a -- far;
	Seek the great de -- sire of na -- tions;
	Ye have seen His na -- tal star:
}

verseIV= \lyricmode {
	\set stanza = "4."	
	Saints be -- fore the al -- tar bend -- ing,
	Watch -- ing long in hope and fear,
	Sud -- den -- ly the Lord, des -- cen -- ding,
	In His tem -- ple shall ap -- pear:
}

verseV= \lyricmode {
	\set stanza = "5."	
	Though an in -- fant now we view Him,
	He shall fill His Fa -- ther's throne,
	Ga -- ther all the na -- tions to Him;
	Ev -- ery knee shall then bow down:
}
staffSATBMixedChoir = \new ChoirStaff  {
	<<
	\new Staff {
		\time 4/4
	\override Score.MetronomeMark #'stencil = ##t
	\tempo 4 = 72 
		\set Staff.instrumentName="S/A"
		\set Staff.midiInstrument="church organ"
		\key bes \major
		\clef treble
		<<
		\context Voice = "melodySAT" \relative { \voiceOne
	f4 d bes' f d'4. c8 bes4 f
	g g f bes f ees d2
	f4 d bes' f d'4. c8 bes4 a
	bes a g a8( bes) a4 g f2
	c'4. ^\markup \large \italic "Refrain" c8 a4 f d'4. c8 bes4 g
	ees' d c bes bes a bes2
		  
		}
		\context Voice = "Alto" \relative c' { \voiceTwo
	d4 bes f' d f4. f8 f4 f
	bes, bes bes bes c a bes2
	d4 bes f' f8 ees d4. ees8 d4 d 
	d d d d f e f2
	f4. f8 f4 c d4. d8 ees4 ees 
	g f ees d8 ees f4. ees8 d2	

				
		}
		>>
	}
	\context Lyrics = "lmelodySATLI" { s1 }
	
	\context Lyrics = "lmelodySATLII" { s1 }
	
	\context Lyrics = "lmelodySATLIII" { s1 }
	
	\context Lyrics = "lmelodySATLIV" { s1 }	
	
	\context Lyrics = "lmelodySATLV" { s1 }
	
	\new Staff {
		\set Staff.instrumentName="T/B"
		\set Staff.midiInstrument="church organ"
		\key bes \major
		\clef bass
		<<
		\context Voice = "Tenor" \relative { \voiceOne
	bes4 f f bes bes4. a8 bes4 bes 
	g bes f g f f f2
	bes4 bes f f bes4. g8 g4 fis
	g fis d' c8 bes c4 bes a2
	a4. a8 c4 a bes4. aes8 g4 bes
	c f, g8 a bes4 c c bes2
		
		}
		\context Voice = "Bass" \relative  { \voiceTwo
	bes,4 bes d bes f'4. ees8 d4 d
	ees ees d g, a f bes2
	bes'4 f8 ees d4 d8 c bes4. c8 d4 d 
	g d bes g c c f,2
	f'4. f8 f4 f bes,4. d8 ees4 ees
	c d ees8 f g4 f f, bes2
		}
		>>		
		}
	>>
}

#(set-global-staff-size 20)


\score {
	<<
		\staffSATBMixedChoir
		\context Lyrics = "lmelodySATLI" \lyricmode  { \lyricsto "melodySAT" \verseI }
		
		\context Lyrics = "lmelodySATLII" \lyricmode  { \lyricsto "melodySAT" \verseII }
		
		\context Lyrics = "lmelodySATLIII" \lyricmode  { \lyricsto "melodySAT" \verseIII }
		
		\context Lyrics = "lmelodySATLIV" \lyricmode  { \lyricsto "melodySAT" \verseIV }
		
		\context Lyrics = "lmelodySATLV" \lyricmode  { \lyricsto "melodySAT" \verseV }
	>>
	
	\midi {
	}

	\layout  {
	}
}

\paper {
	#(set-paper-size "letter")
}

