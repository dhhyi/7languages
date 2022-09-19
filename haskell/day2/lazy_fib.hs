module Main where

lazyFib x y = x : lazyFib y (x + y)

fibSeq = lazyFib 1 1

-- fib x = head (drop (x - 1) (take x fibSeq))

-- fib x = take x fibSeq !! max 0 (x - 1)

-- fib x = last (take x fibSeq)

fib x = (last . take x) fibSeq

main = do
  putStrLn "------------------"
  print (take 5 (lazyFib 1 1))
  print (take 5 fibSeq)
  print (fib 3)
  print (fib 1000)
  print (take 5 (zipWith (+) fibSeq (tail fibSeq)))
