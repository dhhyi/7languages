module Day3.Proof

data Natural = Zero | Suc Natural

plus : Natural -> Natural -> Natural
plus Zero x = x
plus (Suc x) y = Suc (plus x y)

plusZero : (x: Natural) -> plus x Zero = x

plusSuc : (x: Natural) -> (y: Natural) -> Suc (plus x y) = plus x (Suc y)

plusCommutes : (x: Natural) -> (y: Natural) -> plus x y = plus y x
plusCommutes Zero y = ?plusCommutes_0_y
plusCommutes (Suc x) y = let hypothesis = plusCommutes x y in
    ?plusCommutes_Sx_y
