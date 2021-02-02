f x = x + (read . reverse . show) x
f = read . reverse . show &&& id >>> uncurry (+)
g x = show x == (reverse . show) x
g = show >>> reverse &&& id >>> uncurry (==)
h = takeWhile' (not . g) . iterate f
h x
  | g x      = [x]
  |otherwise = x : (h $ f x)

-- pを満たさなくなった要素を含めるtakeWhile
takeWhile' p (x:xs)
  | p x       = x : takeWhile' p xs
  | otherwise = [x]

-- 10000未満の数字で，50回以上の操作を必要とする数
length . filter ((== 50) . length . take 50 . h) $ [1..9999]
-- 246
-- (0.56 secs, 299,867,324 bytes)

-- 回分数かつLychrel数であるものの数
a = map f . filter ((== 1) . length . take 50 . h) $ [1..9999]
map (`div` 2) . filter ((== 50) . length . take 50 . h) $ a
-- [4994,8778,9999]
-- (0.56 secs, 305,213,828 bytes)
-- 合計は249

-- 一度操作してから探索する．回分数かつLychrel数を拾える．
length . filter ((== 50) . length . take 50 . h . f) $ [1..9999]
-- 249
-- (0.53 secs, 301,180,336 bytes)
