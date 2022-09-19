module Main where

half :: Int -> Int
half = flip div 2

newline :: String -> String
newline = (++ "\n")

main = do
  putStrLn "----------------"
  print $ half 10
  print $ half 16
  putStrLn $ newline "16"
  putStrLn $ newline "hello"
