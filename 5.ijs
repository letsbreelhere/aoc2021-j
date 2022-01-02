f =: > cutLF fread './data/5.txt'
coords =: ".  > (0 2&{)"1 <;.1"1 ' ',"1 f
straight =: (#~ +/@|:@(=/)"2) coords
NB. Brute force. Slow af
NB.ordered =: /:~"1 |:"2 straight
NB.onLine =: {{ +/*./1=|:> (<"1 y) (I. each)"1 x }}
NB.max =: >:>./>./>./ straight
NB.echo +/+/ 1< > (onLine&ordered) each {;~ i. max

linePts =: {{ (({.y)&+)"1(*-~/y)&*"0 i.>:>./|-/y }}
straightPts =: linePts each <"2 straight
echo +/ 1 < > # each </.~ ; <"1 each straightPts

allPts =: linePts each <"2 coords
echo +/ 1 < > # each </.~ ; <"1 each allPts
exit''
