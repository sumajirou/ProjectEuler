require 'prime'
Fact = [1,1]
def fact(n)
  Fact[n] ||= n * fact(n-1)
end

def S(p)
  [*1..5].map{|k| fact(p-k) % p}.sum % p
end

limit = 10**4
sum = 0
Prime.each(limit) do |p|
  next if p < 5
  sum += S(p)
end
p sum