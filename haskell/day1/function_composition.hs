module Main where

second = head . tail

-- second lst = head (tail lst)

main = do
  putStrLn "----------------"
  print (second [1, 2, 3])
  print (second ['a', 'b', 'c'])
  print (second "second")
