module Main where

loremIpsum =
  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

breakLines :: Int -> String -> [String]
breakLines _ [] = []
breakLines n xs = take n xs : breakLines n (drop n xs)

breakWords :: String -> [String]
breakWords [] = []
breakWords xs = takeWhile (/= ' ') xs : breakWords (dropWhile (== ' ') (dropWhile (/= ' ') xs))

wordLengths :: [String] -> [(String, Int)]
wordLengths x = [(x, length x) | x <- x]

sumWordLengths :: [(String, Int)] -> [(String, Int)]
sumWordLengths l = [(x, sum (map snd (take y l)) + y -1) | (x, y) <- zip (map fst l) [1 ..]]

brakeLinesWithWords :: Int -> [(String, Int)] -> [String]
brakeLinesWithWords _ [] = []
brakeLinesWithWords n xs = do
  let line = takeWhile (\x -> snd x < n) (sumWordLengths xs)
  let s = foldl1 (\acc w -> acc ++ " " ++ w) (map fst line)
  s : brakeLinesWithWords n (drop (length line) xs)

main = do
  putStrLn "----------------"
  putStrLn loremIpsum
  putStrLn "----------------"
  mapM_ putStrLn (breakLines 40 loremIpsum)
  putStrLn "----------------"
  let words = wordLengths (breakWords loremIpsum)
  mapM_ putStrLn (brakeLinesWithWords 40 words)
  putStrLn "----------------"
  mapM_
    ( \l -> do
        print $ length l
        putStrLn l
    )
    (brakeLinesWithWords 40 words)
  putStrLn "----------------"
