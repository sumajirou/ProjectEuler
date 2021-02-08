import itertools
import math
def f(buf):
  def f1(patterns, last):
    return [ptn[:-1] + [ptn[-1]+last] for ptn in patterns]
  def f2(patterns, last):
    return [ptn + [last] for ptn in patterns]

  if len(buf) <= 1:
    return [[buf]]
  init = f(buf[:-1])
  last = buf[-1]
  return f1(init,last) + f2(init,last)

def g(ptn):
  return sum([int(x) for x in ptn])

def maesure(buf):
  import time
  start = time.time()
  f(buf)
  print(time.time()-start)

def main(imax):
  result = []
  for i in range(2,10**imax+1):
    n = i**2
    if i in [g(x) for x in f(str(n))]:
      print(n)
      result.append(n)

  print(result)
  print(sum(result))


# [[
#   [12],
#   [1,2],
# ],[
#   [123],
#   [1,23],
#   [12,3],
#   [1,2,3],
# ],[
#   [1234],
#   [1,234],
#   [12,34],
#   [1,2,34],
#   [123,4],
#   [1,23,4],
#   [12,3,4],
#   [1,2,3,4],
# ]]
