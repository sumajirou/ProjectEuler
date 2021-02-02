a = []
File.foreach("words.txt") {|line|
a = line.delete('"').split(",")
}

p a.sort_by(&:size)[-1]
p a.sort_by(&:size)[-1].size
# => 最小1桁最大14桁
# => sqrt(9が14桁) = 537823.9999990703
# 1から537823までの平方数を考慮
