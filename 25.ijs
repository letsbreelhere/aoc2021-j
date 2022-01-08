m =: '.>v' i. ,;._2 fread 'data/25.txt'
n =: 0
step =: {{
  map =. y
  easts =. ((1 = map) * 0~:1|."1 map) + (0=map)* 1 =_1|."1 map
  map =. easts + 2 * 2=map
  souths =. 2*((2 = map) * 0~:1|.map) + (0=map)* 2 =_1|.map
  easts + souths
}}

echo >{: {{ (step >{.y);(>{.y);(>: >2{y) }}^:{{ */, (1{y) ~: {.y}}^:_ (step m);m;1
exit''
