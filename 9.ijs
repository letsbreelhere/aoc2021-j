m =: "."0 > cutLF fread './data/9.txt'

NB. Rotate a table's columns by x, blanking with _ rather than cycling leftover columns
rot =: |.!._"0 _

lowMask =: m < <./ (1 |: _1 1 rot |: m) , _1 1 rot m
lowPoints =: (, lowMask) # , m
echo +/ >: lowPoints

NB. Min, but leave 9s as they are
modMin =: {{ x&<.`] @. (y=9) y }}
basinStep =:  {{ (<./ (1 |: _1 1 rot |: y) , _1 1 rot y) modMin"0 y }}
basinMap =: 9 ~: basinStep^:_ m

basinPoints =: (, # (,@{@(i.each@<"0@$))) basinMap
ds =: 1 0 ; _1 0 ; 0 1 ; 0 _1

dfs =: dyad define "1 1
  results =. (#~ (e.&y)) (x&+ each ds)
  if. 0=#results do. a: return. end.
  s =. results
  while. #s do.
    without =. y -. results
    results =. (<x), results, , (> {. s) dfs without
    s =. }. s
  end.
  ~. (#~ ~:&a:) results
)

NB. In for a penny...
dfss =: monad define
  points =. y
  res =. a:
  while. #points do.
    set =. (>{.points) dfs (}. points)
    points =. (}. points) -. set
    res =. set;res
  end.
)

echo */ 3 {. \:~ > # each dfss basinPoints
exit''
