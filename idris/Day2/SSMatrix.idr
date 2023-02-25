data Matrix : Integer -> Integer -> Type where
    MakeMatrix : (m : Integer) -> (n : Integer) -> Matrix m n

||| Transpose a matrix
transpose : Matrix m n -> Matrix n m
transpose (MakeMatrix m n) = MakeMatrix n m

mirror : Matrix m n -> Matrix m n
mirror (MakeMatrix m n) = MakeMatrix m n

Show (Matrix m n) where
    show (MakeMatrix m n) = "Matrix " ++ show m ++ "x" ++ show n

matrix : Matrix 2 3
matrix = MakeMatrix 2 3

main : IO ()
main = do
    putStrLn "-------------------------"
    printLn $ "m = " ++ show matrix
    printLn $ "transpose m = " ++ show (transpose matrix)
    printLn $ "mirror m = " ++ show (mirror matrix)
