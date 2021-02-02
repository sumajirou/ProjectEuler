import Data.List
import Primes
-- 螺旋の対角線上の素数の個数．引数は辺の長さ
-- spiralprimes x = length . filter isPrime $ diagonals x
-- diagonals 1 = [1]
-- diagonals x = (map (\y -> (x^2) + y * (x-1)) [-1,-2,-3]) ++ diagonals (x - 2)
-- head $ dropWhile (\x -> (spiralprimes x) * 10 >= 2 * x - 1) [20001,20003..]
-- diagonals x = length . filter isPrime [|] + + +
-- diagonals x = [a| n <- [2..x], let a = 4*n^2-10*n+7, isPrime a]
-- x:対角線上の素数 y:対角線上の個数 z:辺の長さ
f x y z = if ((fromIntegral x)/(fromIntegral y) < 0.11 ) then z else f ((length $ filter isPrime ([d - (z-1) * a|let d = y^2, a <- [1,2,3]]) ) + x) (y+4) (z+2)

main = print $ f 3 5 3
-- 解答は26241らしい
