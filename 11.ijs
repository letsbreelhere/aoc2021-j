start =: "."0 ;._2 fread 'data/11.txt'

dirs =: }. , { ;~ 0 1 _1
rot =: |.!.0

flash =: {{ (* y * 9 >: y) * y + +/ > rot&(9 < y) each dirs }}
step =: [: flash^:_ >:

echo +/ , 0 = step^:(i. 101) start
echo > }. ((step@>@[) ; >:@>@])/^:{{*+/,>{.y}}^:_ ] start;0
exit''
