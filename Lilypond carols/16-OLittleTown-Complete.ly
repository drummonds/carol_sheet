\header {
  filename = "OLittleTown-Complete.ly"
  enteredby = "Humphrey Drummond"
  composer = "Traditional Arr. by R Vaughan Williams"
  poet = "Bishop Phillips Brooks, 1868"
  date="1868"
  title = "O Little Town of Bethlehem"
  metre = "St. Louis 86. 86. 76. 86."
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  instrument = "Simple accordion"
  arranger = "arr Humphrey Drummond"
  maintainer = "Humphrey Drummond"
  maintainerEmail = "hum3@drummond.info"
  lastupdated = "2024/Dec/14"
}

\version "0.1.1"

\paper {
  #(set-paper-size "a4")

}
global= {

  \time 4/4
  \key f \major
  #(set-global-staff-size 18)
  \partial 4

}

sop = \context Voice = "sop"      \fixed c' {
  \voiceOne
  c4 \bar "|" f4 f4 f4 g4 a8 g8 a8 (bes8 c'4) \break  
  a \bar "|" bes a8 (f) g4 g f2.  \break
  c4 \bar "|" f4 f4 f4 g4 a8 g8 a8 (bes8 c'4) \break  
  a \bar "|" bes a8 (f) g4 g f2.  \break
  f8 a \bar "|" c'4. d'8 (c') bes (a g) f (g a) bes (c'4) \break  
  c4 \bar "|" f a g  f c  \break
  c4 \bar "|" f4 f4 f4 g4 a8 g8 a8 (bes8 c'4) \break  
  a \bar "|" bes a8 (f) g4 g f2. \bar "||" \break

}

accomp=\chordmode {
  s4 |  f2 f2 | f2 c4 
  c4 | f2 c2 | f2. 
  c4 |  f2 f2 | f2 c4 
  c4 | f2 c2 | f2. c4 |
  f2 bes2 | f2 c2 | f2 c2 | f2. c4 |
  f2 f2 | f2 c2 | f2 c2 | f1 |
}



stanzaa = \lyricmode {\tiny
  O lit -- tle town of Beth -- le -- hem
  How still we  see thee lie;
  A -- bove thy deep and dream -- less sleep
  The si -- lent stars go by:
  Yet in thy dark streets shin -- eth
  The e -- ver -- las -- ting Light;
  The hopes and fears of all the years
  Are met in thee to -- night.
}

stanzab = \lyricmode {\tiny
  For Christ is born of Ma --  ry;
  And ga -- thered all a -- bove,
  While mor -- tals sleep, the an -- gels keep
  Their watch of won -- dering love.
  O mor -- ning stars, to -- ge -- ther
  Pro -- claim the ho -- ly birth,
  An prai -- ses sing to God the King,
  And peace to men on earth!
}

stanzac = \lyricmode {\tiny
  How si -- lent -- ly, how si-lent -- ly
  The won -- drous gift is giv'n!
  So God im -- parts to hu -- man hearts
  The bles -- sings of His heaven:
  No ear may hear His com -- ing;
  But in this world of sin,
  Where meek souls will re -- ceive Him, still
  The dear Christ en -- ters in.
}

stanzad = \lyricmode {\tiny
  O Ho -- ly Child of Beth-le -- hem,
  Des -- cend to us we pray;
  Cast out our sin, and en -- ter in;
  Be born in us to -- day.
  We hear the heaven -- ly an -- gels
  The great glad ti -- dings tell:
  O come to us, a -- bide with us,
  Our Lord Em -- man -- u -- el.
}

\score {
  % \transpose g f
  \context ChoirStaff <<
    \context ChordNames \accomp
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  {
      \clef "G" <<
        \global
        \sop
      >>
    }

    \context Lyrics = "LyrA" \lyricsto "sop"  {\stanzaa }
    \context Lyrics = "LyrB" \lyricsto "sop"  {\stanzab }
    \context Lyrics = "LyrC" \lyricsto "sop"  {\stanzac }
    \context Lyrics = "LyrD" \lyricsto "sop"  {\stanzad }
  >>
  \layout{
    indent = 0.0\pt
    \context {
      \ChordNames
      \override ChordName.style = #'american
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

