class Array
    def [](i)
        i < 0 ? 0 : at(i)
    end
end

N = 100
a = (0..N).collect { [] }
(0..N).each do |n|
  t = a[1][n] = a[1][n-1] + ((n == 0) ? 1 : 0)
  (2..N).each do |k|
    t = a[k][n] = a[k][n-k] + t
  end
end
puts a[99][100]