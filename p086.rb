
count = 0
1.step do |z|
  zz = z*z
  1.upto(z) do |y|
    1.upto(y) do |x|
      # このようにuptoを重ねることで x<=y<=z が保証される
      route = zz + (x+y)**2
      if Math.sqrt(route) % 1 == 0
        p [route,x,y,z]
        count += 1
      end
      if count >= 1_000_000
        puts "count=#{count}, M=#{z}"
        exit
      end
    end
  end
end
p count
exit
# count=1000000, M=1818
# [Done] exited with code=0 in 117.808 seconds

