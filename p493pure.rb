# colors = [*0..69].combination(20) do |comb|
#   comb.map{|n| n / 10}.uniq.size # num of color
# end.group_by(&:itself).transform_values(&:size)
# limit = 5
# colors = [0]*8
# ([*0..6]*limit).sort.combination(limit*2) do |comb|
  # i = comb.uniq.size # num of color
  # colors[i] += 1
# end

# [*0..69].combination(20) do |comb|
#   i = comb.map{|n| n / 10}.uniq.size # num of color
#   colors[i] += 1
# end

# p colors

require_relative 'util'
# 総玉数、1色の玉数、使っていい色数
def f(n,m,c)
  if c == 1
    if n > m
      return 0
    else
      return C(m,n)
    end
  end
  1.upto(c).map{|d| f(n-c,m-1,d)}.sum
end


answer = f(20,10,7)

わけわかめ