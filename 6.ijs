NB. Brute
init =: {. ". > cutLF fread './data/6.txt'
step =: {{ ((+/ 0=y) # 8) , (7&+)`]@.(>:&0) <: y }}
echo # step^:80 init

NB. Less brute
init =: (+/@(init&=))"0 i. 9
step =: {{ (0 0 0 0 0 0 , ({. y) , 0 0) + (1 |. y) }}
echo +/ step^:256 init

exit''
