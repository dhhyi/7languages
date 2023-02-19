reverseList : List a -> List a
reverseList list =
    case list of
        [] => []
        x :: xs => reverseList xs ++ [ x ]

main : IO ()
main = do
    putStrLn "--------------------"
    printLn (reverseList [ 1, 2, 3, 4, 5 ])
