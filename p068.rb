def check3(a)
  s1 = a[0] + a[3] + a[4]
  s2 = a[1] + a[4] + a[5]
  s3 = a[2] + a[5] + a[3]
  return (s1 == s2 and s2 == s3)
end

def check5(a)
  s1 = a[0] + a[5] + a[6]
  s2 = a[1] + a[6] + a[7]
  s3 = a[2] + a[7] + a[8]
  s4 = a[3] + a[8] + a[9]
  s5 = a[4] + a[9] + a[5]
  return (s1 == s2 and s2 == s3 and s3 == s4 and s4 == s5)
end

def makeset3(a)
  line1 = [a[0],a[3],a[4]]
  line2 = [a[1],a[4],a[5]]
  line3 = [a[2],a[5],a[3]]
  set = [line1,line2,line3]
  min = set.min
  while set[0] != min
    set.rotate!
  end
  return set
end

def makeset5(a)
  line1 = [a[0],a[5],a[6]]
  line2 = [a[1],a[6],a[7]]
  line3 = [a[2],a[7],a[8]]
  line4 = [a[3],a[8],a[9]]
  line5 = [a[4],a[9],a[5]]
  set = [line1,line2,line3,line4,line5]
  min = set.min
  while set[0] != min
  set.rotate!
  end
  return set
end


# 5-gon
sets = []
[*1..10].permutation(10) do |a|
  next if a[5..9].include?(10)
  if check5(a)
    sets.push(makeset5(a))
  end
end
sets.uniq!
sets.sort_by!{|set| set[0].sum}.reverse
sets.each{|a| p a}
p sets.size
sets.map do |set|
  p set.flatten.map(&:to_s).join.to_i
end
exit

# 組み合わせはたった4つだった
#=> 6531031914842725
#=> 3.19

# 5-gon は16桁か17桁になる
# 15の数字を並べる
# 10が外側の時16桁、10が内側の時17桁
# つまり10は外側が確定



#3-gon
sets = []
[*1..6].permutation(6) do |a|
  if check3(a)
    sets.push(makeset3(a))
  end
end
sets.uniq!
sets.sort_by!{|set| set[0].sum}.reverse
sets.each{|a| p a}
p sets.size
exit
