-- module Day1.Functions

intFunction : Int
intFunction = 1

stringFunction : String
stringFunction = "Hello World!"

halfIt : Double -> Double
halfIt x = x * 0.5

main : IO ()
main = do
  putStrLn "------------------------"
  printLn intFunction
  putStrLn stringFunction
  printLn (map (\x => (the (Double) x) * 0.5) [1.5, 6.0, 3])
  printLn (map halfIt [1.5, 6.0, 3])
