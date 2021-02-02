def f(a, b):
  x, y = a, b
  while True:
    # ここの無限ループが終わる保証がないので微妙だが、aが1e12の範囲だと連分数近似の中に必ず存在するようだ。
    if x * (x - 1) == 2 * y * (y - 1):
      break
    x, y = x + a, y + b

  return x, y


def main():
  # a:discの総数
  # b:青discの数
  # √2の1次連分数近似(a/b)でもある
  a, b = 3, 2
  i = 1
  while True:
    if i % 2 == 1:
      # 奇数番目の連分数近似は√2より大きいので適さない。2/xを計算して√2より小さくする。
      x, y = f(2 * b, a)
    else:
      x, y = f(a, b)
    print(y, '/', x)
    if 1e12 <= x:
      print('The answer is', y)
      return
    # 次の連分数近似
    a, b = a + 2 * b, a + b
    i += 1


if __name__ == "__main__":
  main()
