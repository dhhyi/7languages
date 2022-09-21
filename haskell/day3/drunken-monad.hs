module Main where

newtype Position t = Position t deriving (Show)

stagger (Position x) = Position (x + 2)

crawl (Position x) = Position (x + 1)

rtn x = x

x >>== f = f x

treasureMap d =
  d
    >>== stagger
    >>== stagger
    >>== crawl
    >>== rtn

main = do
  putStrLn "----------------"
  print (treasureMap (Position 0))
