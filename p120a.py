# 二項定理で計算する。
# nが偶数のとき2 nが奇数のとき2an
# nが奇数でさらにaが偶数のときrはa*(a-2) aが奇数のときrはa*(a-1)

def f(a):
    if a % 2 == 0:
        return a*(a-2)
    return a*(a-1)

print(sum([f(x) for x in range(3,1001)]))
