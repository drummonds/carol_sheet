\header {
	filename = "AwayInAManger-Complete.ly"
	enteredby = "Gordon Gilbert"
	composer = "W.J. Kirkpatrick, arr. R. Vaughan Williams 1931"
	poet = "Anon."
	date="1751"
	title = "Away In A Manger"
	metre = "Cradle Song 11. 11. 11. 11."
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2005/Dec/07"
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

	\time 3/4
    \key f \major
   
    \partial 4
   % \skip 1 * 20 \bar "||"
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	c'4 f' f' g'8( a') f'4 f' a'8( bes') c''4 c'' d'' bes'2 \bar "||"
	g'8( a') \bar "|"bes'4 bes' c'' a' a' f'8( a') g'4 d' f' e'2 \bar "||"
	c'4  \bar "|" f' f' g'8( a') f'4 f' a'8( bes') c''4 c'' d'' bes'2 \bar "||"
	g'8( a') \bar "|" bes'4 bes' c'' a' a' f'8( a') g'4 d' e' f'2 \bar "||"


}

alto=\context Voice = "alto"   {
	\voiceTwo
	c'4 c' r d'8 e' f'4 r e' f' a' g' f' e'
	d'8 e' f'4 r g' f' r c' d' r r e'2
	c'4 a d'4. e'8 c'4 r f' e'2 f'4 f' e'
	d' e' f' g' f'2 c'4 d'4 r <g c'>4 <a c'>2
	
}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	c8 bes, a,4 r bes,8 c d4 r c a, r bes, g,2
	bes,8 c d4 r e f r a, bes, r2 c4 d
	e f d bes,8 c a,4 r f8 g a2 d4 g2
	bes8 a g4 f e f d a, bes,2 c4 f,2
}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	
}

accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	A -- way in a man -- ger, no crib for a bed,
	The lit -- tle Lord Je -- sus laid down His sweet head,
	The stars in the bright sky looked down where He lay,
	The lit -- tle Lord Je -- sus a -- sleep on the hay.
}

stanzab = \lyricmode {
	The cat -- tle are low -- ing, the Ba -- by a -- wakes,
	But lit -- tle Lord Je -- sus no cry -- ing He makes;
	I love Thee, Lord Je -- sus; look down from the sky,
	And stay by my bed -- side till mor -- ning is nigh.
}

stanzac = \lyricmode {
	Be near me, Lord Je -- sus, I ask Thee to stay
	Close by me for -- e -- ver, and love me I pray.
	Bless all the dear chil -- dren in Thy ten -- der care,
	And fit us for hea -- ven, to live with Thee there.
}

stanzad = \lyricmode {
	
}
stanzae = \lyricmode {
	
}

stanzaf = \lyricmode {
	
}

\score {
	\transpose f ees
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

