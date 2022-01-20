m =: <;._2 fread 'data/20.txt'
pattern =: '#'=>{.m
image =: '#'=>}.}.m
pad =: 0,0,~0,.0,.~]
pad1 =: 1,1,~1,.1,.~]
reduce =: {{ pattern {~ > (#.@,) each (1,: 3 3) <;._3 y }}
step =: {{ reduce@u@u }}

NB. Alternate 0- and 1-padding to simulate "external" squares flipping each step
echo +/, pad1 step pad step image
echo +/, (pad1 step pad step)^:25 image
exit''
