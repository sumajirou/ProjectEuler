import Data.Ratio
main :: IO ()
main = print func

comb n r = product $ zipWith (%) [n-r+1..n] [1..r]
func = length $ filter (1000000 <=) [comb n r | n <- [1..100], r <- [0..n]]
