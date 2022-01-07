m =: <;._2 fread 'data/20.txt'
pattern =: '#'=>{.m
image =: '#'=>}.}.m
pad =: 0,0,~0,.0,.~]
pad1 =: 1,1,~1,.1,.~]
step =:  {{ pattern {~ > (#.@,) each (1,: 3 3) <;._3 pad pad y }}
step1 =:  {{ pattern {~ > (#.@,) each (1,: 3 3) <;._3 pad1 pad1 y }}

NB. Less hacky - alternate 0- and 1-padding to simulate "external" squares
NB. flipping each step
echo +/, step1 step image
echo +/, (step1@step)^:25 image
exit''
