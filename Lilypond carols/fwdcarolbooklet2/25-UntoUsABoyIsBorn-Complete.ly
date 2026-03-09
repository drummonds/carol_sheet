\header {
	filename = "UntoUsABoyIsBorn-Complete.ly"
	enteredby = "Gordon Gilbert"
	composer = "from Piae Cantiones, 1582"
	poet = "15th c. carol tr. from Latin by Cn. Percy Dearmer"
	date=""
	title = "Unto Us A Boy Is Born"
	metre = "Puer Nobis Nascitur 76.77."
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2005/Dec/10"
}

\version "2.15.19"

\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}
global= {

	\time 4/4
    \key d \major
    #(set-global-staff-size 18)
     %\partial 2
   % \skip 1 * 20 \bar "||"
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	d'4 e' fis' g' fis' e' d' d' \bar "||"
	a'4 a' b' cis'' d''2 d''\bar "||"
	d''4 e'' cis'' d'' b' a' a'\bar "||"
	fis' \bar "|" a' g' fis' e' d'( e' fis' g'a' g' fis' e' d'2) d'\bar "||"
}

alto=\context Voice = "alto"   {
	\voiceTwo
	d'2. b4 cis'2 d'
	d'4 d' d' g' g'2 fis'
	a'4 b' a' fis' g' e' fis'
	d' fis' e' d' cis' b cis' d' b a b cis'2 d'4 b a2
}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	fis4 g a g a g fis2
	a4 fis g g a1
	d'4 b e' d' e' cis' cis'
	d' a b a g fis e d e fis g a g fis g fis2
}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	d2. e4 a,2 d
	fis4 d g e d1
	fis4 g a b g a fis
	b fis g a a, b,2. e4 a,1 d
}
accomp=\chordmode {
 
}
stanzaa = \lyricmode {
	Un -- to us a Boy is born! _
	King of all cre -- a -- tion,
	Came He to a world for -- lorn,
	The Lord of ev -- ery na -- tion.
}

stanzab = \lyricmode {
	Cra -- dled in a stall was He
	With slee -- py cows and ass -- es
	But the ve -- ry beasts could see
	That He all men sur -- pass -- es
}
stanzac = \lyricmode {
	He -- rod then with fear was filled:
	'A prince', he said, 'in Jew -- ry!'
	All the lit -- tle boys he killed
	At beth -- lehem in his fu -- ry.
}	
stanzad = \lyricmode {
	Now may Ma -- ry's Son, who came
	So long a -- go to love us,
	Lead us all with hearts a -- flame
	Un -- to the joys a -- bove us.
}	
stanzae = \lyricmode {
	He the Source and He the End! _
	Let the or -- gan thun -- der,
	While our hap -- py voi -- ces rend
	The jo -- cund air a -- sun -- der!
}
stanzaf = \lyricmode {
	
}

\score {	%\transpose d c
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
      tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }


}

