'pts instrs' =: (LF,LF) splitstring fread 'data/13.txt'
pts =: ". each LF splitstring pts
cap =: u:@(-&32)@(3&u:)
instrs =: |. |. each (('fold'&,@cap@{.);2&}.) each 11 }. each cutLF instrs
p =: |: 1 pts } 0 $~,~>:>./;pts

foldY =: {{ (x{.y) +. |. x {. (>:x) }. y }}
foldX =: {{ (x&foldY)&.|: y }}

firstFold =: ". ' ' joinstring ; ({: instrs ) , <<'p'
echo +/+/firstFold
folds =: ". ' ' joinstring ; instrs , <<'p'
echo folds { 7 u: ' █'
exit''
