\header {
	filename = "TheFirstNowell=Complete.ly"
	enteredby = "Gordon Gilbert"
	composer = "Old English Carol, 17th cent."
	poet = "English trad. carol, 17th cent."
	date=""
	title = "The First Nowell"
	metre = "The First Nowell P.M."
	meter = \metre
	copyright = "Public Domain"
	style = "Hymn"
	mutopiacomposer = \composer
	mutopiapoet=\poet
	maintainer = "Gordon Gilbert"
	maintainerEmail = "gord@angel.eicat.ca"
	lastupdated = "2005/Dec/09"
}

\version "2.15.19"

\paper {
	#(set-paper-size "letter")
	% ragged-bottom=##f
	% ragged-last-bottom=##f
}
global= {

	\time 3/4
    \key d \major
    #(set-global-staff-size 18)
     \partial 4
   % \skip 1 * 20 \bar "||"
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	fis'8( e') d'4.( e'8) fis'( g') a'2 b'8( cis'') d''4  cis'' b' a'2 \bar "||"
	b'8 cis'' \bar "|" d''4 cis'' b' a' b' cis'' d'' a' g' fis'2 \bar "||"
	fis'8( e') \bar "|" d'4.( e'8) fis' g' a'2 b'8( cis'') d''4 cis'' b' a'2 \bar "||"
	b'8 cis'' \bar"|" d''4 cis'' b' a'( b') cis'' d''( a') g' fis'2 \bar "||"
	fis'8( ^ \markup { \large \italic Refrain} e') d'4.( e'8) fis'( g') a'2 d''8( cis'') b'2 b'4 a'2. \bar "||"
	d''4 cis'' b' a'( b') cis'' d''( a') g' fis'2 \bar "||"
	
}

alto=\context Voice = "alto"   {
	\voiceTwo
	d'4 a2 d'4 e'2 e'4 a' a' g' fis'2
	d'8 e' a'4( fis') g'a'( d') g' fis' fis' e' d'2
	cis'4 a2 d'8 d' e'2 e'4 a'( a') g' fis'2
	d'8 e' a'4( fis') g' a' g' g' fis' fis' e' d'2
	
	cis'4 a2 d'4 cis'2 fis'4 g'2 g'4 fis'2( a'4)
	fis' fis' g' fis'2 g'4 fis'2 e'4 d'2
}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	a8 g fis2 d'4 cis'2 b4 a a b8 cis' d'2
	b8a a4 a cis' d' b g a d' a a2
	a8 g fis2 d'8 d' d'4 cis' b a a b8 cis' d'2
	b8 a a4 a cis' d' d' e' a d' a  a2
	
	a8 g fis2 b4 a2 a4 b4. cis'8 d' e' fis'2 e'4 
	d' d' d' d'2 g4 a a a a2
}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	d4 d2 b,4 a,( a) g fis fis g d2
	g8 g fis4 d e fis g e fis8( g) a4 a d2
	a,4 d2 b,8 b, a,4( a) g fis fis g d2 
	g8 g fis4 d e fis( g) e fis8( g) a4 a, d2
	
	a,4 d2 b,4 fis2 d4 g4. a8 b( cis') d'2 cis'4 
	b a fis d'( d) e fis8 g a4 a, d2
}
accomp=\chordmode {
 
}



stanzaa = \lyricmode {
	The first Now -- ell the an -- gel did say
	Was to cer -- tain poor shep -- herds in fields as they lay;
	In fields where they lay, a -- keep -- ing their sheep,
	On a cold win -- ter's night that was so deep.
	% Refrain
	No -- well, No -- well, No -- well, No -- well
	Born is the King of Is -- ra -- el.
}

stanzab = \lyricmode {
	They look -- ed up and saw _ a star
	Shin -- ing in _ the east _ be -- yond _ them far
	And to the _ earth it gave _ great light,
	And _ so it con -- tin-ued both day and night.
}
stanzac = \lyricmode {
	And by  the light of that _ same star
	Three _ wise _ men came _ from coun _ -- try far;
	To seek for a king was their _ in -- tent
	And to fol -- low the star where -- ev-er it went.
}
stanzad = \lyricmode {
	This star drew nigh to the _ north west
	O'er _ Beth _ -- le -- hem _ it took _ its rest,
	And there it _ did both stop _ and stay
	Right _ o -- ver the place where Je -- sus lay.
}
stanzae = \lyricmode {
	Then en -- tered in those wise _ men three,
	Full _ rev _ -- 'rent -- ly _ u -- pon _ their knee,
	And of -- fer -- ed there in His _ pres -- ence
	Their _ gold _ and myrrh and frank -- in -- cense.
}
stanzaf = \lyricmode {
	Then let us all with one _ ac -- cord
	Sing _ prais _ -- es to _ our heav -- en -- ly Lord;
	That hath made _ heaven and earth _ of nought,
	And _ with _ His Blood man -- kind hath bought
}

\score {	\transpose d c
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
		\lyricsto "sop" \context Lyrics = "stanza-6" {
			\set stanza = "6."
				\stanzaf }
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

