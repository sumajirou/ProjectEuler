peter = [*1..4].repeated_permutation(9).map(&:sum)
    .group_by(&:itself).transform_values(&:length)
peter_total = peter.values.sum
peter_p = []
peter.each{|k,v| peter_p[k] = Rational(v,peter_total)}

colin = [*1..6].repeated_permutation(6).map(&:sum)
    .group_by(&:itself).transform_values(&:length)
colin_total = colin.values.sum
colin_p = []
colin.each{|k,v| colin_p[k] = Rational(v,colin_total)}

p peter
p peter_p
p peter_p[9..36].sum
puts
p colin
p colin_p
p colin_p[6..36].sum
puts

prob = 0
9.upto(36) do |n|
  prob += peter_p[n] * colin_p[6..n-1].sum
end
prob_draw = 0
9.upto(36) do |n|
  prob_draw += peter_p[n] * colin_p[n]
end
prob_lose = 0
6.upto(36) do |n|
  prob_lose += colin_p[n] * peter_p[9..n-1].sum
end

p prob
p prob_draw
p prob_lose
p prob.to_f
p prob_draw.to_f
p prob_lose.to_f

# 0.5731440767829801
# [Done] exited with code=0 in 0.17 seconds