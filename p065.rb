require_relative 'util'

def cf2r(cf)
  cf.reverse.inject{|result,n| n + Rational(1,result)}
end

ecf = [*1..100].map do |n|
  if n == 1
    2
  elsif n % 3 == 0
    n/3*2
  else
    1
  end
end

p [*1..100]
p ecf
p cf2r(ecf)
p cf2r(ecf).numerator
p sumdigit(cf2r(ecf).numerator)
#=> 272