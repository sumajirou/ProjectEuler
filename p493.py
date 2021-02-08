import math

def perm(n,r):
  return math.factorial(n)//math.factorial(n-r)

def comb(n,r):
  return math.factorial(n)//math.factorial(n-r)//math.factorial(r)

F20 = math.factorial(20)
def f(ns):
  return F20 // math.prod([math.factorial(n) for n in ns])

result = 0
for color in range(2,7+1):
  result += color * sum([f(ns) for ns in itertools.product(range(1,11),repeat=color) if sum(ns) == 20]) * comb(7,color)

C7020 = math.factorial(70) //math.factorial(50)//math.factorial(20)
print( result / C7020 )
print( result , C7020 )
