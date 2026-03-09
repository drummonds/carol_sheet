\header {
	filename = "OfTheFathersLove.ly"
	enteredby = "Gordon Gilbert"
	composer = "Plainsong melody c12th C, arr. Healey Willan"
	poet = "Aurelius Clemens Prudentius 348-413 tr John M. Neale"
	date=""
	title = "Of the Father's Love Begotten"
	metre = "Divinum Mysterium 87.87.87.7"
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2005/Dec/13"
}

\version "2.15.19"
global = {
	\autoBeamOff
	\override Staff.TimeSignature #'stencil = ##f

%	\numericTimeSignature
	\key g \major
	\time 10/8
}
\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}
global= {


    \key ees \major
    #(set-global-staff-size 16)
   %\set Staff.minimumVerticalExtent = #'(-4 . 4)
    
   % \skip 1 * 20 \bar "||"
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	\relative {
	\time 10/8 ees8 f g aes g f g( f) ees4
	\time 9/8 g8 aes bes c bes( g) aes bes4
	\time 10/8 c8 d ees bes bes aes g( f) ees4
	\time 9/8 c8 d ees f ees( c) d ees4
	\time 13/8 ees8 f g aes g f bes( c bes g aes) bes4
	\time 8/8 ees,8 d c d ees c bes4
	\time 10/8 ees8 f g bes g ees f4( ees)\bar "||"
}}

alto=\context Voice = "alto"   {
	\voiceTwo
	\relative {
	ees4 ~ ees2 bes
	ees ees4 c8 d4
	f ees <ees bes>8 <c ees> d4 c
	aes g8 f g4 bes8 ~ bes4
	c2 d4 d ~ d8 ees4 d
	bes aes g2
	g8 aes bes4. g8 bes4 g
}}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	\relative {
	g8 aes bes c bes aes bes aes g4
	ees2 g4 f8 f4
	aes bes s bes g
	f ees8 c ees4 f8 g4
	g8 f ees4 bes'4 g ~ g8 ees4 f
	g ees8 f ees4 d
	c d4. ees8 d4 ees
}}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	\relative {
	ees,4 ~ ees2 ~ ees
	c4 g8 aes ees'4 f8 bes,4
	f'4 g g,8 aes bes4 c
	f c8 aes c4 bes8 ees4
	c2 bes4 g'4 ~ g8 c,4 bes
	g aes8 f c'4 g
	c g4. c8 bes4 ees,
}}

stanzaa = \lyricmode {
	Of the Fa -- ther's love be -- got -- ten
	Ere the worlds be -- gan to be,
	He is Al -- pha and O -- me -- ga,
	He the source, the end -- ing He,
	Of the things that are and have been,
	And that fu -- ture years shall see,
	Ev -- er -- more and ev -- er -- more.
}

stanzab = \lyricmode {
	At His word the worlds were fram -- Ã¨d.
	He com -- mand -- ed, it was done:
	Heav'n and earth and depths of o -- cean
	In their three -- fold or -- der one;
	All that grows be -- neath the shin -- ing
	Of the moon and burn -- ing sun,
	Ev -- er -- more and ev -- er -- more.
}
stanzac = \lyricmode {
	O that birth for ev -- er bless -- Ã¨d!
	When the Vir -- gin, full of grace,
	By the Ho -- ly Ghost con -- ceiv -- ing,
	Bare the Sav -- iour of our race,
	And the Babe, the world's re -- deem -- er,
	First re -- vealed His sac -- red face,
	Ev -- er -- more and ev -- er -- more.
}	
stanzad = \lyricmode {
	This is He whom seers in old time
	Chant -- ed of with one ac -- cord,
	Whom the voic -- es of the pro -- phets
	pro -- mised in their faith -- ful word;
	Now He shines, the long -- ex -- pect -- ed;
	Let cre -- a -- tion priase its Lord,
	Ev -- er -- more and ev -- er -- more.
}	
stanzae = \lyricmode {
	O ye heights of heav'n, a -- dore Him;
	An -- gel hosts, His prais -- es sing;
	All do -- min -- ions, bow be -- fore Him,
	And ex -- tol our God and king;
	Let no tongue on earth be si -- lent,
	Ev -- ery voice in con -- cert ring,
	Ev -- er -- more and ev -- er -- more.
}
stanzaf = \lyricmode {
	Christ, to Thee, with God the Fa -- ther,
	And, O Ho -- ly Ghost, to Thee,
	Hymn and chant and high thanks -- giv -- ing
	And un -- wear -- ied prais -- es be,
	Hon -- our, glo -- ry and do -- min --ion
	And e -- ter -- nal vic -- tor -- y,
	Ev -- er -- more and ev -- er -- more.
}

\score {	%\transpose d c
	   \context ChoirStaff <<
		\context Staff ="upper"  { \clef "G" 
			
			<<
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
		\lyricsto "sop" \context Lyrics = "stanza-6" {
			\set stanza = "6."
				\stanzaf }
		\context Staff = "lower"  { \clef "F"
			
			<<
			\global
			\tenor
			\bass
		>>}
	>>
	\layout{
		indent = 0.0\pt
		\context {
			\Staff
			      \remove "Time_signature_engraver"
			
		    }
	}
	
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 96 4)
      }
    }


}

