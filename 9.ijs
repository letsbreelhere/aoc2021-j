m =: "."0 > cutLF fread './data/9.txt'

NB. Rotate a table's columns by x, blanking with _ rather than cycling leftover columns
rot =: |.!._"0 _

lowMask =: m < <./ (1 |: _1 1 rot |: m) , _1 1 rot m
lowPoints =: (, lowMask) # , m
echo +/ >: lowPoints
