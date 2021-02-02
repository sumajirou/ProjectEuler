require 'prime'

M = 50_000_000-1
list = []
maxz = ((M-12) ** 0.25).floor
Prime.each(maxz) do |z|
  z4 = z ** 4
  # maxy = Math.cbrt(M-z4-2**2-2**3).floor
  maxy = Math.cbrt(M-z4-4).floor
  Prime.each(maxy) do |y|
    y3 = y**3
    # maxx = Math.sqrt(M-y3-2**2).floor
    maxx = Math.sqrt(M-z4-y3).floor
    Prime.each(maxx) do |x|
      x2 = x**2
      num = x2+y3+z4
      puts "#{num} = #{x}^2 + #{y}^3 + #{z}^4"
      list.push(num)
    end
  end
end

p list.uniq.size

# 1097343
# [Done] exited with code=0 in 1.435 seconds