{-
Problem 92 「桁の2乗による連鎖」 †
各桁の2乗を足し合わせて新たな数を作ることを, 同じ数が現れるまで繰り返す.

例えば

　　44 → 32 → 13 → 10 → 1 → 1
　　85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

のような列である. どちらも1か89で無限ループに陥っている.
驚くことに, どの数から始めても最終的に1か89に到達する.

では, 10,000,000より小さい数で89に到達する数はいくつあるか.

1つのチェインに登場する数はすべて同じ数字(1か89のどちらか)に到達する．

例えば2桁の数は10～99である．各桁の2乗の和が最大となるのは各桁が最大である99である．
よって1～10,000,000で各桁の2乗の和が最大となるのは9,999,999のとき．

f 9999999 は 567
1から567までに対して1か89のどちらに到達するかを予め求めておく．配列を使う
[1..9999999]に対してfを1回適用し，567までの範囲のリストにしてから配列にアクセスし，値を得る．

f 9999999 は 567
1～567で各桁の2乗の和が最大となるのは499のとき
f 499 は 178
[1..9999999]に対してfを2回適用し，178までの範囲のリストにしてから配列にアクセスし，値を得ても良いが効率は大して変わらないだろう．

-}
import Control.Arrow
import Data.List
import Data.Array
import Control.Applicative

digits :: Int -> [Int]
-- digits = show >>> map (\x -> read [x]::Int)
digits x
  | x `div` 10 == 0 = [x]
  | otherwise = (x `mod` 10) : (digits (x `div` 10))

-- 各桁の2乗の和を計算
f :: Int -> Int
-- f = digits >>> foldr (\n d -> n^2 + d) 0
-- f = digits >>> map (^ 2) >>> sum
f x
  | x == 0 = 0
  | otherwise = (x `mod` 10)^2 + (f (x `div` 10))

-- リストから89に到達する数を数える
-- リストから1と89を削除したものに繰返しfを適用させてゆき，リストが空になるまで続ける．
-- 89を削除する際，個数を数える．
count :: [Int] -> Int
count [] = 0
-- count ns = filter (/= 1) >>> partition (== 89) >>> (\(xs, ys) -> length xs + count (map f ys)) $ ns
count ns = partition (\x -> x == 89 || x == 1 ) >>> (\(xs, ys) -> (length $ filter (== 89) xs) + count (map f ys)) $ ns

-- 1か89に到達したリスト
g :: Int -> (Int, [Int])
g = iterate f >>> break (\x -> x == 1 || x == 89) >>> (\(xs,y:_) -> (y,xs))

-- 89に到達するか？
h :: Int -> Bool
h = iterate f >>> find (\x -> x == 1 || x == 89) >>> (\(Just x) -> x == 89)
-- Bool配列
arr89p = array (1,567) $ map (\x -> (x,h x)) [1..567]
-- main = print $ count [1..10^7-1]
-- 89に到達するか？
pTo89 :: Int -> Bool
pTo89 = (arr89p !) . f
count' :: [Int] -> Int
count' = length . filter pTo89
main = print $  count' [1..10^7-1]

--8581146
--つまり85.8%は89に到達する．

{-
 - この問題は10^7-1個という巨大なリストが厄介
 - これを減らす方針を考えるか
 - 各桁の2乗の和という性質上各桁を並び替えたものは同一の結果を得る．
 - -}
-- 各桁が広義単調増加か？ 111 is ok. 132 is ng.
-- [1..9999999]の内，各桁が広義単調増加のもののリスト
a = tail [[x0,x1,x2,x3,x4,x5,x6] | x0<-['0'..'9'],x1<-[x0..'9'],x2<-[x1..'9'],x3<-[x2..'9'],x4<-[x3..'9'],x5<-[x4..'9'],x6<-[x5..'9']]
-- 11439個．超減った！

-- length [read [x0] ::Int | x0<-['0'..'9']]
-- length [read [x0,x1] ::Int | x0<-['0'..'9'],x1<-[x0..'9']]
-- length [read [x0,x1,x2] ::Int | x0<-['0'..'9'],x1<-[x0..'9'],x2<-[x1..'9']]
-- length [read [x0,x1,x2,x3] ::Int | x0<-['0'..'9'],x1<-[x0..'9'],x2<-[x1..'9'],x3<-[x2..'9']]
-- length [read [x0,x1,x2,x3,x4] ::Int | x0<-['0'..'9'],x1<-[x0..'9'],x2<-[x1..'9'],x3<-[x2..'9'],x4<-[x3..'9']]
-- length [read [x0,x1,x2,x3,x4,x5] ::Int | x0<-['0'..'9'],x1<-[x0..'9'],x2<-[x1..'9'],x3<-[x2..'9'],x4<-[x3..'9'],x5<-[x4..'9']]
-- length[read [x0,x1,x2,x3,x4,x5,x6] ::Int | x0<-['0'..'9'],x1<-[x0..'9'],x2<-[x1..'9'],x3<-[x2..'9'],x4<-[x3..'9'],x5<-[x4..'9'],x6<-[x5..'9']]

-- [10, 55, 220, 715, 2002, 5005, 11440] 一般項は得られるか？ リスト内包表記を使わない生成方法は？あとで考える
--
-- count' $ map read a
-- 9814
-- aの内89に到達する要素数．ちなみに11439 * 85.8% = 9814.662
-- さてfilter pTo89 a の各要素をリスト化し，順列を求める．その個数をすべて足せば晴れてカウント完了となる．
-- sum . map (length . permutations . digits)  . filter pTo89 $ map read a
-- 29832327
-- (1.76 secs, 5,031,878,660 bytes)
-- 一瞬で出たがなんかでかいな
-- permutationsは同じ要素を含むリストから生成するとき内容が同じものも重複して出力する．
-- *Main> permutations [1,1,2]
-- [[1,1,2],[1,1,2],[2,1,1],[1,2,1],[2,1,1],[1,2,1]]
-- nub を追加して重複を取り除いてやれば良い
-- sum . map (length . nub . permutations . digits)  . filter pTo89 $ map read a
-- やけに時間がかかる．
-- mapの関数部分を順列の総数の公式を使って置き換える．
-- 同じもの a が p 個，b が q 個，c が r 個，… ，合計 n 個あるとき，これらを全部使って1列に並べる順列の総数は n!/(p!q!r!)··· 通り
nubperm :: String -> Int
nubperm = fact . length &&& (group >>> map (fact . length) >>> product) >>> uncurry (div)

fact :: Int -> Int
fact x = product [1..x]
-- Arrowたのしー
-- 置き換えたものがこれ
-- sum . map nubperm . filter (pTo89 . read) $ a
-- 8581146
-- (0.31 secs, 116,424,744 bytes)
-- こんなに一瞬で！満足満足
-- 後気になるのはリストaの作り方だけです．



-- [10, 55, 220, 715, 2002, 5005, 11440] 一般項は得られるか？ リスト内包表記を使わない生成方法は？あとで考える
-- 1桁のとき 1+1+1+1+1+1+1+1+1+1=10
-- 2桁のとき 10+9+8+7+6+5+4+3+2+1=55
-- 3桁のとき 55+45+36+28+21+15+10+6+3+1  =220
--
--
--
--[["00","01","02","03","04","05","06","07","08","09"], ["11","12","13","14","15","16","17","18","19"], ["22","23","24","25","26","27","28","29"], ["33","34","35","36","37","38","39"], ["44","45","46","47","48","49"], ["55","56","57","58","59"], ["66","67","68","69"], ["77","78","79"], ["88","89"], ["99"]]

-- 苦しんどるなw
gen :: String -> [[String]] -> [[String]]
gen [] [] = []
gen (x:xs) y@(_:ys) = concatMap (map (x:)) y : gen xs ys

-- 生成するより述語関数でフィルタしたほうが良いのではないか？
pairs :: [a] -> [(a, a)]
pairs [] = []
pairs [_] = []
pairs (x:y:ys) = (x, y): pairs (y:ys)
sorted :: Ord a => [a] -> Bool
sorted = and . map (uncurry (<=)) . pairs
-- sortedBy実装したれと思ったがめんどい．Ord, Ordering, compare, comparing sortByを参照せよ
-- sortedBy :: Ord a => (a -> a -> Ordering) -> [a] -> Bool
--
--
-- http://stackoverflow.com/questions/34156788/how-do-i-generate-all-combinations-of-list-elements-to-a-given-length-with-itera
-- makelist関数は個数nと要素のリストxsを取り，
makelists :: [a] -> [[[a]]]
makelists xs = iterate genLists $ map pure xs
  where
    genLists xss = (:) <$> xs <*> xss
makelist :: Int -> [a] -> [[a]]
makelist n xs = (makelists xs) !! (n - 1)
-- main = print $ sum . map nubperm . filter (pTo89 . read) . tail . filter sorted $ makelist 7 "0123456789"
-- 8581146
-- (14.04 secs, 5,056,602,400 bytes)
-- 整列整数(自分でつけた)を生成するのに時間がかかってるな
-- やはりmakelist関数一発で整列整数を生成したい．
--
--関係ないけど行列三角化ってなんだっけ
--  1  1  6
-- -1  3  6
--  1 -1 -1
--
--  1  1  6
--  0  4 12
--  0 -2 -7
--
--  1  1  6
--  0  4 12
--  0  0  5

