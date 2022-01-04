start =: "."0 ;._2 fread './data/11.txt'

dirs =: (, { ;~ 1 0 _1) -. < 0 0
rot =: |.!.0"0 _
rotc =: rot&.|:
rot2 =: {{ ({. x) rotc (}. x) rot y}}

flash =: monad define
  (y ~: 0) * (9 >: y) * y + +/ ; rot2&(9 < y) each dirs
)
step =: [: flash^:_ >:

echo +/ , 0 = {{ step^:y start }} i. 101
echo > }. {{(step >{.y) ; >:>}.y }}^:{{*+/,>{.y}}^:_ ] start;0
exit''
