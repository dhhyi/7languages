module Main where

isPrime :: Int -> Bool
-- isPrime n = null [x | x <- [2 .. n -1], n `mod` x == 0]
isPrime n = all (\x -> n `mod` x /= 0) [2 .. n - 1]

primes :: [Int]
primes = filter isPrime [1 ..]

main = do
  putStrLn "----------------"
  print $ isPrime 7
  print $ isPrime 8
  print $ isPrime 23
  print $ take 10 primes
