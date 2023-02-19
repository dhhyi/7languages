
list : List Int
list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 20, 30, 40, 50, 60]

findGreaterThan : Int -> List Int -> List Int
findGreaterThan comp list = List.filter (\x => x > comp) list

everyOther : List a -> List a
everyOther (x :: y :: xs) = y :: everyOther xs
everyOther _ = []

main : IO ()
main = do
  putStrLn "----------------------"
  printLn (findGreaterThan 5 list)
  printLn (findGreaterThan 3 list)
  printLn (findGreaterThan 8 (take 30 [1..]))
  printLn (List.filter (\x => mod x 2 == 0) list)
  printLn (everyOther list)
