import sympy as sp
import itertools

def ahoaho():
  dmax = 0
  for n in itertools.count(1):
    c = sp.divisor_count(n**2)
    d = c//2+1
    if dmax < d:
      # print(f"n={n}\tc={c}\td={d}\t{sp.factorint(n)}")
      print(f"n={n}\tc={c}\td={d}\t{sp.factorint(n)}\t{sum(sp.factorint(n).values())}")
      dmax = d
    if dmax >= 1000:
      break


from collections import Counter
from functools import reduce
from operator import add

def f(n):
  values = Counter(sp.factorint(n).values()).values()
  primes = [2]
  for x in values:
    primes.append(sp.nextprime(primes[-1],x))
  return [n*p for p in primes]

def g(n):
  return sp.divisor_count(n**2)//2+1

def main(cmax):
  nlist = [1]
  pool = set()
  n,c = 1,1
  print(f"n: {n}\tc: {c}")
  while c<cmax:
    pool = pool | set([(n,g(n)) for n in f(nlist[-1])])
    pool = {(n,c) for n,c in pool if c > g(nlist[-1]) and n > nlist[-1]}
    n,c = min(pool)
    nlist.append(n)
    print(f"n: {n}\tc: {c}")


