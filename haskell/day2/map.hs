module Main where

squareAll = map square
  where
    square x = x * x

main = do
  putStrLn "------------------"
  let lst = [1 .. 5]
  print $ squareAll lst
  print $ map (\x -> x * x) lst
  putStrLn "------------------"
  print $ map (+ 1) lst
  print $ filter odd lst
  print $ foldl (\x acc -> x + acc) 0 lst
  print $ foldl (+) 0 lst
