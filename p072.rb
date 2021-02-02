require 'prime'
def phi(n)
  n.prime_division.inject(n) do |result,pe|
    result * (pe[0] - 1) / pe[0]
  end
end

limit = 1_000_00
p 2.upto(limit).map{|n| phi(n)}.sum
exit



# 303963552391