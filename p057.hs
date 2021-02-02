-- 余談だけどArrowの関数にタプルの両方に作用させてタプルを返す関数ないのか？
-- 型は Arrow a => a b c -> a (b, b) (c, c) か？
-- 今わかっている情報では f *** f とするしかない
{-
Problem 57 「平方根の近似分数」 †
2の平方根は無限に続く連分数で表すことができる.

√ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...
最初の4回の繰り返しを展開すると以下が得られる.

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

次の3つの項は99/70, 239/169, 577/408である. 第8項は1393/985である. これは分子の桁数が分母の桁数を超える最初の例である.

最初の1000項を考えたとき, 分子の桁数が分母の桁数を超える項はいくつあるか?

方針
577/408  文字数は7
1393/985 文字数は8
文字数が偶数の時をカウント
-}
import Data.Ratio
import Data.List
import Control.Arrow

-- 分母と分子の桁数をそれぞれ求め比較
length . filter (digits . numerator &&& digits . denominator >>> uncurry (>) ) . map (foldr1 (\n d -> n + 1/d)) . tail . tail . inits $ ((1%1):replicate 1000 2)
-- 153
-- (66.92 secs, 28,773,117,380 bytes)
-- 時間がかかっているのはinitsを使っているせい．

-- scanr1を使用
-- 文字数が偶数の時をカウント
length . filter (even . length . show . (1 +) . (1 /)) . scanr1  (\n d -> n + (1%1)/d) $ replicate 1000 2
-- 153
-- (0.47 secs, 212,791,956 bytes)


{-
もはや不要

digits :: Integer -> Integer
digits x
  | x `div` 10 == 0 = 1
  | otherwise       = 1 + digits (x `div` 10)

-- 別解
digits = ceiling . logBase 10
digits = length . show

-}
