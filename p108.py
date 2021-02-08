import sympy as sp
import itertools

for n in itertools.count(1):
    c = sp.divisor_count(n**2)//2+1
    if c >= 1000:
        print(n)
        break
