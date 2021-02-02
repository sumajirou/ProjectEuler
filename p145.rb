class Integer
  def reverse
    self.to_s.reverse.to_i
  end
  def reverse
    a = self
    b = 0
    while a > 0
      b *= 10
      b += a % 10
      a /= 10
    end
    b
  end

  def allodd?
    self.to_s.chars.map(&:to_i).all?(&:odd?)
  end
  def allodd?
    a = self
    while a > 0
      return false if a.even?
      a /= 10
    end
    return true
  end
end

limit = 10**9
count = 0
1.upto(limit - 1) do |n|
  next if n % 10 == 0
  count += 1 if (n + n.reverse).allodd?
end
p limit
p count

# 1000000000
# 608720
# [Done] exited with code=0 in 392.379 seconds
# クソ長ェ