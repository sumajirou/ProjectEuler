# 暗号文
data = File.open("p059_cipher.txt").read.split(",").map(&:to_i)
# 3つ飛ばしで文字を拾う
data2 = data.each_slice(3).to_a.transpose
# 最も出現頻度が高い文字を'e'と推測し、キーを計算 
# 違った。空白を失念してた ' '
key = data2.map{|a| a.group_by(&:itself).transform_values(&:length).max_by{|item|item[1]}[0] ^ ' '.ord}
# 復号
bytes = data2.zip(key).map{|a,key| a.map{|b| (b ^ key)}}.transpose.flatten
puts bytes.map(&:chr).join
# 答え
puts bytes.sum