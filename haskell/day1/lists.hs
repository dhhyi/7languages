module Main where

-- size = foldr (\x -> (+) 1) 0

size :: [a] -> Int
size [] = 0
size (x : xs) = 1 + size xs

prod :: [Int] -> Int
prod [] = 1
prod (x : xs) = x * prod xs

main = do
  putStrLn "--------------"
  print (size [1, 2, 3, 4, 5])
  print (prod [1, 2, 3, 4, 5])
  print (size "string")
