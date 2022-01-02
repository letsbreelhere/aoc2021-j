f =: > cutLF fread './data/8.txt'
readouts =: (;:@}.@,) each ('|' = f) <;.1"1 f
echo +/ (e.&(2 4 3 7)) > # each ; readouts

NB. Deduction is for nerds. Try every permutation of the 7 segments instead
digits =: ('abcdefg'&e.) each 'abcefg' ; 'cf' ; 'acdeg' ; 'acdfg' ; 'bcdf' ; 'abdfg' ; 'abdefg' ; 'acf' ; 'abcdefg' ; 'abcdfg'
signals =: ('abcdefg'&e.) each each (;:@}:) each ('|'=f) <;.2"1 f
solved =: {{ */ +/ y E."0 _ ] digits }}
isSolution =: {{ */ solved x (A. each) y }}
solvingPermutation =: {{ ((isSolution&y)"0 (i.!7)) i. 1 }}
permutations =: solvingPermutation each signals
echo +/ ; 10 #. each (digits&i.) each permutations (A. each each) ('abcdefg'&e.) each each readouts
exit''
