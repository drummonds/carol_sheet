\header {
	filename = "GodRestYouMerry.ly"
	enteredby = "Gordon Gilbert"
	composer = "London Melody, 18th Cent."
	poet = "London Carol"
	date=""
	title = "God Rest You Merry"
	metre = "God Rest You Merry 7 6. 7 6. 7 6. with Refrain"
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2011/Dec/11"
}

\version "2.15.19"

\paper {
  %paper-width = 2\cm
  top-margin = 1.2\cm
  bottom-margin = 1.2\cm
  ragged-last-bottom = ##t
	%#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
		#(set-paper-size "letter")

}
#(set-global-staff-size 20)

global= {

	\time 4/4
    \key d \minor
   
    \partial 4
   % \skip 1 * 20 \bar "||"
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	\relative {
	d4 d a' a g f e d c d e f g a2.
	d,4 d a' a g f( e) d c d e f g a2.
	a4 bes g a bes c d a g f d e f g2
	%Refrain
	f4( ^ \markup{ \large \italic Refrain } g) a2 bes4 a a( g) f e d2
	f8 e d4 g2 f4( g) a( bes) c d a( g) f e d2.
}}

alto=\context Voice = "alto"   {
	\voiceTwo 
	\relative {
	d4 ~ d2 ~ d c a4 g g c d2 e2.
	d4 ~ d2 ~ d c a4 g a c2 <d bes>4 <c a>2.
	e4 ~ e2 d f e d b c
	a4 c f2 ~ f e d4 c ~ c2 b
	c2 d4 e <f c>2 ~ f d c a2.
	
}}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	\relative {
	bes4 a2 bes a4 g f e f g bes2 c2.
	<bes f>4 <a f>2 bes2 a4 g f e f g f d f2.
	c'4 d bes c d a2 c a4 f g f d2 
	f4 g a2 d c a ~ a g g
	a4 c f,2 ~ f4 bes4 c bes a g f2.
}}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	\relative {
	g4 d2 bes c d4 e d c bes2 a2.
	bes4 d2 bes c d4 e d c a g f2.
	a'4 g1 f4 d c2 d1 c4 bes 
	a c f2 bes, c d4 e f2 ~ f
	e d4 c f, g a bes g2 c d2.
}}

accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	God rest you mer -- ry, gen -- tle -- men, 
	Let no -- thing you dis -- may,
	Re -- mem -- ber Christ our Sav -- iour 
	Was born on Christ -- mas Day;
	To save us all from Sa -- tan's pow'r
	When we were gone a -- stray.
	%Refrain
	O ti -- dings of com -- fort and joy,
	Com -- fort and joy;
	O ti -- dings of com -- fort and joy!
}

stanzab = \lyricmode {
	From God our heav'n -- ly Fa -- ther 
	A bles -- sed an -- gel came;
	And un -- to cer -- tain shep -- herds 
	Brought ti -- dings of the same;
	How that in Beth -- le -- hem was born
	The Son of God by Name.
}

stanzac = \lyricmode {
	''Fear not, then,'' said the an -- gel,
	''Let no -- thing you af -- fright;
	This day is born a Sa -- viour
	Of a pure Vig -- gin bright,
	To free all those who trust in Him
	From Sa -- tan's pow'r and might.''
}

stanzad = \lyricmode {
	Now to the Lord sing prais -- es,
	All you with -- in this place,
	And with true love and bro -- ther -- hood
	Each o -- ther now em -- brace;
	This ho -- ly tide of Christ -- mas
	Doth bring re -- deem -- ing brace.
}
stanzae = \lyricmode {
	
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }


}

