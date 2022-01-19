graph =: (, |. each)<;._1@('-'&,) each cutLF fread 'data/12.txt'
nodes =: ~.> {. each graph
neighbors =: ({. each graph) </. ;(}. each graph)
caps =: u: (u:inv'A') + i.26

pathsPrime =: dyad define
  'graph visited prev' =. x
  nbrs =. >neighbors {~ nodes i. y
  if. (y = <'end') do. 1 return. end.
  if. (0=#nbrs) do. 0 return. end.
  visited =. (y&,)`] @. (*/ (>y) e. caps) visited
  +/ (graph ; visited ; prev) pathsPrime"_ 0 (nbrs -. visited)
)
paths =: (graph;(>a:);(>a:))&pathsPrime

echo paths <'start'
exit''
