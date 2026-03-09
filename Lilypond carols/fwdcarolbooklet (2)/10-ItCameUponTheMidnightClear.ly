\header {
	filename = "ItCameUponTheMidnightClear.ly"
	enteredby = "Gordon Gilbert"
	composer = "Edward Storrs Willis, 1819-1900"
	poet = "Edmund Hamilton Sears, 1810-1876"
	date=""
	title = "It Came Upon the Midnight Clear"
	metre = "Carol 86.86D"
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2011/Dec/12"
}

\version "2.15.19"

\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}
global= {

	\time 6/4
    \key a \major
    #(set-global-staff-size 20)

     \partial 4
   
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	\relative {
	e4 cis'2 b4 b( a) fis e2 fis4 e2
	e4 fis( gis) a a( b) cis b2. ~ b2
	cis4 cis2 gis4 b( a) fis e2 fis4 e2
	e4 fis2 fis4 gis( fis) e a2. ~ a2
	cis4 cis2 cis,4 cis( dis) eis fis2 gis4 a2
	cis4 b( a) gis fis( gis) fis e2. ~ e2
	e4 cis'2 gis4 b( a) fis e2 fis4 e2 
	e4 fis2 fis4 gis( fis) e a2. ~ a2 \bar "||"
}}

alto=\context Voice = "alto"   {
	\voiceTwo
	\relative {
	cis4 cis2 cis4 d2 d4 cis2 d4 cis2 
	cis4 d2 d4 dis2 dis4 e2. ~ e2
	e4 cis2 cis4 d2 d4 cis2 d4 cis2 
	e4 d2 d4 d2 d4 cis2. ~ cis2
	cis4 cis2 cis4 cis2 cis4 cis2 cis4 cis2
	cis4 e2 e4 dis2 dis4 e2. ~ e2
	d4 cis2 cis4 d2 d4 cis2 d4 cis2
	e4 d2 d4 d2 d4 cis2. ~ cis2
}}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	\relative {
	e,4 e2 eis4 fis2 gis4 a2 e4 e2
	a4 a2 a4  a2 a4 gis2. ~ gis2
	a4 e2 eis4 fis2 gis4 a2 e4 e2
	a4 a2 b4 b( a) gis a2. ~ a2
	cis,4 cis2 eis4 eis( fis) gis fis2 eis4 fis2
	fis4 gis( cis) b a( b) a gis2. ~ gis2
	gis4 e2 eis4 fis2 gis4 a2 e4 e2
	a4 a2 b4 b( a) gis a2. ~ a2
}}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	\relative {
	a,4 a2 a4 a2 a4 a2 gis4 a2
	a4 d( e) fis fis2 b,4 e2. ~ e2
	a,4 a2 a4 a2 a4 a2 gis4 a2
	cis4 d2 b4 e2 e4 a,2. ~ a2
	cis4 cis2 cis4 cis2 b4 a2 cis4 fis2
	a,4 b2 b4 b2 b4 e2. ~ e2
	e4 a,2 a4 a2 a4 a2 gis4 a2
	cis4 d2 b4 e2 e4 a2. ~ a2
}}
accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	It came up -- on the mid -- night clear,
	That glor -- ious song of old,
	From an -- gels bend -- ing near the earth
	To touch their harps of gold:
	'Peace on the earth, good -- will to men
	From Heav'n's all -- grac -- ious King!'
	The world in sol -- emn still -- ness lay
	To hear the an -- gels sing.
}

stanzab = \lyricmode {
	Still throuh the clo -- ven skies they come
	With peace -- ful wings un -- furl'd;
	And still their heav'n -- ly mu -- sic floats
	O'er all the wea -- ry world;
	A -- bove its sad and low -- ly plains
	They bend on hov'r -- ing wing,
	And ev -- er o'er its Ba -- bel sounds
	The bless -- ed an -- gels sing.
}

stanzac = \lyricmode {
	But with the woes of sin and strife
	The world has suf -- fered long;
	Be -- neath the an -- gel strain have rolled
	Two thou -- sand years of wrong;
	And man, at war with man, hears not
	The love song which they bring;
	O hush the noise, ye men of strife,
	And hear the an -- gels sing.
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

