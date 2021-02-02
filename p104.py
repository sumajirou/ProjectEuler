import sys
import math
import time


def pandigital(x):
  return all(d in str(x) for d in '123456789')


def f(x):
  if x < 1e8:
    return False

  tail = x % 10**9
  if not pandigital(tail):
    return False

  head = str(x)[:9]
  if not pandigital(head):
    return False

  return True


def fib(i):
  a, b = 0, 1
  for _ in range(i):
    a, b = b, a + b
  return a


def fib_head9(i):
  """上9桁のみのフィボナッチ数列"""
  a, b = 0, 1
  for _ in range(i):
    a, b = b, a + b
    if a >= 10 ** 20:
      a = int(a / 10)
      b = int(b / 10)
  return int(str(a)[:9])


def fib_tail9(i):
  """下9桁のみのフィボナッチ数列"""
  a, b = 0, 1
  for _ in range(i):
    a, b = b, (a + b) % 10 ** 9
  return a


def fib_both9_pandigital(limit):
  """上9桁と下9桁のフィボナッチ数列を同時に計算し、どちらもパンデジタルであるフィボナッチ数を表示"""
  tail_a, tail_b = 0, 1
  head_a, head_b = 0, 1
  for i in range(limit):
    if pandigital(tail_a):
      head = str(head_a)[:9]
      if pandigital(head):
        print(f'The answer is {i} ({head}...{tail_a})')
        return

    tail_a, tail_b = tail_b, (tail_a + tail_b) % 10 ** 9
    head_a, head_b = head_b, head_a + head_b
    if head_a >= 10 ** 20:
      head_a = int(head_a / 10)
      head_b = int(head_b / 10)

  print('limited')


def measure():
  x = int(sys.argv[1])

  start = time.time()
  result = fib(x)
  end = time.time()
  print(f'fib({x}):\t\t{str(result)[:9]}...{str(result)[-9:]}:\t{end - start} (s)')

  start = time.time()
  result = fib_head9(x)
  end = time.time()
  print(f'fib_head9({x}):\t{result}:\t\t{end - start} (s)')

  start = time.time()
  result = fib_tail9(x)
  end = time.time()
  print(f'fib_tail9({x}):\t{result}:\t\t{end - start} (s)')


def main():
  limit = 10 ** int(sys.argv[1])
  fib_both9_pandigital(limit)


if __name__ == "__main__":
  # measure()
  main()
