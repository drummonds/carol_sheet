
\header {
  filename = "OComeAllYeFaithful-Complete.ly"
  enteredby = "Gordon Gilbert"
  composer = "J.F. Wades' Cantus Diversi"
  poet = "from the Latin"
  date="1751"
  title = "O Come All Ye Faithful"
  metre = "Adeste Fideles PM"
  meter = \metre
  copyright = "Public Domain"
  style = "Hymn"
  mutopiacomposer = \composer
  mutopiapoet=\poet
  maintainer = "Humphrey Drummond"
  maintainerEmail = "hum3@drummond.info"
  lastupdated = "2011/Dec/11"
}

\version "2.22.1"

\paper {
  #(set-paper-size "a4")
}
global= {

  \time 4/4
  \key g \major
  \partial 4
  \skip 1 * 20 \bar "||"

}

sop = \context Voice = "sop"    {
  \voiceOne
  \relative {
    g'4 g2 d4 g4 a2 d,2 \bar "||" 
    b'4 a4 b4 c4 b2 a4  \bar "||" \break
    g4 g2 fis4 e4 fis4( g4) \bar "||" 
    a4 b4 fis2( e4.) d8 d1   \bar "||" \break
    d'2 c4
    b4 c2 b2 a4 b4 g4 a4 fis2 d4 \bar "||" \break 
    g4 ^\markup \line { \large \italic "Refrain"}  g4 fis4 g4 a4 g2 d4
    b'4 b4 a4 b4 c4 b2 a4 \bar "||" \break 
    b4 c4 b4 a4 g4 fis2 g4( c4) b2( a4.) g8 g2.
  }
}

% alto=\context Voice = "alto"   {
%   \voiceTwo
%   ees'4 ees'2 ees'4 ees' ees'2 ees' ees'4 ees' ees' f' ees'2 ees'4 c'
%   c'( d') ees' d' ees'2 ees'4 ees' ees'2 d'4. ees'8 ees'2. r4
%   ees'2 f'8 g' aes'4 aes'( g') aes'2 ees'4 ees' f' f' ees'2 ees'4
%   ees'4 ees'1 ~ ees'2. ees'4 ees' ees' ees' ees' ees'2 ees'4 aes' g'
%   aes' ees' ees'8 d' ees'2 ees'4( f') ees'2 ~ ees'4. c'8 c'2.

% }

% tenor = \context Voice = "tenor"   {
%   \voiceOne
%   c'4 c'2 c'4 c' des'2 bes aes4 bes aes aes aes2 g4 aes
%   aes2 bes4 bes bes( aes) g ees bes2( aes4.) g8 g2. r4
%   c'2 des'4 ees' des'2 ees' ees'4 aes c' des' bes2 g4
%   c' c' bes c' des' c'2. aes4 aes g aes bes aes2 g4
%   ees' ees' ees' bes bes bes2 aes aes( g4.) aes8 aes2.
% }

% bass = \context Voice = "bass"   {
%   \voiceTwo
%   aes4 aes2 aes4 aes aes2 g aes4 g aes des ees2 ees4
%   f4 f2 ees4 bes, ees c g, aes, bes,2 bes,4. bes,8 ees1
%   c'2 bes4 aes bes2 aes g4 aes f des ees2 ees4 r4
%   r1 r2. aes4 aes g aes des ees2 ees4 aes bes aes g f ees des c des
%   ees2 ees4. aes8 aes2.
% }

accomp=\chordmode {
  r4 g1 d:7 g g2 d4 
  g4 e2:m d4 a4 d4*3 g4 d2 a2:7 d1
  g d2:7 g d e:m d4*3
  r4 g4 d4:7 g4 d:7 g1 g4 d:7 g d:7 g2 d4 e:m
  a1:m d2 c g d:7 g}




stanzaa = \lyricmode {
  O come, all ye faith -- ful, Joy -- ful and tri -- um -- phant,
  O come ye, O come ye to Beth -- le -- hem;
  Come and be -- hold Him Born the King of An -- gels:

  O come, let us a -- dore Him,
  O come, let us a -- dore Him,
  O come, let us a -- dore Him, __ Christ __ the Lord!
}

stanzab = \lyricmode {
  _ God of _ God, _ Light _ of _ Light, _ _
  Lo, He ab -- hors not the Vir -- gin's womb;
  Ve -- ry _  God, Be -- got -- ten, not cre -- a -- ted;
}

stanzac = \lyricmode {
  _ Sing, choirs of an -- gels, Sing in ex -- ul -- ta -- tion, _
  Sing, all ye ci-ti -- zens of heav'n a -- bove,
  Glo -- ry to God _ In _ the _ high -- est;
}

stanzad = \lyricmode {
  _ See how the Shep -- herds, sum -- moned to His cra -- dle,
  _ Lea -- ving their flocks-draw nigh with low -- ly fear;
  We too will thi -- ther Bend our joy -- ful foot -- steps;
}

stanzae = \lyricmode {
  _ Yea, Lord, we greet Thee, Born this hap -- py mor -- ning,
  _ Je -- su, to Thee be _ glo -- ry given;
  Word of the Fa -- ther, Now in flesh ap -- pear -- ing;
}

stanzaf = \lyricmode {
  _ Lo! star -- led chief -- tains, Ma -- ji, Christ a -- dor -- ing
  _ Of -- fer Him frank-in -- cense and gold and myrrh;
  We to the Christ Child Bring our hearts' o -- bla -- tions:
}

\score {
  \context ChoirStaff <<
    \context ChordNames \accomp
    \unset ChoirStaff.melismaBusyProperties
    \context Staff ="upper"  {
      \clef "G" <<
        \global
        \sop
        % \alto
      >>
    }

    \context Lyrics = "LyrA" \lyricsto "sop"  { \stanzaa }
    \context Lyrics = "LyrC" \lyricsto "sop"  { \stanzac }
    \context Lyrics = "LyrE" \lyricsto "sop"  { \stanzae }
    % \context Staff = "lower"  {
    %   \clef "F"<<
    %     \global
    %     \tenor
    %     \bass
    %   >>
    % }
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

