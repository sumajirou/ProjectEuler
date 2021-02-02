def ar2rm(arab) #=> arabic to roman
  result = 0
  arab = arab.dup
  while arab != ""
    case arab[0..1]
    when "CM" then result += 900;arab.slice!(0,2);next
    when "CD" then result += 400;arab.slice!(0,2);next
    when "XC" then result +=  90;arab.slice!(0,2);next
    when "XL" then result +=  40;arab.slice!(0,2);next
    when "IX" then result +=   9;arab.slice!(0,2);next
    when "IV" then result +=   4;arab.slice!(0,2);next
    end
    case arab[0]
    when "M" then result += 1000;arab.slice!(0);next
    when "D" then result +=  500;arab.slice!(0);next
    when "C" then result +=  100;arab.slice!(0);next
    when "L" then result +=   50;arab.slice!(0);next
    when "X" then result +=   10;arab.slice!(0);next
    when "V" then result +=    5;arab.slice!(0);next
    when "I" then result +=    1;arab.slice!(0);next
    end
    break
  end
  result
end

def rm2ar(num) # roman to arabic
  result = ""
  while num >= 1000; result += "M" ;num -= 1000 end
  if    num >=  900; result += "CM";num -=  900 end
  if    num >=  500; result += "D" ;num -=  500 end
  if    num >=  400; result += "CD";num -=  400 end
  while num >=  100; result += "C" ;num -=  100 end
  if    num >=   90; result += "XC";num -=   90 end
  if    num >=   50; result += "L" ;num -=   50 end
  if    num >=   40; result += "XL";num -=   40 end
  while num >=   10; result += "X" ;num -=   10 end
  if    num >=    9; result += "IX";num -=    9 end
  if    num >=    5; result += "V" ;num -=    5 end
  if    num >=    4; result += "IV";num -=    4 end
  while num >=    1; result += "I" ;num -=    1 end
  result
end

count = 0
File.foreach("p089_roman.txt") do |line|
  line.chomp!
  num = ar2rm(line)
  arab = rm2ar(num)
  p [num,line,arab]
  count += line.size - arab.size
end
p count
exit

p sixteen = ["IIIIIIIIIIIIIIII","VIIIIIIIIIII","VVIIIIII","XIIIIII","VVVI","XVI"]
p romansixteen = sixteen.map{|arab| ar2rm(arab)}
p romansixteen.map{|roman| rm2ar(roman)}
puts 
p a = "MMDCLXXVIII" #=> 2000+600+70+8
p b = ar2rm(a)
p rm2ar(b)












# 正規ローマ数字にしか対応してないので却下
# def ar2rm2(arab) #=> arabic to roman
#   arab =~ /^(M*)(CM|CD|D)?(C*)(XC|XL|L)?(X*)(IX|IV|V)?(I*)$/
#   result = 0
#   result += 1000 * $1.size
#   result += {"CM"=> 900, "CD"=> 400, "D"=> 500}[$2]
#   result +=  100 * $3.size
#   result += {"XC"=> 90, "XL"=> 40, "L"=> 50}[$4]
#   result +=   10 * $5.size
#   result += {"IX"=> 9, "IV"=> 4, "V"=> 5}[$6]
#   result +=    1 * $7.size
#   # [result,$1,$2,$3,$4,$5,$6,$7]
#   result
# end
  