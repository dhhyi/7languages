{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use camelCase" #-}
module Main where

every_third :: Int -> [Int]
every_third n = [n, n + 3 ..]

every_fifth :: Int -> [Int]
every_fifth n = [n, n + 5 ..]

every_eigth1 :: Int -> [Int]
every_eigth1 n = [n, n + 8 ..]

every_eigth2 :: Int -> [Int]
every_eigth2 n = zipWith (+) (every_fifth (n -1)) (every_third (n -1))

main = do
  putStrLn "----------------"
  print $ take 10 $ every_third 2
  print $ take 10 $ every_fifth 2
  putStrLn "----------------"
  print $ take 10 $ every_eigth1 2
  print $ take 10 $ every_eigth2 2
