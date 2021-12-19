forward =: 1 0 &* [ up =: 0 _1 &* [ down =: 0 1 &*
f =. ".> cutLF fread './data/2.txt'
echo */ +/ f

aim =: 0
depth =: 0
horiz =: 0
down =: 3 : 'aim =: aim + y'
up =: 3 : 'aim =: aim - y'
forward =: 3 : 'horiz =: horiz + y [ depth =: depth + aim * y'

f =. ".> cutLF fread './data/2.txt'
echo depth * horiz
exit''
