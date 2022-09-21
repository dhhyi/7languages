module Main where

crack :: [([Char], Bool)]
crack = do
  x <- ['a' .. 'c']
  y <- ['a' .. 'c']
  z <- ['a' .. 'c']
  let password = [x, y, z]
  return (password, attempt password)
  where
    attempt pw = pw == "cab"

main = do
  putStrLn "----------------"
  mapM_ print crack
