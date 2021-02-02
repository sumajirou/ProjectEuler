import Primes
main :: IO ()
main = print func

--J言語版にも書いた通り，aは奇数，bは奇素数，nは0からbまでで良い．
func = maximum [ (\x -> (length x,a*b,a,b)) $  takeWhile isPrime [n*n + a*n + b | n <- [0..b]] | a <- [-999,-997..999], b <- (filter isPrime [3,5..1000])]
