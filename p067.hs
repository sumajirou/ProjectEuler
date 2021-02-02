
-- n段目でn個の数字がある．それぞれの数字の行き先は左下か右下の2通りである．行き先は数値の大きい方である．
-- fはn+1段目のリストを渡して，n段目の行くべき数値をリストで返す関数．
-- リストの要素を2つずつ見て行き，リストの和の大きい方を選択する．
f :: [[Int]] -> [[Int]]
f bs = map (\(x, y) -> if (sum x < sum y) then y else x) $ zip bs (tail bs)

-- 逆三角形の場合
-- head $ foldl (\xs ys -> zipWith (:) ys $ f xs) (map (: []) $ head a) (tail a)

-- 三角形の場合
-- head $ foldr (\ys xs -> zipWith (:) ys $ f xs) (map (: []) $ last a) (init a)

main :: IO ()
main = do
  triangleString <- readFile "p067_triangle.txt"
  let triangle = map (map (\x -> read x ::Int)) . map words . lines $ triangleString
  let path = head $ foldr (\ys xs -> zipWith (:) ys $ f xs) (map (: []) $ last triangle) (init triangle)
  print path
  print (sum path)
