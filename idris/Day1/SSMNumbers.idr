mutual
    even : Nat -> Bool
    even x = case x of
        Z => True
        S k => odd k

    odd : Nat -> Bool
    odd x = case x of
        Z => False
        S k => even k

main : IO ()
main = do
    putStrLn "-------------------"
    printLn (odd Z)
    printLn (even Z)
    printLn (odd 4)
    printLn (even 4)
