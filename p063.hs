10^1=10 2桁
10^2-100 3桁
よってa^bのaは[1..9]

length [(a,b)|a <- [1..10] , b <- [1..1000] , (length . show $ a^b) == b]
