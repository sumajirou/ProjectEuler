"""Problem 684 「桁和の逆算」 †
s(n) を，各桁の和が n となる最小の数と定義する． たとえば，s(10) = 19 である．
また， S(k)を， s(1) から s(k) までの総和と定義する． たとえば，S(20) = 1074 である．
さらに，フィボナッチ数列の一般項 fn を，f0 = 0, f1 = 1, fi = fi - 2 + fi - 1 (i ≧ 2) によって定める．
このとき，S(f2) から S(f90) までの総和を 1, 000, 000, 007 で割った余りを求めよ．"""

import sys
import time

P = 1_000_000_007


def s(n):
  q, r = divmod(n, 9)
  # return int(str(r) + '9' * q)
  return ((r + 1) * pow(10, q, P) - 1)


# def S(k):
#   return sum([s(n) for n in range(1, k + 1)]) % P


# S(40) 40 = 9*4+4
sum([
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    19, 29, 39, 49, 59, 69, 79, 89, 99,
    199, 299, 399, 499, 599, 699, 799, 899, 999,
    1999, 2999, 3999, 4999, 5999, 6999, 7999, 8999, 9999,
    19999, 29999, 39999, 49999
])

sum([54 - 9, 540 - 9, 5400 - 9])


def S(k):
  q, r = divmod(k, 9)
  # _, b = divmod(q, P - 1)
  result = 6 * pow(10, q, P) - 6 - 9 * q
  result += sum([s(n) for n in range(k - r + 1, k + 1)])
  return result % P


def fib(i):
  a, b = 0, 1
  for _ in range(i):
    a, b = b, a + b
  return a


def main():
  if len(sys.argv) != 2:
    print('Need 1 argument.')
    return
  limit = int(sys.argv[1])

  result = 0
  start = time.time()
  for x in range(2, limit + 1):
    lap_start = time.time()
    n = fib(x)
    m = S(n)
    result = (result + m) % P
    lap_time = time.time() - lap_start
    print(f'fib({x})={n} S({n})={m} result= {result} time: {lap_time}')
    if lap_time >= 10:
      print('over 10 sec')
      break

  print('time:', time.time() - start)


if __name__ == "__main__":
    main()
