import math
E = 1504170715041707
P = 4503599627370517
# E = 159
# P = 257


def f(e, p):
  return math.ceil(p / e) * e % p


def main(e, p):
  coins = [e]
  while coins[-1] > 1:
    n = f(e, p)
    coins.append(n)
    e, p = n, e
  print(coins)
  print(sum(coins))


main(E, P)
