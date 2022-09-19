module Main where

-- ggt :: Int -> Int -> Int
-- ggt a b
--   | a == b = a
--   | a > b = ggt (a - b) b
--   | otherwise = ggt a (b - a)

ggt a b = do
  let min = minimum [a, b]
  head (filter (\x -> (a `mod` x == 0) && (b `mod` x == 0)) [min, (min -1) .. 1])

main = do
  putStrLn "----------------"
  print $ ggt 17 12
  print $ ggt 12 18
