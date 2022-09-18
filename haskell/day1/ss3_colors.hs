module Main where

main = do
  putStrLn "--------------"
  let colors = ["black", "white", "blue", "yellow", "red"]
  print colors
  print [(x, y) | x <- colors, y <- colors, x < y]
