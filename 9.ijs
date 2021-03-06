m =: "."0 > cutLF fread './data/9.txt'

rot =: |.!._"0 _

minNeighbors =: <./ (1 |: _1 1 rot |: m) , _1 1 rot m
lowMask =: m < minNeighbors
lowPoints =: (, lowMask) # , m
echo +/ >: lowPoints

NB. Min, but leave 9s as they are
modMin =: <.`] @. (9=])
basinMap =: 9 ~: (minNeighbors&(modMin"0))^:_ m

basinPoints =: (, # (,@{@(i.each@<"0@$))) basinMap
ds =: 1 0 ; _1 0 ; 0 1 ; 0 _1

dfs =: dyad define "1 1
  results =. (#~ (e.&y)) (x&+ each ds)
  if. 0=#results do. >a: return. end.
  for_ijk. results do.
    without =. y -. results
    results =. (<x), results, , (> ijk) dfs without
  end.
  ~. results
)

NB. In for a penny...
dfss =: monad define
  points =. y
  res =. >a:
  while. #points do.
    set =. (>{.points) dfs (}. points)
    points =. (}. points) -. set
    res =. set;res
  end.
)

echo */ 3 {. \:~ > # each dfss basinPoints
exit''
