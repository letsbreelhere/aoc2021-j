f =: <;._2 fread 'data/14.txt'
strsplit =: #@[ }.each [ (E. <;.1 ]) ,

t =: |: > ' -> '&strsplit each 2 }. f
operands =: {. t
results =: }. t
start =: <"0 > {. f

lookup =: {{ (({. x) i. y) { ,}. x }}
step =: {{ }: ,|: y ,: t lookup 2<\ ,>y }}

echo (>./ - <./) #/.~ ; step^:10 start

double =: [: , 2&#"0
initPairs =: ; each 2 <\ start
initCounts =: x: #/. ; each 2 <\ start
stepPairs =: [: , {{ 2<\ 1 A. ; y , t lookup y }}"0

stepFast =: monad define
  pairs =. stepPairs > {. y
  counts =. double > }. y

  pairs ((~.@[) ; [+//.]) counts
)

final =: stepFast^:40 initPairs ; initCounts
echo (>./ - <./) >. -: (;;{.final) +//. double ;}. final
