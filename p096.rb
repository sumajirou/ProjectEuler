require_relative 'util'
# 総当り法
class Sudoku
  def initialize(m)
    @base = m
    @board = Marshal.load(Marshal.dump(m))
    @p = [0,0] # pointer
  end

  def solve
    while solved?
      1.upto(9) do |n|
      end
    end

    return @board
  end
  def sudoku_solve(m)
  # 行列の深いコピー
  b = Marshal.load(Marshal.dump(m))
  i,j = 0,0
  loop do
    i,j = forward(i,j) while m[i][j] != 0
    b[i][j] += 1
  end
end

# 縦横ボックスに重複していないか
def check(i,j)

end

def back(i,j)
  if j == 0
    [i-1,8]
  else
    [i,j-1]
  end
end

def forward(i,j)
  if j == 8
    [i+1,0]
  else
    [i,j+1]
  end
end

# 盤面が完成しているか
def solved?(m)
  m.each do |line|
    return false unless line.sort == [*1..9]
  end
  m.transpose.each do |line|
    return false unless line.sort == [*1..9]
  end
  box2line(m).each do |line|
    return false unless line.sort == [*1..9]
  end
  return true
end

#3x3のボックス9個を9x9の行列に変換
# 左上から右にZの順番
def box2line(m)
  box = []
  # 各ボックスの左上の要素の添字
  [0,3,6].repeated_permutation(2) do |i,j|
    box.push(m[i+0][j,3] + m[i+1][j,3] + m[i+2][j,3])
  end
  box
end

end


def print_sudoku(m)
  puts "+-------+-------+-------+"
  m.flatten.each_with_index do |n,i|
    puts " |" if i != 0 and i % 9 == 0
    puts "+-------+-------+-------+" if i != 0 and i % 27 == 0
    if i % 9 == 0
      print "| #{n}"
    elsif i % 3 == 0
      print " | #{n}"
    else
      print " #{n}"
    end

  end
  puts " |\n+-------+-------+-------+"
end

# 盤面を一行ずつ配列にする
# 盤面を左右に並べるときに必要
def to_sudoku(m)
  # 縦の枠線を追加
  result = m.map do |a|
    "|#{a[0,3].join}|#{a[3,3].join}|#{a[6,3].join}|".chars.join(" ")
  end
  bar = "+-------+-------+-------+"
  result.insert(9,bar).insert(6,bar).insert(3,bar).insert(0,bar)
end



matrix = [
"003020600",
"900305001",
"001806400",
"008102900",
"700000008",
"006708200",
"002609500",
"800203009",
"005010300"
].map{|line| line.split("").map(&:to_i)}

print_matrix matrix
print_sudoku matrix
to_sudoku(matrix).each do |line| puts line end
