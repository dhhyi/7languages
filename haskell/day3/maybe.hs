module Main where

import Data.Maybe (fromMaybe)

findInString :: Char -> String -> Maybe Char
findInString _ [] = Nothing
findInString x (y : ys) = if x == y then Just x else findInString x ys

getCharResult1 :: Maybe Char -> Char
getCharResult1 res = case res of
  Nothing -> ' '
  Just x -> x

getCharResult2 :: Maybe Char -> Char
getCharResult2 = fromMaybe ' '

main = do
  let s = "abc"
  putStrLn "----------------"
  print $ findInString 'a' s
  print $ findInString 'b' s
  print $ findInString 'c' s
  print $ findInString 'd' s
  putStrLn "----------------"
  print $ getCharResult1 $ findInString 'a' s
  print $ getCharResult1 $ findInString 'd' s
  putStrLn "----------------"
  print $ getCharResult2 $ findInString 'a' s
  print $ getCharResult2 $ findInString 'd' s
