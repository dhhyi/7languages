module Main where

data Tree a = Children [Tree a] | Leaf a deriving (Show)

depth :: Tree a -> Int
depth (Leaf _) = 1
depth (Children xs) = 1 + maximum (map depth xs)

visit :: Tree a -> [a]
visit (Leaf x) = [x]
visit (Children xs) = concatMap visit xs

main = do
  putStrLn "----------------"
  let leaf = Leaf 1
  print leaf
  let (Leaf value) = leaf
  print value
  putStrLn "----------------"
  let tree = Children [Children [Leaf 1, Leaf 2], Leaf 3]
  print tree
  let (Children children) = tree
  print children
  print $ head children
  putStrLn "----------------"
  print $ depth tree
  putStrLn "----------------"
  print $ visit tree
