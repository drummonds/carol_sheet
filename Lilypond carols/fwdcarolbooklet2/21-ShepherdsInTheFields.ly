\header {
	filename = "ShepherdsInTheFields.ly"
	enteredby = "Gordon Gilbert"
	composer = "French Carol Melody"
	poet = "French Carol 18th Cent."
	date=""
	title = "Shepherds In The Field Abiding"
	metre = "Iris 87.87 with Refrain"
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
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}
global= {

	\time 4/4
    \key f \major
    #(set-global-staff-size 18)

     %\partial 4
   
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	\relative {
	a'4 ^ \markup \italic "Unison" a8( g) a4 c c4. bes8a4 f
	a a8( g) a4 c c4. bes8 a2
	a4 a a a8( c) c4. bes8 a4 f
	a a8( g) a4 c c4. bes8 a2
	c2( ^ \markup \italic "Harmony" d8 c bes a 
	bes2 c8 bes a g a2 bes8 a g f g4.) g8 c,2
	f4 g a bes a2 g2
	c2( d8 c bes a bes2 c8 bes a g 
	a2 bes8 a g f g4.) g8 c,2
	f4 g a bes a2( g) f1 \bar "||"
}}

alto=\context Voice = "alto"   {
	\voiceTwo
	\relative {
	c4 f8 e f4 g f g c,2
	c4 f8 e f4 c d8 e f4 f2
	c4 f c2 ~ c4 d8 e f4 c
	c d c a'8 g f4 e f c
	f2( fis4 d ~ d2 c4 e c2 bes4 c ~ c4) b c2
	c4 e f8 e d4 c2 c
	f2( fis4 d ~ d2 c4 e c2 bes4 c ~ c) b c2
	c4 e f g ~ g f2( e4) f1
}}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	\relative {
	s1 * 8
	a2.( d8 c bes a g f g4 c8 bes a g f e f2 d8 e) f g e2
	f4 c'8 bes a g f4 f( e8 d e2
	a2.( d8 c bes a g f g4 c8 bes a g f e f2 d8 e) f g e2
	f4 c'8 bes a c d4 c2( ~ c4. bes8) a1
}}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	\relative {
	f,4 c' f e d e f a
	f c a8 g a4 bes d f2
	f4 d a f e bes f'8 g a g 
	f4 bes, a8 g f g a bes c4 f2
	f4( ees d fis g8 f e d e4 c f8 e d c d4 a g) g c( bes)
	a8 bes a g f4 bes c2 c
	f4( ees d fis g8 f e d e4 c f8 e d c d4 a g) g c( bes
	a8 bes a g f4 bes c1 f,
}}
accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	Shep -- herds in the field a -- bid -- ing,
	Tell us when the ser -- aph bright
	Greet -- ed you with won -- drous tid -- ing,
	What you saw and heard that night.
	Glo -- ri -- a in ex -- cel -- cis De -- o,
	Glo -- ri -- a in ex -- cel -- cis De -- o!
}

stanzab = \lyricmode {
	We be -- held, it is no fa -- ble;
	God in -- car -- nate, King of bliss,
	Swathed and cra -- dled in a sta -- ble,
	And the an -- gel stain was this:
}

stanzac = \lyricmode {
	Chor -- i -- sters on high were sing -- ing
	Je -- sus and His Vir -- gin birth,
	Heav'n -- ly bells the while a -- ring -- ing
	'Peace, good will to men on earth'.
}

stanzad = \lyricmode {
	
}
stanzae = \lyricmode {
	
}
stanzaf = \lyricmode {
	
}

\score {	%\transpose g f
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
	%	\lyricsto "sop" \context Lyrics = "stanza-4" {
	%		\set stanza = "4."
	%			\stanzad }
	%	\lyricsto "sop" \context Lyrics = "stanza-5" {
	%		\set stanza = "5."
	%			\stanzae }
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }


}

