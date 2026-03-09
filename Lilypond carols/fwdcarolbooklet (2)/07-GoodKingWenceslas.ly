\header {
	filename = "GoodKingWenceslas.ly"
	enteredby = "Gordon Gilbert"
	composer = "Melody from Piae Cantones, 1582"
	poet = "J. M. Neale"
	date=""
	title = "Good King Wenceslas"
	metre = ""
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2011/Dec/13"
}

\version "2.15.19"

\paper {
  
		#(set-paper-size "letter")

}
#(set-global-staff-size 17)

global= {

	\time 4/4
    \key g \major
   
    
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	\relative {
	g'4 g g a g g d2
	e4 d e fis g2 g
	g4 g g a g g d2
	e4 d e fis g2 g
	d'4 c b a b a g2
	e4 d e fis g2 g
	d4 d e fis g g a2
	d4 c b a g2( c) g1
}}

alto=\context Voice = "alto"   {
	\voiceTwo 
	\relative {
	d4 b d d e b8( c) d2
	c4 b c c d2 d
	d4 b d d e b8( c) d2
	c4 b c c d2 d
	b'4. a8 g4 g g4. fis8 e2
	c8( b) a4 b8( c) d4 e2 e
	d4 b c c b8( c) d( e) e2
	g4. a8 g4 fis e1 d
	
}}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	\relative {
	b4 d b a c b a( g)
	g g8( fis) g4 a b2 b
	b4 d b a c b a( g)
	g g8( fis) g4 a b2 b
	g4 d' e e b b b2
	a8( b) c4 b a b2 c
	a4 g g a g b d2
	d4 e d c b( a g a) b1
}}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	\relative {
	g4 a g fis e e b2
	c4 d c8( b) a4 g2 g
	g'4 a g fis e e b2
	c4 d c8( b) a4 g2 g
	b4 b c cis d dis e2
	a4 a g fis e( d2 c4)
	c4 b b a e' e d( c) 
	b c d d e2.( c4) g1
}}

accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	Good King Wen -- ces -- lass looked out
	On the feast of Ste -- phen,
	When the snow lay round a -- bout,
	Deep and crisp and e -- ven;
	Bright -- ly shone the moon that night,
	Though the frost was cru -- el;
	When a poor man came in sight
	Gath -- 'ring win -- ter fu -- el.
}

stanzab = \lyricmode {
	''Hi -- ther, page, and stand by me,
	If thou know'st it, tel -- ling,
	Yon -- der pea -- sant, who is he;
	Where and what his dwel -- ling?''
	''Sire, he lives a good league hence,
	Un -- der -- neath the moun -- tain,
	Right a -- gainst the for -- est fence,
	By Saint Ag -- nes' foun -- tain.
}

stanzac = \lyricmode {
	''Bring me flesh and bring me wine;
	Bring me pine logs hi -- ther.
	Thou and I will see him dine,
	When we bear them thi -- ther.''
	Page and mon -- arch, forth they went;
	Forth they went to -- ge -- ther
	Through the rude wind's wild la -- ment
	And the bit -- ter wea -- ther.
}

stanzad = \lyricmode {
	''Sire, the night is dark -- er now,
	And the wind blows stron -- ger;
	Fails my heart, I know not how;
	I can go no lon -- ger.''
	''Mark my foot -- steps, good my page,
	Tread thou in them bold -- ly;
	Thou shalt find the win -- ter's rage
	Freeze thy blood less cold -- ly.''
}
stanzae = \lyricmode {
	In his mas -- ter's steps he trod, 
	Where the snow lay din -- ted;
	Heat was in the ve -- ry sod
	Which the saint had prin -- ted.
	There -- fore, Chris -- tian men, be sure,
	Wealth or rank pos -- sess -- ing,
	Ye who now will bless the poor,
	Shall your -- selves find bless -- ing.
}

stanzaf = \lyricmode {
	
}

\score {
	%\transpose f ees
	   \context ChoirStaff <<
	       \context ChordNames \accomp
		 \unset ChoirStaff.melismaBusyProperties 
		\context Staff ="upper"  { \clef "G" <<
			\global
			\sop
			\alto
		>>}
       		
		\lyricsto "sop" \context Lyrics = "stanza-1" {
			\set stanza = "1."
				\stanzaa }
		\lyricsto "sop" \context Lyrics = "stanza-2" {
			\set stanza = "2."
				\stanzab }
		\lyricsto "sop" \context Lyrics = "stanza-3" {
			\set stanza = "3."
				\stanzac }
		\lyricsto "sop" \context Lyrics = "stanza-4" {
			\set stanza = "4."
				\stanzad }
		\lyricsto "sop" \context Lyrics = "stanza-5" {
			\set stanza = "5."
				\stanzae }
	%	\lyricsto "sop" \context Lyrics = "stanza-6" {
	%		\set stanza = "6."
	%			\stanzaf }
		\context Staff = "lower"  { \clef "F"<<
			\global
			\tenor
			\bass
		>>}
	>>
	\layout{
		indent = 0.0\pt
		\context {
			\ChordNames
			\override ChordName  #'style = #'american
			chordChanges = ##t
		    }
	}
	
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }


}

