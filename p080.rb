require 'BigDecimal'

sum = 0
1.upto(100) do |n|
  next if n == Math.sqrt(n).floor**2
  sqrtn = BigDecimal(n).sqrt(100)
  sum += sqrtn.to_s[2..101].chars.map(&:to_i).sum
end
p sum

# 40886
# [Done] exited with code=0 in 0.521 seconds
