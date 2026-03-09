\header {
	filename = "GoodChristianMen-Complete.ly"
	enteredby = "Gordon Gilbert"
	composer = "German melody, 14th cent."
	poet = "Rev. John M. Neale, 1853"
	date=""
	title = "Good Christian Men Rejoice"
	metre = "In Dulci Jubilo P.M."
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
	#set-paper-size "letter"
	
}
global= {

	\time 6/8
    \key f \major
    #(set-global-staff-size 18)
     \partial 8
   % \skip 1 * 20 \bar "||"
    
}

sop = \context Voice = "sop"    {
	\voiceOne
	f'8 f'4 f'8 a'4 bes'8 c''4( d''8 c''4) \bar "||"
	c''8 f'4 f'8 a'4 bes'8 c''4( d''8 c''4) r8 \bar "||"
	c''4 d''8 c''4 bes'8 a'4 g'8 f'4. \bar "||"
	f'4. f' \bar "||"
	g'4 g'8 a'4 g'8 f'4 g'8 a'4 r8 \bar "||"
	c''4 d''8 c''4 bes'8 a'4 g'8 f'4 \bar "||"
	f'8 g'4 g'8 a'4 g'8 f'4 g'8 a'4 r8 \bar "||"
	d'4 d'8 e'4 e'8 f'4.( c'') \bar "||"
	a'4 a'8 g'4 g'8 f'4. r4 \bar "||"
}

alto=\context Voice = "alto"   {
	\voiceTwo
	c'8 d'4 c'8 f' e' d' c'4( f'8 e'4)
	f'8 d'4 c'8 f' e' d' c'4( f'8 e'4) r8
	f'4 f'8 e'4 e'8 f'4 e'8 f'4.
	f' f'
	d'4 g'8 f'4 e'8 f'4 f'8 f'4 r8
	f'4 f'8 f'4 e'8 f'4 e'8 d'4
	f'8 f'4 f'8 f'4 e'8 f'4 f'8 f'4 r8
	d'4 bes8 d'4 c'8 c'4.( f'4 e'8)
	f'4 f'8 f'4 e'8 f'4. r4
}	
	
tenor = \context Voice = "tenor"   {
	\voiceOne
	a8 bes4 a8 c'4 bes8 a4( bes8 g4)
	a8 bes4 a8 c'4 bes8 a4( bes8 g4) r8
	c'4 bes8 g4 c'8 c'4 bes8 a4.
	f a
	bes4 d'8 c'4 bes8 a4 bes8 c'4 r8
	c'4 bes8 c'4 c'8 c'4 bes8 a4
	c'8 d'4 d'8 c'4 bes8 a4 bes8 c'4 r8
	bes4 f8 g4 g8 f4.( a4 bes8)
	c'4 d'8 d'4 c'8 a4. r4
}
	
bass = \context Voice = "bass"   {
	\voiceTwo
	f8 f4 f8 f4 f8 f4. ~ f4
	f8 f4 f8 f4 f8 f4.( c4) r8
	a,4 bes,8 c4 c8 f4 c8 d4.
	f d
	g,4 bes,8 c4 c8 f4 f8 f4 r8
	a4 bes8 a4 g8 f4 c8 d4
	a,8 bes,4 bes,8 c4 c8 f4 f8 f4 r8
	bes,4 bes,8 bes,4 bes,8 a,4.( a4 g8)
	f4 d8 bes,4 c8 f4. r4
}
accomp=\chordmode {
 
}
stanzaa = \lyricmode {
	Good Christ -- ian men, re -- joice,
	With heart and soul and voice,
	Give ye heed to what we say:
	News! News!
	Je -- sus Christ is born to -- day
	Ox and ass be -- fore Him bow,
	And He is in the man -- ger now, 
	Christ is born to -- day!
	Christ is born to -- day!
}

stanzab = \lyricmode {
	Good Christ -- ian men, re -- joice,
	With heart and soul and voice;
	Now ye hear of end -- less bliss:
	Joy! Joy!
	Je -- sus Christ was born for this!
	He hath op'ed the heaven -- ly door,
	And man is bless -- ed ev -- er -- more.
	Christ was born for this!
	Christ was born for this!
}
stanzac = \lyricmode {
	Good Christ -- ian men, re -- joice,
	With heart and soul and voice;
	Now ye need not fear the grave:
	Peace! Peace!
	Je -- sus Christ was born to save!
	Calls you one and calls you all,
	To gain His ev -- er -- las -- ting hall:
	Christ was born to save,
	Christ was born to save.
}	
stanzad = \lyricmode {
	
}	
stanzae = \lyricmode {
	
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

