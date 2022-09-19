module Main where

stringToNumber :: String -> Double
stringToNumber s = read s :: Double

dollarToInt :: String -> Double
dollarToInt = stringToNumber . filter (/= ',') . filter (/= '$')

main = do
  putStrLn "----------------"
  print $ dollarToInt "$2,345,678.99"
  print $ dollarToInt "$0.99"
