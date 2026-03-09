\header {
  filename = "TwelveDaysOfChristmas.ly"
  enteredby = "Humphrey Drummond"
  composer = "Traditional English Carol"
  poet = "Traditional"
  date = ""
  piece = "Arrangement by Kyle Coughlin"
  title = "The Twelve Days of Christmas"
  metre = "Irregular"
  meter = \metre
  copyright = "Traditional"
  style = "Carol"
  mutopiacomposer = \composer
  mutopiapoet = \poet
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

global = {
  \time 4/4
  \key f \major
}

sop = \context Voice = "sop" {
  \voiceOne
  \relative c' {
    \time 4/4
    \key f \major
    \partial 4

    % "On the ___ day of Christmas my true love gave to me"
    c8 c | c4 f8 f f4 e8 f | g a b g a4. b8 | f4 f2
    \time 3/4
    g8 g |
    % gifts section (repeat for each gift in verses 7-12)
    g4 g g |
    \time 4/4
    % "five golden rings"
    f4 f a b | c1 |
    \time 3/4
    % "four calling birds, three French hens"
    f,4 f f8 f | a4 a a |
    \time 4/4
    % "two turtle doves and a partridge in a pear tree"
    g4 g g g8 g | g g f f f f f f | f2. r4
    \bar "|."
  }
}

accomp = \chordmode {
  \partial 4
  s4 | f2 c:7 | f1 | f2 f4
  c4 | c2. |
  f2 g:7 | c1 |
  f2. | bes2. |
  c1 | f2 bes | f4 c:7 f2 |
}

\score {
  \context ChoirStaff <<
    \context ChordNames \accomp
    \context Staff = "upper" {
      \clef "G" <<
        \global
        \sop
      >>
    }
  >>

  \layout {
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

\markup {
  \column {
    \line { " " }
    \line { \italic "See TwelveDaysOfChristmas-lyrics.txt for full lyrics" }
    \line { " " }
    \line { \italic "For verses 7-12, repeat the gift phrase for each gift before 'five golden rings'" }
  }
}
