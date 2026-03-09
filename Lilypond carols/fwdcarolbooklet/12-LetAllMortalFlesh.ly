\header {
	filename = "LetAllMortalFlesh.ly"
	enteredby = "Gordon Gilbert"
	composer = "Irish Traditional Melody"
	poet = "French Traditional Carol"
	date="from Liturgy of St. James"
	title = "Let All Mortal Flesh"
	metre = "Picardy 87.87.87"
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2005/Jan/6"
}
\paper{
	#(set-paper-size "letter")
	top-margin = 0.5\in
	bottom-margin = 0.54\in
	ragged-bottom = ##t
}
\version "2.15.19"


global= {
    \time 4/4 \key d \minor
    \skip 1*3 \bar "||"
    \skip 1*3 \bar "||"
    \skip 1*3 \bar "||"
    \skip 1*3 \bar "||"
    \skip 1*4 \bar "||"
    \skip 1*3 \bar "||"

}
%shorthand for Skip Lyric
%sl =  { \skip 4 }

sop = \context Voice = "sop"   {
	\voiceOne
	d'4 e' f' g' |
	a'2 <f' a'>4( <e' g'>) |
	a'2 a'
	
	a'4 a' bes' c'' |
	bes'2 a'4( g') |
	a'1
	
	d'4 e' f' g' |
	a'2 a'4( g') |
	a'2 a'
	
	a'4 a' bes' c'' |
	bes'2 a'4( g') |
	a'1
	
	a'4 a' d'' a' |
	g'2. f'4 |
	d' f' a' f' |
	e'1
	
	a'4 a' d'' a' |
	g'2 e'4( f')
	d'1

}

alto = \context Voice = "alto"   {
	\voiceTwo
	<a d'>1 ~ |
	<a d'>2 d'|
	<c' f'>1 
	
	f'2 ees' |
	<d' f'>2. e'4 |
	<cis' e'>1
	
	d' |
	<c' f'>2 <bes d'> |
	<d' f'>1 
	
	f'2 ees' |
	<d' f'>2. e'4 |
	<c' f'>1
	
	<d' a'>1 |
	<bes d'> |
	d' |
	c'
	
	<d' a'> |
	<bes d'>2 <g c'>4( <a c'>) |
	a1
	
}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	f1 ~ |
	f |
	f
	
	f ~ |
	f2. e4 ~ |
	e1
	
	f ~ |
	f2. e4 |
	d1
	
	f ~ |
	f2. e4 |
	f1
	
	d ~ |
	d |
	a2. bes4 |
	g1
	
	d ~ |
	d2 c |
	f1
	

}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	d1 ~ |
	d2 bes, |
	f,1
	
	d2 c4 a, |
	bes,1 |
	a,
	
	bes, |
	f,2 g |
	d,1
	
	d2 c4 a |
	bes,1 |
	f,
	
	fis, |
	g, |
	<d f> |
	<c g> 
	
	f, |
	g,2 c4 a, |
	<d, d>1
	
}

accomp=\chordmode {
	
}



stanzaa = \lyricmode {
	Let all mor -- tal flesh keep __ si -- lence,
	and with fear and trem -- bling stand;
	Pon -- der no -- thing earth -- ly mind -- ed,
	for with bless -- ing in His hand,
	Christ our God to us a -- proach -- _ _ _ eth,
	our full ho -- mage to de -- mand.
}

stanzab = \lyricmode {
	King of kings, yet born of Ma -- ry,
	as of old on earth he stood,
	Lord of lords, in hu -- man ves -- ture,
	in the Bo -- dy and the Blood,
	He will give to all the faith -- _ _ _ ful
	His own Self for heav'n -- ly Food.
}


stanzac = \lyricmode {
	Rank on rank the host of hea -- ven 
	spreads its van -- guard on the way,
	As the Light of light de -- scend -- eth 
	from the realms of end -- less day,
	That the powers of hell may van -- _ _ _ ish
	as the dark -- ness clears a -- way.
}

stanzad = \lyricmode {
	At His feet the six wing-ed Ser -- aph;
	Che -- ru -- bim with sleep -- less eye,
	Veil their fac -- es to the Pres -- ence,
	as with cease -- less voice they cry,
	Al -- le -- lu -- ia, Al -- le -- lu -- _ _ _ ia,
	Al -- le -- lu -- ia, Lord most high.
}

\score {
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

