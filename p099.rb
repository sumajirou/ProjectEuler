require_relative 'util'

beki = []
File.foreach("p099_base_exp.txt") do |line|
  beki.push(line.split(",").map(&:to_i))
end


print_matrix(beki)
p beki.map.with_index{|n,i| [n[1] * Math.log10(n[0]), i+1]}.sort[-1]

#=> 709