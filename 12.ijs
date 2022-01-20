graph =: (, |. each)<;._1@('-'&,) each cutLF fread 'data/12.txt'
nodes =: ~.> {. each graph
neighbors =: ({. each graph) </. ;(}. each graph)
caps =: u: (u:inv'A') + i.26

pathsPrime =: dyad define
  'graph visited prev' =. x
  if. (y = <'end') do. echo ',' joinstring |. 'end';prev end.
  nbrs =. -.&(<'start') >neighbors {~ nodes i. y
  if. (y = <'end') do. 1 return. end.
  if. (0=#nbrs) do. 0 return. end.
  visited =. (y&,)`] @. (*/ (>y) e. caps) visited
  if. 1<>./#/.~visited do. nbrs =. nbrs -. visited end.
  +/ (graph ; visited ; <y,prev) pathsPrime"_ 0 nbrs
)
paths =: (graph;(>a:);(>a:))&pathsPrime

echo paths <'start'
exit''
