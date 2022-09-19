module Main where

prod :: Num a => a -> a -> a
prod x y = x * y

double :: Int -> Int
double x = prod x 2

triple :: Num a => a -> a
triple x = prod x 3

main = do
  putStrLn "------------------"
  print $ double 3
  print $ triple 3
