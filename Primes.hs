module Primes where
import Control.Arrow
primes :: Integral a => [a]
primes = map fromIntegral ([2, 3] ++ primes' :: [Int])
  where
      primes' = 5 : sieve [] primes' 7
      sieve divs (x : xs) n = ps ++ sieve (divs ++ [x]) xs (x * x)
        where
            isPrime m = and [rem m x /= 0 | x <- divs]
            ps = filter isPrime ns
            ns = [y + z | y <- [n, n + 6 .. x * x - 2], z <- [0, 4]]

-- どうもおそい
-- isPrime :: Integer -> Bool
-- isPrime n
--   | n < 2 = False
--   | n == 2 = True
--   | otherwise = all (/= 0) [ n `mod` a| a <- [2..n-1], a * a <= n]

-- isPrime :: Integer -> Bool
-- isPrime = (== 1) . length . sb

-- 素因数分解して最初の要素が自分自身のとき素数である
-- 上のisPrimeは素因数分解が終わらないと判定できないので遅い
isPrime :: Integral a => a -> Bool
isPrime 1 = False
isPrime x = x == (head $ sb x)

-- 素因数分解
sb :: Integral a => a -> [a]

sb c = sb' c primes
  where
    sb' n (p:ps)
      | n `mod` p == 0 =  p : sb' (n `div` p) (p:ps)
      | n < p * p      = [n]
      | otherwise      = sb' n ps

  -- 19691584547
