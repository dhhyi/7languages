module Main where

stagger :: Num t => t -> t
stagger x = x + 2

crawl :: Num t => t -> t
crawl x = x + 1

treasureMap1 :: Num t => t -> t
treasureMap1 d = crawl (stagger (stagger d))

treasureMap2 :: Num t => t -> t
treasureMap2 d =
  let d1 = stagger d
      d2 = stagger d1
      d3 = crawl d2
   in d3

treasureMap3 :: Num t => t -> t
treasureMap3 = stagger . stagger . crawl

main = do
  putStrLn "----------------"
  print $ treasureMap1 0
  print $ treasureMap2 0
  print $ treasureMap3 0
