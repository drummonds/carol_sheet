\header {
  filename = "OnceInRoyal-Complete.ly"
  enteredby = "Gordon Gilbert"
  composer = "H.J. Gauntlett, 1858"
  poet = "Cecil Frances Alexander, 1848"
  date="1848"
  title = "Once In Royal David's City"
  metre = "Irby 87.87.77."
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

\version "2.16.0"

\paper {
  #(set-paper-size "a4")
  % ragged-bottom=##f
  % ragged-last-bottom=##f
}
global= {

  \time 4/4
  \key f \major
  #(set-global-staff-size 17)
  %\set Staff.minimumVerticalExtent = #'(-4 . 4)
  \partial 2
  % \skip 1 * 20 \bar "||"

}

sop = \context Voice = "sop"    {
  \voiceOne
  c'4 e' f'4. f'8 f'( e') f'( g') g'4 f' \bar "||"  \break
  f' a' c''4. a'8 a'( g') f'( e') f'2 \bar "||" \break
  c'4 e' f'4. f'8 f'( e') f'( g') g'4 f' \bar "||" \break
  f' a' c''4. a'8 a'( g') f'( e') f'2 \bar "||" \break
  d''4 d'' c''4. f'8 bes'4 bes' a'2 \bar "||" \break
  d''4 d'' c''4. a'8 a'( g') f'( e') f'2 \bar "||" \break
}

accomp=\chordmode {
  c2 f2 c2 c4:7 f4 
  f2 f2 c2:7 f2 
  c2 f2 c2 c4:7 f4
  f2 f2 c2:7 f2
  bes2 f2 g2:m f2 
  bes2 f2 c2:7 f2
  
  }

stanzaa = \lyricmode {
  Once in roy -- al Da -- vid's ci -- ty
  Stood a low -- ly cat -- tle shed,
  Where a mo -- ther laid her ba -- by
  In a man -- ger for His bed:
  Ma -- ry was that mo -- ther mild
  Je -- sus Christ her lit -- tle Child.
}

stanzab = \lyricmode {
  He came down to earth from hea -- ven
  Who is God and Lord of all,
  And His shel -- ter was a sta -- ble
  And his cra -- dle was a stall;
  With the poor, and mean, and low-ly
  Lived on earth our Sav -- iour holy.
}
stanzac = \lyricmode {
  And, through all His won -- drous child -- hood
  He would hon -- our and o -- bey,
  Love, and watch the low -- ly mai -- den
  In whose gen -- tle arms He lay:
  Christ -- ian child -- ren all must be
  Mild, O -- bed -- ient, good as He.
}
stanzad = \lyricmode {
  For He is our child -- hood's pat -- tern,
  Day by day like us He grew;
  He was lit -- tle, weak, and help -- less,
  Tears and smiles like us He knew;
  And He feel -- eth for our sad-ness,
  And He shar -- eth in our glad-ness
}
stanzae = \lyricmode {
  And our eyes at last shall see Him,
  Through His own re -- deem -- ing love,
  For that Child so dear and gen -- tle
  Is our Lord in heaven a -- bove;
  And He leads His child -- ren on
  To the place where He is gone.
}
stanzaf = \lyricmode {
  Not in that poor low -- ly sta -- ble,
  With the ox -- en stand -- ing by,
  We shall see Him; but in hea -- ven,
  Set at God's right hand on high;
  When like stars His child -- ren crowned
  All in white shall wait a -- round.
}

\score {
  %\transpose d c
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

    \context Lyrics = "LyrA" \lyricsto "sop"  {\stanzaa }
    \context Lyrics = "LyrB" \lyricsto "sop"  {\stanzab }
    \context Lyrics = "LyrC" \lyricsto "sop"  {\stanzac }
    \context Lyrics = "LyrD" \lyricsto "sop"  {\stanzad }
    \context Lyrics = "LyrE" \lyricsto "sop"  {\stanzae }
    \context Lyrics = "LyrF" \lyricsto "sop"  {\stanzaf }
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }


}

