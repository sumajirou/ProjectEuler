import sympy as sp

n = 1
p = 2
while True:
  r = 2 * n * p % p**2
  if r > 10**10:
    break
  n += 2
  p = sp.nextprime(sp.nextprime(p))

print(n)
