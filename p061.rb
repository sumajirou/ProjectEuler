def f3(n) n*(n+1)/2 end
def f4(n) n*n end
def f5(n) n*(3*n-1)/2 end
def f6(n) n*(2*n-1) end
def f7(n) n*(5*n-3)/2 end
def f8(n) n*(3*n-2) end

p3n =  (1..200).map{|n| f3 n}.filter{|n| 1000 <= n and n <= 9999}
p4n =  (1..200).map{|n| f4 n}.filter{|n| 1000 <= n and n <= 9999}
p5n =  (1..200).map{|n| f5 n}.filter{|n| 1000 <= n and n <= 9999}
p6n =  (1..200).map{|n| f6 n}.filter{|n| 1000 <= n and n <= 9999}
p7n =  (1..200).map{|n| f7 n}.filter{|n| 1000 <= n and n <= 9999}
p8n =  (1..200).map{|n| f8 n}.filter{|n| 1000 <= n and n <= 9999}

pn = [p3n,p4n,p5n,p6n,p7n,p8n] # 351個
# 扱いやすいように、上2桁と下2桁に分ける
pn = pn.map{|a| a.map{|item| [item / 100, item % 100]}}
# 10の位が0になるものは候補から外す
pn = pn.map{|a| a.filter{|item| item[1] >= 10}} # 302個
# 上2桁と下2桁の両方に存在する数字の候補
candidate = pn.flatten(1).transpose.map(&:uniq).inject(&:&) # 71個
#=> [10, 11, 12, 14, 15, 16, 17, 18, 20, 21, 22, 23, 24, 25, 26, 28, 29, 30, 31, 32, 33, 35, 36, 37, 39, 
#    40, 41, 43, 44, 45, 46, 47, 49, 50, 51, 52, 53, 55, 56, 57, 58, 59, 60, 61, 62, 64, 65, 67, 69, 70,
#    71, 73, 74, 75, 76, 77, 78, 80, 81, 82, 84, 85, 86, 87, 88, 89, 90, 91, 92, 95, 96]
# 候補から削除
pn = pn.map{|a| a.filter{|item| candidate.include?(item[0]) and candidate.include?(item[1])}} #[71, 44, 39, 37, 35, 23] 249個
# p8n は40個なのでここから探索する
# 八角数を固定してあとの5数の順列を列挙して調べる
combis = pn[0..4].permutation(5)
combis.each do |combi|
    p8n = pn[5]
    combi[0] = combi[0].filter{|item| p8n.map{|n| n[1]}.include?(item[0])}
    combi[1] = combi[1].filter{|item| combi[0].map{|n| n[1]}.include?(item[0])}
    combi[2] = combi[2].filter{|item| combi[1].map{|n| n[1]}.include?(item[0])}
    combi[3] = combi[3].filter{|item| combi[2].map{|n| n[1]}.include?(item[0])}
    combi[4] = combi[4].filter{|item| combi[3].map{|n| n[1]}.include?(item[0])}
    p8n =           p8n.filter{|item| combi[4].map{|n| n[1]}.include?(item[0])}
    combi[0] = combi[0].filter{|item| p8n.map{|n| n[1]}.include?(item[0])}
    combi[1] = combi[1].filter{|item| combi[0].map{|n| n[1]}.include?(item[0])}
    combi[2] = combi[2].filter{|item| combi[1].map{|n| n[1]}.include?(item[0])}
    combi[3] = combi[3].filter{|item| combi[2].map{|n| n[1]}.include?(item[0])}
    combi[4] = combi[4].filter{|item| combi[3].map{|n| n[1]}.include?(item[0])}
    p8n =           p8n.filter{|item| combi[4].map{|n| n[1]}.include?(item[0])}
    combi[0] = combi[0].filter{|item| p8n.map{|n| n[1]}.include?(item[0])}
    combi[1] = combi[1].filter{|item| combi[0].map{|n| n[1]}.include?(item[0])}
    combi[2] = combi[2].filter{|item| combi[1].map{|n| n[1]}.include?(item[0])}
    combi[3] = combi[3].filter{|item| combi[2].map{|n| n[1]}.include?(item[0])}
    combi[4] = combi[4].filter{|item| combi[3].map{|n| n[1]}.include?(item[0])}
    p8n =           p8n.filter{|item| combi[4].map{|n| n[1]}.include?(item[0])}
    if p8n.size >= 1
        answer = ([p8n]+ combi).flatten(1).map{|item| item[0]*100 + item[1]}
        p answer
        p answer.sum
    end
end
exit
# ひでえ力押し