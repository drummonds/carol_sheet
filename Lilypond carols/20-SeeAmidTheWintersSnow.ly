\header {
	filename = "SeeAmidTheWintersSnow.ly"
	enteredby = "Gordon Gilbert"
	composer = "John Goss 1800-1880"
	poet = "Edward Caswall 1814-1878"
	date=""
	title = "See Amid the Winter's Snow"
	metre = "See Amid the Winter's Snow 77.77 with Refrain"
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2011/Dec/14"
}

\version "2.15.19"

\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}
global= {

	\time 4/4
    \key g \major
    #(set-global-staff-size 18)

     %\partial 4
   
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	\relative {
	g'4. ^ \markup \italic "Unison" a8 g4 fis e4. d8 d2
	g4 a c b b4. a8 a2
	g4. a8 g4 fis e4. d8 d2
	g4 a b c a4. g8 g2
	d'4. ^ \markup \italic "Refrain - Harmony" d8 c4 b a g fis2
	d'4. d8 c4 b a g fis2
	g4. a8 g4 fis e4. d8 d2
	d'4. b8 g4 c b a g2
	\bar "||"
}}

alto=\context Voice = "alto"   {
	\voiceTwo
	\relative {
	b2 c4 d g, a b c 
	d2 g g fis
	d4 b c d g a, b a
	b c d e c2 b
	g'4. g8 g4 g d d d2
	d4. g8 g4 g e d d2
	b4. b8 cis4 d d cis d2
	d4. d8 e4 g fis fis g2
}}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	\relative {
	g2 ~ g4 d e fis g a 
	b s e d d cis d2
	g,2. d4 e fis g a g1 ~ g4 fis g2
	b4. b8 e4 d c b a2
	g4. g8 e'4 d c b a2
	g4. g8 e4 d b' a8 g fis2
	g4. g8 g4 e' d c b2
}}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	\relative {
	g,2 a4 b c2 g
	g'4 fis e g d2. c4
	b4 g a b c2 g'4 fis
	e2 d4 c d2 g,
	g'4. g8 g4 g fis g d2
	b4. b8 c4 g a b8 c d2
	e4. e8 a,4 b g a d( c)
	b4. b8 c4 a d d <g g,>2
}}
accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	See a -- mid the win -- ter's snow,
	Born for us on earth be -- low;
	See the ten -- der Lamb ap -- pears,
	Pro -- mised from e -- ter -- nal years.
	Hail, thou ev -- er bless -- ed morn;
	Hail, re -- demp -- tion's hap -- py dawn;
	Sing through all Je -- ru -- sa -- lem,
	Christ is born in Beth -- le -- hem!
}

stanzab = \lyricmode {
	Lo, with -- in a man -- ger lies
	He who built the star -- ry skies;
	He who throned in height sub -- lime
	sits a -- mid the cher -- u -- bim.
}

stanzac = \lyricmode {
	Say, ye ho -- ly shep -- herds, say
	What your joy -- ful news to -- day;
	Were -- fore have ye left your sheep
	On the lone -- ly moun -- tain steep?
}

stanzad = \lyricmode {
	'As we watched at dead of night,
	Lo, we saw a won -- drous light;
	An -- gels sing -- ing ''Peace on earth''
	Told us of the Sav -- iour's birth.'
}
stanzae = \lyricmode {
	Sac -- red In -- fant, all di -- vine,
	What a migh -- ty love was Thine,
	Thus to come from high -- est bliss
	Down to such a world as this!
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

