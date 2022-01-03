(9!:3) 2 NB. Boxed representation

column =: {{ >(<(i.#y); x){y }}
strsplit =: #@[ }.each [ (E. <;.1 ]) ,

NB. y*y upper triangular matrix
ut =: <:/~@i.
lt =: |:@ut
