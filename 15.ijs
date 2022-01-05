m =: "."0;._2 fread 'data/15.sample.txt'

minimalSum =: monad define
  obliques =. ((_*(0=])) + ]) ></. y
  midMins =. {{ x + (y <. _1 |.!._ y) }}/ ((<.@-:@#) }. ]) obliques
  topHalf =. (<midMins) ,~ ((<.@-:@#) {. ]) </.y
  {{ (>x) + 2 <./\ >y }}/ topHalf
)

NB. These seem to be off by a few - one in the part 1 case, more in part 2
echo minimalSum m
inc =: {{ ]`(-&9) @. (>&9) x + y }}
bigMap =: ,./ ,./ (+/~i.5) inc"0 _ ] m
echo minimalSum bigMap
