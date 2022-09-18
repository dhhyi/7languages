module Main where

allEven1 :: [Int] -> [Int]
allEven1 [] = []
allEven1 (x : xs) = if even x then x : allEven1 xs else allEven1 xs

allEven2 :: [Int] -> [Int]
allEven2 l = [x | x <- l, even x]

allEven3 :: [Int] -> [Int]
allEven3 = filter even

allEven4 :: [Int] -> [Int]
allEven4 = foldr (\x acc -> if even x then x : acc else acc) []

main = do
  putStrLn "------------------"
  let list = [1 .. 10]
  print $ allEven1 list
  print $ allEven2 list
  print $ allEven3 list
  print $ allEven4 list
