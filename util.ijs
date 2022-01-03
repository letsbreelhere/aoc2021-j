boxy =: (9!:3) 2
tree =: (9!:3) 4

column =: {&|:
strsplit =: #@[ }.each [ (E. <;.1 ]) ,

NB. y*y upper triangular matrix
ut =: <:/~@i.
lt =: |:@ut

chr =: 4&u:
ord =: 3&u:
