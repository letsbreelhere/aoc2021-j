start =: "."0 > cutLF fread './data/11.txt'

dirs =: (, { ;~ 1 0 _1) -. < 0 0
rot =: |.!.0"0 _
rotc =: rot&.|:
rot2 =: {{ ({. x) rotc (}. x) rot y}}

flash =: monad define
  (y ~: 0) * (9 >: y) * y + +/ ; rot2&(9 < y) each dirs
)
step =: [: flash^:_ >:

echo +/ , 0 = {{ step^:y start }} i. 101
NB. Not ideal; I can iterate to a steady state but it's a bit more annoying to
NB. find the iteration number without just guessing.
echo ({{ step^:y start }} i. 1000) i. (10 10 $ 0)
exit''
