module Main where

import Distribution.Compat.CharParsing (CharParsing (string))
import GHC.PackageDb (BinaryStringRep (toStringRep))

fibNextPair :: (Integer, Integer) -> (Integer, Integer)
fibNextPair (a, b) = (b, a + b)

fibNthPair :: Integer -> (Integer, Integer)
fibNthPair 1 = (1, 1)
fibNthPair n = fibNextPair (fibNthPair (n - 1))

fib :: Integer -> Integer
fib = fst . fibNthPair

main = do
  putStrLn "-------------"
  print (fib 1000)
