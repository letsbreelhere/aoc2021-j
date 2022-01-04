start =: "."0 ;._2 fread './data/11.txt'

dirs =: }. , { ;~ 0 1 _1
rot =: |.!.0

flash =: monad define
  (y ~: 0) * (9 >: y) * y + +/ > rot&(9 < y) each dirs
)
step =: [: flash^:_ >:

echo +/ , 0 = {{ step^:y start }} i. 101
echo > }. {{(step >{.y) ; >:>}.y }}^:{{*+/,>{.y}}^:_ ] start;0
exit''
