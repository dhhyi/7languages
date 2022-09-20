module Main where

loremIpsum =
  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua."

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

brakeLinesWithWords :: Int -> [(String, Int)] -> [[String]]
brakeLinesWithWords _ [] = []
brakeLinesWithWords n xs = do
  let line = takeWhile (\x -> snd x < n) (sumWordLengths xs)
  let s = map fst line
  s : brakeLinesWithWords n (drop (length line) xs)

alignedLeft :: [String] -> String
alignedLeft = foldl1 (\acc w -> acc ++ " " ++ w)

alignedRight :: Int -> [String] -> String
alignedRight n words = do
  let space = n - length (concat words) - length words + 1
  replicate space ' ' ++ foldl1 (\acc w -> acc ++ " " ++ w) words

centered :: Int -> [String] -> String
centered n words = do
  let space = n - length (concat words) - length words + 1
  let left = space `div` 2
  let right = space - left
  replicate left ' ' ++ foldl1 (\acc w -> acc ++ " " ++ w) words ++ replicate right ' '

justify :: Int -> [String] -> String
justify n words = do
  let space = n - length (concat words)
  let numWords = length words
  let spaceFraction = fromIntegral space / fromIntegral (numWords - 1)
  let spaces = take numWords (map floor [spaceFraction, (2 * spaceFraction) ..])
  let aligned = [y - x | (x, y) <- zip spaces (drop 1 spaces)] ++ [0]
  let wordsWithSpaces = zipWith (\x y -> x ++ replicate y ' ') words aligned
  foldl1 (++) wordsWithSpaces

main = do
  let p = 40
  putStrLn "----------------"
  putStrLn loremIpsum
  putStrLn "----------------"
  mapM_ putStrLn (breakLines p loremIpsum)
  putStrLn "----------------"
  let words = wordLengths (breakWords loremIpsum)
  mapM_ (putStrLn . alignedLeft) (brakeLinesWithWords p words)
  putStrLn "----------------"
  mapM_ (putStrLn . alignedRight p) (brakeLinesWithWords p words)
  putStrLn "----------------"
  mapM_ (putStrLn . centered p) (brakeLinesWithWords p words)
  putStrLn "----------------"
  mapM_ (putStrLn . justify p) (brakeLinesWithWords p words)
