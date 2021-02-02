import sys
import itertools
import time


class Point:

  def __init__(self, x, y):
    """    """
    self.x = x
    self.y = y

  def __str__(self) -> str:
    return f'Point({self.x}, {self.y})'

  def __add__(self, other):
    return Point(self.x + other.x, self.y + other.y)

  def __sub__(self, other):
    return Point(self.x - other.x, self.y - other.y)

  def norm2(self):
    return self.x ** 2 + self.y ** 2


class Triangle:
  def __init__(self, p, q, r):
    self.p = p
    self.q = q
    self.r = r

  def __str__(self) -> str:
    return f'Triangle({self.p}, {self.q}, {self.r})'

  def isright(self):
    a = (self.p - self.q).norm2()
    b = (self.q - self.r).norm2()
    c = (self.r - self.p).norm2()
    a, b, c = sorted([a, b, c])
    return a + b == c


def calc(size):
  points = (Point(x, y) for x in range(size + 1) for y in range(size + 1) if (x, y) != (0, 0))
  triangles = (Triangle(Point(0, 0), q, r) for q, r in itertools.combinations(points, 2))
  result = [item for item in triangles if item.isright()]
  # for x in result:
  # print(x)
  return len(result)


def diff_seq(xs):
  return [x - y for x, y in zip(xs[1:], xs)]


def all_diff_seq(xs):
  while xs != []:
    print(xs)
    xs = diff_seq(xs)


def main():
  if len(sys.argv) != 2:
    print('Need 1 argument.')
    return

  limit = int(sys.argv[1])

  xs = [calc(i) for i in range(limit + 1)]
  all_diff_seq(xs)
  print('3*i*i')
  xs = [int((v - 3 * i * i) / 2) for i, v in enumerate(xs)]
  all_diff_seq(xs)

  # print('size, answer')
  # for i in range(limit + 1):
  #   start = time.time()
  #   print(i, calc(i) - i * i * 3)
  #   if time.time() - start >= 1:
  #     print('over 1 seconds. timeout.')
  #     break


if __name__ == "__main__":
    main()
