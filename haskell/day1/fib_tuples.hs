module Main where

fibtuple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
fibtuple (x, y, 0) = (x, y, 0)
fibtuple (x, y, n) = fibtuple (y, x + y, n -1)

fib :: Integer -> Integer
fib n = let (x, y, z) = fibtuple (0, 1, n) in x

main = print (fib 1000)
