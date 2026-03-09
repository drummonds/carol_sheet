\header {
  filename = "SilentNight-Complete.ly"
  enteredby = "Gordon Gilbert"
  composer = "Franz Gruber, 1818"
  poet = "Rev. Joseph Mohr, 1818"
  date="1818"
  piece = "Trans John Freeman Young, 1859"
  title = "Silent Night"
  metre = "Silent Night P.M."
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

\version "2.21.1"

\paper {
  #(set-paper-size "a4")
}
global= {

  \time 3/4
  \key c \major

  % \partial 4
  % \skip 1 * 20 \bar "||"

}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative {
    g'4.( a8) g4 e2. g4.( a8) g4 e2. \bar "||" \break
    d'2 d4 b2. c2 c4 g2. \bar "||" \break
    a2 a4 c4.( b8) a4 g4. a8 g4 e2.\bar "||" \break
    a2 a4 c4. b8 a4 g4. a8 g4 e2. \bar "||" \break
    d'4 d d f d b c2. e2. \bar "||" \break
    c4 g e g f d c2. (c2.) \bar "||"

  }
}


accomp=\chordmode {
  c2.*4
  g2. g:7 c2.*2
  f c
  f c
  g2. g:7
  c2.*3 g2.:7 c2.2
}



stanzaa = \lyricmode {
  Si -- lent night! Ho -- ly night!
  All is calm, all is bright.
  Round yon Vir -- gin Mo -- ther and Child
  Ho -- ly In -- fant so ten -- der and mild,
  Sl -- eep in hea -- ven -- ly pea -- ce,
  Sl -- eep in hea -- ven -- ly peace.
}

stanzab = \lyricmode {
  Si -- lent night! Ho -- ly night!
  Shep -- herds quake at the sight
  Glor -- ies stream from hea -- ven af -- ar
  Heav -- enly ho -- sts sing All -- e -- lu -- ia!
  Chr -- ist the sav -- iour is bo -- rn,
  Chr -- ist the sav -- iour is born.
}

stanzac = \lyricmode {
  Si -- lent night! Ho -- ly night!
  Son of God, love's pure light
  Rad -- iant beams from thy ho -- ly face
  With the dawn of re -- deem -- ing gr -- ace,
  Jes -- us, Lord, at th -- y bi -- rth!
  Jes -- us, Lord, at th -- y birth!
}

stanzad = \lyricmode {

}
stanzae = \lyricmode {

}
stanzaf = \lyricmode {

}

\score {
  \header {
    title = "localtitle"
    subtitle = "localsubtitle"
    composer = "localcomposer"
    arranger = "localarranger"
    instrument = "localinstrument"
  }
  \context ChoirStaff <<
    \context ChordNames \accomp
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  {
      \clef "G" <<
        \global
        \sop
      >>
    }

    \context Lyrics = "LyrA" \lyricsto "sop"  { \stanzaa }
    \context Lyrics = "LyrB" \lyricsto "sop"  { \stanzab }
    \context Lyrics = "LyrC" \lyricsto "sop"  { \stanzac }
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

