% Created on Tue Dec 01 22:21:31 EST 2009
\version "2.15.19"

\header {
	title = "What Child is This?"
	subtitle = "Greensleeves"
	poet = "William Chatterton Dix (1837 - 1898)"
	composer = "Trad. English Melody"
	meter = "87.87 with Refrain"
	instrument = "SATB Choral"
	copyright = "Public Domain"
}


verseI= \lyricmode {
	\set stanza = "1."	
	What Child is this, Who, laid to rest,
	On Ma -- ry's lap is sleep -- ing?
	Whom an -- gels greet with an -- thems sweet,
	While shep -- herds watch are keep -- ing?
	%refrain
	This, this is Christ the King, 
	Whom shep -- herds guard and an -- gels sing;
	Haste, haste to bring Him laud
	The Babe, the Son of Ma -- ry.
}
 
verseII= \lyricmode {
	\set stanza = "2."	
	Why lies He in such mean e -- state
	Where ox and ass are feed -- ing?
	Good Chris -- tian, fear: for sin -- ners here
	The si -- lent Word is plead -- ing.
}
 
verseIII= \lyricmode {
	\set stanza = "3."	
	So bring Him in -- cense, gold, and myrrh,
	Come pea -- sant, king, to own Him;
	The King of kings sal -- va -- tion brings,
	Let lov -- ing hearts en -- throne Him.
}
 

staffSATBMixedChoir = \new ChoirStaff  {
	<<
	\new Staff {
		\time 6/8
	\override Score.MetronomeMark #'stencil = ##t
	\tempo 4 = 72 
		\set Staff.instrumentName="S/A"
		\set Staff.midiInstrument="church organ"
		\key e \minor
		\clef treble
		<<
		\context Voice = "melodySAT" \relative { \voiceOne
			\partial 8	
		e8
		g4 a8 b8.( c16) b8
		a4 fis8 d8.( e16) fis8
		g4 e8 e8.( dis16) e8
		fis4( dis8) b4 e8
		g4 a8 b8.( c16) b8
		a4 fis8 d8.( e16) fis8
		g8.( fis16) e8 dis8.( cis16) dis8
		e4. e
		%Refrain
		d' d8.( cis16) b8
		a4 fis8 d8.( e16) fis8
		g4 e8 e8.( dis16) e8
		fis4 dis8 b4.
		d' d8.( cis16) b8
		a4 fis8 d8.( e16) fis8
		g8.( fis16) e8 dis8.( cis16) dis8
		e4. e \bar "||"
		}
		\context Voice = "Alto" \relative c' { \voiceTwo
			\partial 8	
		e8
		e4 d8 d4 g8
		fis4 d8 d4 d8
		b4 b8 a4 e'8
		dis4( b8) b4 e8
		e4 d8 d4 g8
		fis4 d8 d4 d8
		b4 c8 b4 b8
		b4. b
		%Refrain
		fis' b8. a16 g8
		fis4 d8 d4 d8
		b4 b8 a4 e'8
		dis4 b8 b4.
		fis'4. b8. a16 g8
		fis4 d8 d4 d8
		b4 c8 b4 b8
		b4. b
		
		}
		>>
	}
	\context Lyrics = "lmelodySATLI" { s1 }
	
	\context Lyrics = "lmelodySATLII" { s1 }
	
	\context Lyrics = "lmelodySATLIII" { s1 }
	

	\new Staff {
		\set Staff.instrumentName="T/B"
		\set Staff.midiInstrument="church organ"
		\key e \minor
		\clef bass
		<<
		\context Voice = "Tenor" \relative { \voiceOne
			\partial 8	
		g8
		b4 a8 g4 b8
		d4 a8 fis4 a8
		g4 g8 e4 e8
		b'4. b4 g8
		b4 a8 g4 b8
		d4 a8 fis4 a8
		g4 a8 fis4 b8 a4.g
		%Refrain
		d' d4 d8
		d4 a8 fis4 a8
		g4 g8 e4 e8
		b'4 b8 b4.
		d d4 d8
		d4 a8 fis4 a8
		g4 a8 fis4 b8 a4. g
		}
		\context Voice = "Bass" \relative c { \voiceTwo
			\partial 8	
		e8
		e4 fis8 g4 g8
		d4 d8 d4 d8
		e4 e8 c4 c8
		b4. b4 e8
		e4 fis8 g4 g8
		d4 d8 d4 d8
		e4 a,8 b4 b8
		e4. e
		%Refrain
		b'4. g4 g8
		d4 d8 d4 d8
		e4 e8 c4 c8
		b4 b8 b4.
		b' g4 g8
		d4 d8 d4 d8
		e4 a,8 b4 b8
		e4. e
		}
		>>		
		}
	>>
}




\score {
	<<
		\staffSATBMixedChoir
		\context Lyrics = "lmelodySATLI" \lyricmode  { \lyricsto "melodySAT" \verseI }
		
		\context Lyrics = "lmelodySATLII" \lyricmode  { \lyricsto "melodySAT" \verseII }
		
		\context Lyrics = "lmelodySATLIII" \lyricmode  { \lyricsto "melodySAT" \verseIII }
		
	>>
	
	\midi {
	}

	\layout  {
	}
}


	\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}


