module Main where

import Data.List (minimumBy, sort, sortBy)

removeOne _ [] = []
removeOne x (y : ys)
  | x == y = ys
  | otherwise = y : removeOne x ys

mySort :: [Int] -> [Int]
mySort [] = []
mySort lst = do
  let min = minimum lst
  min : mySort (removeOne min lst)

mySortBy :: (Int -> Int -> Ordering) -> [Int] -> [Int]
mySortBy _ [] = []
mySortBy f lst = do
  let min = minimumBy f lst
  min : mySortBy f (removeOne min lst)

oddNumbersFirst :: Int -> Int -> Ordering
oddNumbersFirst x y
  | odd x && even y = LT
  | even x && odd y = GT
  | otherwise = compare x y

myQuickSortBy :: (Int -> Int -> Ordering) -> [Int] -> [Int]
myQuickSortBy _ [] = []
myQuickSortBy f (p : tail) = do
  let smaller = myQuickSortBy f [a | a <- tail, f a p == LT]
  let same = p : myQuickSortBy f [a | a <- tail, f a p == EQ]
  let bigger = myQuickSortBy f [a | a <- tail, f a p == GT]
  smaller ++ same ++ bigger

myQuickSort :: [Int] -> [Int]
myQuickSort = myQuickSortBy compare

main = do
  putStrLn "----------------"
  let lst = [3, 6, 1, 4, 9, 1, 5, 2, 8, 4, 5, 7]
  print lst
  putStrLn "-----sort-------"
  print $ sort lst
  print $ mySort lst
  print $ myQuickSort lst
  putStrLn "-----sortBy-----"
  print $ sortBy (flip compare) lst
  print $ mySortBy (flip compare) lst
  print $ myQuickSortBy (flip compare) lst
  putStrLn "-----sortBy2----"
  print $ sortBy oddNumbersFirst lst
  print $ mySortBy oddNumbersFirst lst
  print $ myQuickSortBy oddNumbersFirst lst
