import sympy as sp
N = 100000

def rad(n):
  return sp.prod(sp.factorint(n).keys())

result = [(n,rad(n)) for n in range(1,N+1)]
result = sorted(result, key = lambda x: x[1])
print(result)
print(result[10000-1])
