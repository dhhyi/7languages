module Main where

import qualified Data.Map as Map
import Data.Maybe (fromMaybe)

calories = Map.fromList [("apple", 100), ("banana", 89), ("carrot", 41)]

howManyCalories :: String -> Int
howManyCalories food = fromMaybe 0 (Map.lookup food calories)

main = do
  putStrLn "----------------"
  print $ howManyCalories "apple"
  print $ howManyCalories "banana"
  print $ howManyCalories "orange"
