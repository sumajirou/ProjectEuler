# 別解
# 総当りで複号して、[is the of]を含むものを抽出する

# 暗号文
data = File.open("p059_cipher.txt").read.split(",").map(&:to_i)
# 3つ飛ばしで文字を拾う
data2 = data.each_slice(3).to_a.transpose

a = data.sort.uniq
p [a[0],a[-1]]
# 最小は0、最大は95 暗号化キーは7bitでよいだろう

(0..127).to_a.repeated_permutation(3){|keys|
    if keys[1] == 0 and keys[2] == 0
        p keys
        # p txt
    end
    oobflag = false
    bytes = data.map.with_index{|x,i|
        n = x ^ keys[i%3]
        if n < 32
            oobflag = true
            break
        end
        n
    }
    next if oobflag

    txt = bytes.map(&:chr).join
    if txt.include?("of the") and txt.include?("is")
        puts txt
    end

}