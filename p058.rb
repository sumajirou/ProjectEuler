require 'prime'

diagonal_primes = []

n = 1
a = 3
b = 5
c = 7
max = 5
loop do
    diagonal_primes << a if a.prime?
    diagonal_primes << b if b.prime?
    diagonal_primes << c if c.prime?
    rate = 100.0 * diagonal_primes.length / max
    puts "length:#{(2*n+1)}\t\trate: #{"%.1f" % rate}%"
    
    a += 8*n + 2
    b += 8*n + 4
    c += 8*n + 6
    n += 1
    max += 4
    break if rate < 10
end