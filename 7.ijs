init =: {. ". > cutLF fread './data/7.txt'
costs =: +/ |: (|@(init&-))"0 >: i. >./ init
echo <./costs

costs =: +/ |: (-:@(* >:)@|@(init&-))"0 >: i. >./ init
echo x: <./costs
exit''
