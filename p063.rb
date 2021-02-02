puts "1^1 = 1"
count = 1
1.upto(9) do |base|
    break if 2 < Math.log10(base**2).ceil
    1.step do |n|
        result = base**n
        digit = Math.log10(result).ceil
        if digit == n
            puts "#{base}^#{n} = #{result}"
            count += 1
        elsif digit < n
            break
        end
    end
end
puts count
#=> 49