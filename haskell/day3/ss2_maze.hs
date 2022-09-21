module Main where

-- https://www.schoolofhaskell.com/school/to-infinity-and-beyond/pick-of-the-week/Simple%20examples#data-graph

import Data.Data (typeOf)
import Data.Graph

buildMaze :: [(Vertex, Vertex)] -> Graph
buildMaze connections = buildG (min, max) allConnections
  where
    allConnections = concat [[(x, y), (y, x)] | (x, y) <- connections]
    min = minimum $ map fst connections ++ map snd connections
    max = maximum $ map fst connections ++ map snd connections

-- TODO: discard dead-end paths
extractPath :: Eq a => [Tree a] -> a -> [a]
extractPath tree end = takeWhile (/= end) (concatMap extractPath' tree) ++ [end]
  where
    extractPath' (Node x []) = [x]
    extractPath' (Node x xs) = x : extractPath xs end

solve :: Graph -> Int -> Int -> [Int]
solve maze start end = if path maze start end then extractPath (dfs maze [start, end]) end else []

main = do
  putStrLn "-----------------"
  --  1-2-3
  --    |
  --  4-5 6
  --  |
  --  7-8-9
  let maze1 = buildMaze [(1, 2), (2, 3), (2, 5), (4, 5), (4, 7), (7, 8), (8, 9)]
  putStrLn $ "1 " ++ show (solve maze1 1 9)
  putStrLn "-----------------"
  --  1 2-3
  --  | | |
  --  4-5 6
  --     /
  --  7-8-9
  let maze2 = buildMaze [(1, 4), (4, 5), (5, 2), (2, 3), (3, 6), (6, 8), (8, 7), (9, 8)]
  putStrLn $ "2 " ++ show (solve maze2 1 9)
  putStrLn "-----------------"
  --  1 2-3
  --   \  |
  --  4-5-6
  --     \
  --  7-8-9
  let maze3 = buildMaze [(1, 5), (2, 3), (3, 6), (4, 5), (5, 6), (7, 8), (8, 9), (5, 9)]
  putStrLn $ "3 " ++ show (solve maze3 1 9)
  putStrLn "-----------------"
  --  1 2-3
  --   \  |
  --  4-5-6
  --   /  |
  --  7-8-9
  let maze4 = buildMaze [(1, 5), (2, 3), (3, 6), (4, 5), (5, 6), (5, 7), (6, 9), (7, 8), (8, 9)]
  putStrLn $ "4 " ++ show (solve maze4 1 9)
  putStrLn "-----------------"
  --  1-2-3-4-5-6
  --         \ /
  --        7-8-9
  let maze5 = buildMaze [(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 8), (4, 8), (7, 8), (8, 9)]
  putStrLn $ "5 " ++ show (solve maze5 1 9)
