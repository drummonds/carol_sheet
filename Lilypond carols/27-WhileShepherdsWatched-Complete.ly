\header {
  filename = "WhileShepherdsWatched-Complete.ly"
  enteredby = "Gordon Gilbert"
  composer = "Est's Psalmes, 1592"
  poet = "Nahum Tate, 1700"
  date="1751"
  title = "While Shepherds Watched"
  metre = "Winchester Old C.M."
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Humphrey Drummond"
  maintainerEmail = "hum3@drummond.info"
  lastupdated = "2021/Dec/11"
}

\version "2.15.19"

\paper {
  #(set-paper-size "a4")
}
global= {

  \time 4/4
  \key g \major

  \partial 4
  % \skip 1 * 20 \bar "||"

}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative {
    g'4 b4. b8 a4 g4 c4 c4 b4 \bar "||" \break
    a4  b4 d4 d4 cis4 d2. \bar "||" \break
    b4  e4. d8 c4 b4 a4 g4 fis4 \bar "||"  \break
    b4  a4 g4 g4 fis4 g2. \bar "||"
  }
}

accomp=\chordmode {
 r4 g1 d2:7 g4
 d4:7 e2:m d4 a d2.
 g4 c1 a2:m d4
 d g2. d4:7 g2.

}



stanzaa = \lyricmode {
  While she -- pherds watched their flocks by night,
  All seat -- ed on the ground,
  The an -- gel of the Lord came down,
  And glo -- ry shone a -- round.
}

stanzab = \lyricmode {
  'Fear not,' said he for migh -- ty dread
  Had siezed their trou -- bled mind;
  'Glad ti -- dings of great joy I bring
  To you and all man -- kind.
}

stanzac = \lyricmode {
  'To you, in Da -- vid's town, this day
  Is born of Da -- vid's line
  A Sav -- iour, who is Christ the Lord;
  And this shall be the sign:
}

stanzad = \lyricmode {
  'The heaven -- ly Babe you there shall find
  To hu -- man view dis -- played,
  All mean -- ly wrapped in swa -- thing bands,
  And in a man -- ger laid.'
}
stanzae = \lyricmode {
  Thus spake the ser -- aph; and forth -- with
  Ap -- peared a shin -- ing throng
  Of an -- gels, prai -- sing God, who thus
  Ad -- dressed their joy -- ful song:
}

stanzaf = \lyricmode {
  'All glo -- ry be to God on high,
  And to the earth be peace;
  Good will hence -- forth from heaven to men
  Be -- gin, and ne -- ver cease!'
}

\score {
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

