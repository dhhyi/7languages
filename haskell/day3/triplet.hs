module Main where

import Data.Data (typeOf)

data Triplet a = Trio a a a deriving (Show)

same :: Eq a => Triplet a -> Bool
same (Trio x y z) = x == y && y == z

main = do
  putStrLn "----------------"
  let t = Trio 'a' 'b' 'c'
  print t
  print (typeOf t)
  putStrLn "----------------"
  print $ same t
  let t2 = Trio 'a' 'a' 'a'
  print t2
  print $ same t2
