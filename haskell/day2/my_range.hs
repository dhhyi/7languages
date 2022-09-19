module Main where

myRange :: Int -> Int -> [Int]
myRange start step = start : myRange (start + step) step

main = do
  putStrLn "------------------"
  print $ take 10 (myRange 1 1)
  print $ take 10 (myRange 1 3)
  print $ take 10 (myRange 1 10)
