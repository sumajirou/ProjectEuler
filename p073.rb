require 'prime'
def phi(n)
  n.prime_division.inject(n) do |result,pe|
    result * (pe[0] - 1) / pe[0]
  end
end

limit = 12_000
count = 0
4.upto(limit) do |d|
  min = d/3+1
  max = (d-1)/2
  min.upto(max) do |n|
    count += 1 if d.gcd(n) == 1
  end
end
puts count
# 7295372
# [Done] exited with code=0 in 5.857 seconds

