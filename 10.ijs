f =: cutLF fread './data/10.txt'

open  =: '([{<'
close =: ')]}>'
score =: 3 57 1197 25137

firstIllegal =: monad define
  s =. >a:
  for_ijk. y do.
    if. ijk e. open do.
      s =. ijk , s
    else.
      if. 0=#s do. < ijk return. end.

      top =. {. s
      s =. }. s

      if. top ~: (close i. ijk) { open do.
        < ijk return. break.
      end.
    end.
  end.
  <s
)

illegalChars =: ; (#~ {{1 = # >y}}) each firstIllegal each f
echo +/ {{(close i. y) { score}} (#~ ' '&~:) > illegalChars

completions =: > firstIllegal each ; (#~ {{1 ~: # >y}}) each firstIllegal each f

score =: {{ (5*x) + >: open i. y }}

completionScores =: > {{x+y*5}}/each >: each (open&i.) each completions
echo ((<.@-:@#) { ]) /:~ completionScores
