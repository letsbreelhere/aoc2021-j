DISP =: (9!:3)
BOX =: 2
TREE =: 4

column =: {&|:
strsplit =: #@[ }.each [ (E. <;.1 ]) ,

NB. y*y upper triangular matrix
ut =: <:/~@i.
lt =: |:@ut

chr =: 4&u:
ord =: 3&u:

NB. Rotate a table's rows by x, blanking with 0 rather than cycling leftover columns
rot =: |.!.0"0 _
NB. Same, but rotate columns
rotc =: rot&.|:
NB. `a b rot2 t` rotates t by a columns and b rows
rot2 =: {{ ({. x) rotc (}. x) rot y}}

pad=: 0,0,~0,.0,.~]
life =: {{ (=&3 +. y * (=&4)) > +/@, each (1,:3 3) <;._3 pad y }}
