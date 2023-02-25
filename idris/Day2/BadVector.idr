data Vect : Nat -> Type -> Type where
  Nil : Vect Z a
  (::) : a -> Vect n a -> Vect (S n) a


add : Vect n a -> Vect m a -> Vect (n + m) a
add Nil x = x
add (x :: xs) ys = x :: add xs xs

-- While processing right hand side of add. When unifying:
--     plus n n
-- and:
--     plus n m
-- Mismatch between: n (implicitly bound at Day2.BadVector:8:1--8:34) and m.
