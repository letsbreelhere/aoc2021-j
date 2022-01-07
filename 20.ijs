m =: <;._2 fread 'data/20.txt'
pattern =: '#'=>{.m
image =: '#'=>}.}.m
pad=: 0,0,~0,.0,.~]
step =:  {{ pattern {~ > (#.@,) each (1,: 3 3) <;._3 pad pad pad pad y }}
echo +/, step step image
NB. Hack - this subarray selects just the piece corresponding to the "central" image
echo +/,> (3 3 ,: 105 105) <;.0  step step image
