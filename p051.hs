{-
Problem 51 「素数の桁置換」 †
*3の第1桁を置き換えることで, 13, 23, 43, 53, 73, 83という6つの素数が得られる.

56**3の第3桁と第4桁を同じ数で置き換えることを考えよう. この5桁の数は7つの素数をもつ最初の例である:
56003, 56113, 56333, 56443, 56663, 56773, 56993. よって, この族の最初の数である56003は,
このような性質を持つ最小の素数である.

桁を同じ数で置き換えることで8つの素数が得られる最小の素数を求めよ. (注:連続した桁でなくても良い)


下の方針でやってる途中で一つ気づいた．7つの素数を持つ最初の例である56**3において，素数にならないのは
56223, 56553, 56883である．
これらは各桁の合計が3の倍数であるので，元の数字も3の倍数になる．2桁の数字を同じ数字で変更していくと，
各桁の和が2ずつ増加する．これでは*を0から9に変化させる中で3つ乃至4つの3の倍数を含むことになる．
これを避けるためには変更する桁の数を3の倍数にしてやる．すると各桁の和が3ずつ増加するため，
0に置き換えた時3の倍数である数字は1以上に置き換えても常に3の倍数となり，
0に置き換えた時3の倍数でない数字は，1以上に置き換えても，必ず3の倍数にならない．
今回の問題は8つの素数が得られる最小の素数であるため，合成数になってよいのは2パターンとなる．
よって以下の条件が使える．
・置き換える桁の数は3の倍数
・候補の数字の*を除く桁の和が3の倍数でないこと．今回の候補作成時の都合上取り除かれている為考慮しなくて良い．
-}

-- 文字列化し，重複要素と自分自身のペアに
as :: [Integer] -> [(Char, String)]
as = concatMap (show >>> dups &&& id >>> \(cs, p) -> [(c, p) | c <- cs])

-- dups関数はリスト中の重複要素を取り出す
-- 重複要素を取り除いたもので元のリストから差集合を取りさらに重複要素を取り除くと重複要素のリストができる．
dups :: Eq a => [a] -> [a]
dups = id &&& nub >>> uncurry (\\) >>> nub

-- 重複要素を3の倍数個持つ数値を取り出す．
bs :: [(Char, String)] -> [(Char, String)]
bs = filter (uncurry count >>> (== 0) . flip mod 3)
count :: Eq a => a -> [a] -> Integer
count x = length . filter (== x)

-- 候補となるリスト．この要素の'*'を数値に置換して素数の数を数える．1の位が*のものは省く
cands :: [(Char, String)] -> [String]
cands = filter (not . isSuffixOf "*") . nub . map (\(c, p) -> replace c '*' p)
-- replace関数はData.String.Utilsにあるが，Hackageの扱いがまだよくわからないので自分で実装して使用する．
-- > replace '8' '*' "828337"
-- "*2*337"
replace :: Eq a => a -> a -> [a] -> [a]
replace from to = foldr (\a b -> (if a == from then to else a) : b) []

-- 1の位が*のものと，最上位が0のものは省く
cs :: [String] -> [[String]]
cs = map (\p -> filter (not . isPrefixOf "0") [replace '*' c p | c <- ['0'..'9']])

-- read関数で数値化し，素数をフィルター
ds ::  [[String]] -> [[Integer]]
ds = map (\xs -> filter isPrime [(read x)::Integer | x <- xs])
-- 最終的な答え
filter ((== 8) . length) . ds . cs . cands . bs . as $ takeWhile (< 1000000) primes
-- [[121313,222323,323333,424343,525353,626363,828383,929393]]












{-
最初に考えた方針
素数列に対して操作する．
(1) すべての桁が別の数字のとき
*に置き換えることができるのは1桁．
ある素数pを文字列化し桁を1つ'*'に置換したリストに対し，ソートし，グループ化し，個数が8のものが正解．
ただし1の位は置き換えても半分は偶数になるので意味がない．
使用: concatMap sort group
例 4349 -> [*349, 4*49, 43*9]

(2) 重複した数字を持つとき
重複した数字を'*'に置き換える．置き換えはmap使う．
例 5009  -> [5**9]
例 88337 -> [**337, 88**7]
使用: comcatMap map sort group

-}

-- 10000未満の素数で重複要素を持つものとそうでないもののリストを作成
(as, bs) = partition ( show >>> length . nub &&& length >>> uncurry (<)) $ takeWhile (< 10000) primes

-- dups関数はリスト中の重複要素を取り出す
-- 重複要素を取り除いたもので元のリストから差集合を取りさらに重複要素を取り除くと重複要素のリストができる．
dups :: Eq a => [a] -> [a]
dups = id &&& nub >>> uncurry (\\) >>> nub
-- "83"

-- replace関数はData.String.Utilsにあるが，Hackageの扱いがまだよくわからないので自分で実装して使用する．
-- > replace '8' '*' "828337"
-- "*2*337"
replace :: Eq a => a -> a -> [a] -> [a]
replace from to = foldr (\a b -> (if a == from then to else a) : b) []

-- 重複要素と文字列化素数のペア
map (show >>> dups &&& id) as
-- 候補となるリスト．この要素の'*'を数値に置換して素数の数を数える．
cands = nub $ concatMap (show >>> dups &&& id >>> uncurry (\ds ids -> [replace d '*' ids | d <- ds])) as
sort $ map (\x -> (length x,x)) $ map (\cand ->  filter isPrime [read (replace '*' n cand)::Integer | n <- ['0'..'9']]) cands
map (\cand ->  filter (not . isPrefixOf "0") [replace '*' n cand | n <- ['0'..'9']]) cands


