M = 1_000_000
count = 0
1.step do |z|
  zz = z*z
  # x+yを一定の値にしてカウントする
  2.upto(2*z) do |xplusy|
    # このようにuptoを重ねることで x<=y<=z が保証される
    route = zz + xplusy**2
    if Math.sqrt(route) % 1 == 0
      p [route,xplusy,z]
      if xplusy - 1 <= z
        count += xplusy/2
      else
        count += z - (xplusy-1)/2
      end
    end
    if count >= M
      puts "count=#{count}, M=#{z}"
      exit
    end
  end
end
# 前回
# count=1000000, M=1818
# [Done] exited with code=0 in 117.808 seconds
# 今回
# count=1000457, M=1818
# [Done] exited with code=0 in 0.501 seconds
# 240倍程度高速化した
