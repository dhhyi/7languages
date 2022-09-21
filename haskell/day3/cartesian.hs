module Main where

cartesian1 :: Monad m => (m a, m b) -> m (a, b)
cartesian1 (xs, ys) = do
  x <- xs
  y <- ys
  return (x, y)

cartesian2 :: ([a], [b]) -> [(a, b)]
cartesian2 (xs, ys) = [(x, y) | x <- xs, y <- ys]

main = do
  putStrLn "----------------"
  print $ cartesian1 ([1, 2], [3, 4])
  putStrLn "----------------"
  print $ cartesian2 ([1, 2], [3, 4])
