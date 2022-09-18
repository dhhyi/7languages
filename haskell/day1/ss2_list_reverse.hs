module Main where

reve :: [a] -> [a]
reve [] = []
reve (h : t) = reve t ++ [h]

main = do
  putStrLn "--------------"
  let l = [1 .. 10]
  print l
  print $ reve l
