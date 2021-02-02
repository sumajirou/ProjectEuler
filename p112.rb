class String
  def sort
    self.chars.sort.join
  end
end

limit = 3000000

bounce = 0
101.upto(limit) do |n|
  str = n.to_s
  sorted = str.sort
  if str != sorted and str != sorted.reverse
    bounce += 1
  end
  if 1.0 * bounce / n >= 0.99
    puts n
    break
  end
end