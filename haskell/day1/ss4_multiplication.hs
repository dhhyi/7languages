module Main where

main = do
  putStrLn "-----------------"
  let nums = [1 .. 12]
  print [(a, b, a * b) | a <- nums, b <- nums, a <= b]
