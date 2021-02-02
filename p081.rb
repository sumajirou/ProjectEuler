# frozen_string_literal: true

def print_matrix(mat)
  margin = mat.transpose.map{|arr| arr.map{|item| item.to_s.size}.max}
  mat.each do |arr|
    arr.each_with_index do |item,i|
      print " %#{margin[i]}d" % item
    end
    puts
  end
  puts
end
cell5 = [
  [131, 673, 234, 103, 18],
  [201, 96, 342, 965, 150],
  [630, 803, 746, 422, 111],
  [537, 699, 497, 121, 956],
  [805, 732, 524, 37, 331]
]
cell = []
File.foreach("p081_matrix.txt") do |line|
  cell.push(line.split(",").map(&:to_i))
end

w = cell.transpose.size
h = cell.size
# minはその地点に到達できる最小の和を表す
min = h.times.map { [0] * w }
#1行目と1列目を作成
min[0][0] = cell[0][0]
(1..w-1).each do |i|
  min[0][i] = min[0][i - 1] + cell[0][i]
end
(1..h-1).each do |i|
  min[i][0] = min[i - 1][0] + cell[i][0]
end
# のこりを作成
(1..h-1).each do |i|
  (1..w-1).each do |j|
    min[i][j] = [min[i - 1][j], min[i][j - 1]].min + cell[i][j]
  end
end

# print_matrix(min)
print_matrix min
puts min[w-1][h-1]

# => 427337