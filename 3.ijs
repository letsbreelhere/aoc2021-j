f =: '1'= > cutLF fread './data/3.txt'

gamma =: -:@#<+/
eps =: -.@gamma

echo */ #. > (gamma ; eps) f

cmpGamma =: {{ (x{gamma y) = x {"1 y }}
filterGamma =: {{ ((x&cmpGamma) # [) y }}
cmpEps =: {{ (x{eps y) = x {"1 y }}
filterEps =: {{ ((x&cmpEps) # [) y }}

cols =: #|:f

epsilonSeq =: {{ f [ F.. filterEps y }}
epsIterates =: , <"1 epsilonSeq \ i. cols
co2Rating =: #. > {: ((< cols $ 0) ~: epsIterates) # epsIterates

gammaSeq =: {{ f [ F.. filterGamma y }}
gammaIterates =: , <"1 gammaSeq \ i. cols
o2Rating =: #. > {: ((< cols $ 0) ~: gammaIterates) # gammaIterates

echo o2Rating * co2Rating
exit''
