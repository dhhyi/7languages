module Main where

tryIo = do
  putStr "Enter your name: "
  name <- getLine
  let backwards = reverse name
  return ("Your name backwards is: " ++ backwards)

main = do
  putStrLn "----------------"
  print =<< tryIo
