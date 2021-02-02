# 友愛数（ゆうあいすう、英: amicable numbers
require 'prime'
require_relative 'util'
# 自身を除く約数の和
def f(n)
  sumdivisors(n) - n
end

Limit = 1_000_000
def amicablechain(n)
  list = [n]
  loop do
    m = f(n)
    # mが完全数、素数、上限を超えたら友愛数ではない
    return [] if m == n or m.prime? or m > Limit
    if list.include?(m)
      list = list.drop_while{|item| item != m}
      # 友愛鎖の中の最小値の位置
      i = list.index(list.min)
      # 友愛鎖が最小値から始まるようにrotate
      return list.rotate(i)
    end
    list.push(m)
    n = m
  end
end

N = 1_000_000

list = []
4.upto(N) do |n|
  next if n.prime?
  chain = amicablechain(n)
  list.push(chain) unless chain == []
end

# 重複する友愛鎖は取り除く
list.uniq!
list.each do |item| p item end
p maxlen = list.max_by{|chain| chain.length}
p maxlen[0]

# [14316, 19116, 31704, 47616, 83328, 177792, 295488, 629072, 589786, 294896, 358336, 418904, 366556, 274924, 275444, 243760, 376736, 381028, 285778, 152990, 122410, 97946, 48976, 45946, 22976, 22744, 19916, 17716]
# 14316
# [Done] exited with code=0 in 47.215 seconds
