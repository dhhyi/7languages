module Main where

allEven :: [Int] -> [Int]
allEven [] = []
allEven (x : xs) = if even x then x : allEven xs else allEven xs

main = do
  print (zip [1, 2, 3] "abc")
  print (allEven [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  print (allEven [1 .. 10])
  print [x | x <- [1 .. 10], odd x]
  print [10, 6 .. 1]
  print [1, 1.5 .. 10]
  print (take 5 [1, 1.5 ..])
  print [x * 2 | x <- [1 .. 10]]
  print [x * 2 | x <- [1 .. 10], x >= 4]
  print [(x, y) | x <- [1 .. 3], y <- ['a' .. 'c']]
  print [(x, y) | x <- [1 .. 4], y <- [1 .. 4], x /= y, x < y]
