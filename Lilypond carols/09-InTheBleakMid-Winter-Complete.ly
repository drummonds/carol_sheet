
\version "2.15.19"
\header {
  filename = "In the Bleak Mid-Winter -- Holst.ly"
  enteredby = "Gordon Gilbert"
  composer = "Gustav Holst"
  poet = "Christina Rossetti"
  date=""
  title = "In the Bleak Mid-Winter"
  metre = ""
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Humphrey Drummond"
  maintainerEmail = "hum3@drummond.info"
  lastupdated = "2021/Dec/11"
}



\paper {



  #(set-paper-size "letter")

  %ragged-bottom=##f
  %ragged-last-bottom=##f
}
global= {

  \time 4/4
  \key f \major
  #(set-global-staff-size 19)
  \partial 4



}

sop = \context Voice = "sop"    {
  \voiceOne

  a'4 a'4.( bes'8) c''4 a' g'4. ~ g'8 f'4 b'4\rest
  g'4. a'8 g'4 d' g'2.
  g'4 a'4. bes'8 c''4 a' g'4. ~ g'8 f'4
  f' g' a' g'4. f'8 f'2.
  f'4 bes'4. a'8 bes'4 c'' d'' d'' a'
  a' c''( a') g'( f') e'2.
  e'4 a'4. bes'8 c''4 a' g'2 f'4 b'\rest
  g'( a') g'4.( f'8) f'1

}

alto=\context Voice = "alto"   {
  \voiceTwo
  f'4 \slurDashed f'4.( f'8) f'4 c' d'4. ~ d'8 d'4 s4
  d'4. d'8 d'4 c' bes2.
  bes4 c'4. f'8 f'4 c' d'4. ~ d'8 d'4
  d' f' f' e'4. f'8 f'2.
  f'4 f'4. f'8 f'4 ees' d' ~ d' f'
  f' f' e' d' d' c'2.
  c'4 c'4. f'8 f'4 c' d'2 d'4 s4
  f'2 e'4. f'8 f'1
}

tenor = \context Voice = "tenor"   {
  \voiceOne
  c'4 \slurDashed c'4.( c'8) c'4 f a4. ~ a8 a4 d4\rest
  g4. d8 d4 f f2 e4
  e f4. c'8 c'4 f a4. ~ a8 a4
  a d' d' bes4. a8 a2.
  a4
  bes4. c'8 bes4 a bes ~ bes a
  a f c bes a g2.
  g4 f4. c'8 c'4 f a2 a4 d4\rest
  d'2 bes4. a8 a1
}

bass = \context Voice = "bass"   {
  \voiceTwo
  f4 \slurDashed f4.( g8) a4 f d4. ~ d8 d4 s4
  bes,4. c8 bes,4 a, g,2 c4
  c f4. g8 a4 f d4. ~ d8 d4
  d bes, ~ bes, c4. f8 f2.
  f4 d4. f8 d4 c bes, ~ bes, d
  d a, ~ a, bes, bes, c2.
  c4 f4. g8 a4 f d2 d4 s4
  bes,2 c4. f8 f1
}
accomp=\chordmode {

}



stanzaa = \lyricmode {
  \skip4 \set ignoreMelismata = ##t In the \unset ignoreMelismata bleak mid -- win -- ter
  Fros -- ty wind made moan,
  \skip4 Earth stood hard as I -- ron,
  \skip4 Wa -- ter like a stone;
  \skip4 Snow had fal -- len, snow on snow,
  \skip4 Snow on snow,
  \skip4 In the bleak mid -- win -- ter
  Long a -- go.

}

stanzab = \lyricmode {
  Our \set ignoreMelismata = ##t God, Heav'n \unset ignoreMelismata can -- not hold Him
  Nor __ \skip8 earth sus -- tain;
  \skip4 Heav'n and earth shall \set ignoreMelismata = ##t flee a \unset ignoreMelismata way
  \skip4 When He comes to reign;
  \skip4 In the bleak mid -- win \skip4 ter
  A \set ignoreMelismata = ##t sta -- ble \unset ignoreMelismata place-suf -- ficed
  The Lord \skip8 God Al -- might -- y
  Je -- sus Christ.

}
stanzac = \lyricmode {
  E \set ignoreMelismata = ##t nough for \unset ignoreMelismata Him, whom  \set ignoreMelismata = ##t che -- ru \unset ignoreMelismata  bim
  Wor -- ship night and day,
  A breast \skip8 -ful of milk And
  a man -- ger -- ful of hay;
  E -- nough for Him, whom an \skip4 -gels \skip4
  Fall down-be -- fore,
  The ox and ass and ca -- mel
  Which a -- dore.

}
stanzad = \lyricmode {
  \skip4 \set ignoreMelismata = ##t An -- gels \unset ignoreMelismata and arch -- an -- gels
  May have ga -- thered there,
  \skip4 Che -- ru -- bim and se -- ra-phim
  \skip4 Thronged \skip4 \skip 4. the air;
  But on \skip4 -ly His Mo \skip4 -ther \skip4
  \set ignoreMelismata = ##t In her maid -- en \unset ignoreMelismata bliss
  \skip4 Wor -- shipped the Be -- lov -- ed
  With a kiss.

}
stanzae = \lyricmode {
  \skip4 What can I give Him,
  Poor \skip8 as I am?
  \skip4 If I were a shep -- herd
  \skip4 I would bring a lamb,
  \skip4 If I were a Wise \skip4 Man
  \skip4 I-would do-my part,
  Yet what I can I give Him,
  Give my heart.

}
stanzaf = \lyricmode {

}

\score {
  \transpose f ees
  \context ChoirStaff <<
    % \context ChordNames \accomp
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  {
      \clef "G" <<
        \global
        \sop
        \alto
      >>
    }

    \context Lyrics = "LyrA" \lyricsto "sop"  { \stanzaa }
    \context Lyrics = "LyrB" \lyricsto "sop"  { \stanzab }
    \context Lyrics = "LyrC" \lyricsto "sop"  { \stanzac }
    \context Lyrics = "LyrD" \lyricsto "sop"  { \stanzad }
    \context Lyrics = "LyrE" \lyricsto "sop"  { \stanzae }
    \context Staff = "lower"  {
      \clef "F"<<
        \global
        \tenor
        \bass
      >>
    }
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

