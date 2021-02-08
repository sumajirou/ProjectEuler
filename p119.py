import itertools
import math
def sumdigit(n):
  if n == 0:
    return 0
  return n%10 + sumdigit(n//10)

# count = 1
# for n in itertools.count(10):
#   sd = sumdigit(n)
#   if sd == 1:
#     continue
#   x = sd
#   while x < n:
#     x *= sd
#   if x == n:
#     print(count,n)
#     if count == 30:
#       break
#     count+=1

def f(exp):
  for n in itertools.count(9,9):
    if n-9 >= (math.floor(exp*math.log10(n))+1)*9:
      return n

result = []
for exp in itertools.count(2):
  nmax = f(exp)
  for n in range(2,nmax+1):
    x = n**exp
    if n == sumdigit(x):
      result.append((x,{n:exp}))
  if len(result) >= 40:
    break

result = sorted(result)
print(result)
print(result[29][0])


