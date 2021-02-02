import sys
import math


class Point:
  def __init__(self, x, y):
    self.x = x
    self.y = y

  def __str__(self) -> str:
    return f'Point({self.x}, {self.y})'

  def __add__(self, other):
    return Point(self.x + other.x, self.y + other.y)

  def __sub__(self, other):
    return Point(self.x - other.x, self.y - other.y)

  def __mul__(self, other):
    return Point(self.x * other, self.y * other)


def calc(size):
  # 左下が直角のものと、x軸に辺を持ち右下が直角のものと、y軸に辺を持ち左上が直角のものを最初に数える。それぞれsize**2個ある。
  result = 3 * size**2
  # (1,1)から(size,size)までの格子点はsize**2個
  points = (Point(x, y) for x in range(1, size + 1) for y in range(1, size + 1))
  # 右下に直角がある三角形の個数
  count = 0
  for p in points:
    # armの長さ
    gcd = math.gcd(p.x, p.y)
    arm = Point(-p.y / gcd, p.x / gcd)
    # 第3の点は、Pを中心にOPから90度右に回転させた点に置く。Pから左上に腕が伸びているイメージ
    q = p + arm
    # qが範囲内か？
    while 0 <= q.x <= size and 0 <= q.y <= size:
      # 直角三角形ができる。
      count += 1
      # 角度はそのまま腕を伸ばす
      q += arm
  # y=xで反転させると同じことが言えるので結果を倍にする。
  result += count * 2
  return result


def main():
  if len(sys.argv) != 2:
    print('Need 1 argument.')
    return

  size = int(sys.argv[1])
  print(calc(size))


if __name__ == "__main__":
    main()

# [0, 3, 14, 33, 62, 101, 148, 207, 276, 353, 448, 547, 662, 785, 920, 1067, 1230, 1397, 1586, 1773, 1986]
