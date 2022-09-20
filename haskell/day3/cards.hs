module Main where

import Data.Data (typeOf)
import Data.List (sort, sortBy)

data Suit = Spades | Hearts | Diamonds | Clubs

instance Show Suit where
  show Spades = "♠"
  show Hearts = "♥"
  show Diamonds = "♦"
  show Clubs = "♣"

data Rank = Seven | Eight | Nine | Ten | Jack | Queen | King | Ace

instance Show Rank where
  show Seven = "7"
  show Eight = "8"
  show Nine = "9"
  show Ten = "10"
  show Jack = "J"
  show Queen = "Q"
  show King = "K"
  show Ace = "A"

value :: Rank -> Int
value Seven = 7
value Eight = 8
value Nine = 9
value Ten = 10
value Jack = 10
value Queen = 10
value King = 10
value Ace = 11

instance Eq Rank where
  (==) a b = value a == value b

instance Ord Rank where
  compare a b = compare (value a) (value b)

newtype Card = Card (Rank, Suit)

instance Show Card where
  show (Card (rank, suit)) = show suit ++ show rank

instance Eq Card where
  (==) (Card (rank1, _)) (Card (rank2, _)) = rank1 == rank2

instance Ord Card where
  compare (Card (rank1, _)) (Card (rank2, _)) = compare rank1 rank2

type Hand = [Card]

rank :: Card -> Rank
rank (Card (r, _)) = r

suit :: Card -> Suit
suit (Card (_, s)) = s

cardValue :: Card -> Int
cardValue (Card (rank, _)) = value rank

handValue :: Hand -> Int
handValue hand = sum (map cardValue hand)

handSort :: Hand -> Hand
handSort = sortBy (\c1 c2 -> compare (cardValue c2) (cardValue c1))

backwards :: [a] -> [a]
backwards [] = []
backwards (x : xs) = backwards xs ++ [x]

compareCards :: (Card, Card) -> String
compareCards comb = show (fst comb) ++ " " ++ show (snd comb) ++ " -> " ++ show (uncurry compare comb)

main = do
  putStrLn "----------------"
  let card = Card (Ace, Spades)
  print $ cardValue card
  print $ cardValue (Card (Ten, Hearts))
  print $ cardValue (Card (Seven, Diamonds))
  putStrLn "----------------"
  let hand = [Card (King, Clubs), Card (Ace, Spades), Card (Seven, Diamonds), Card (King, Hearts)]
  print hand
  print $ handValue hand
  print $ handSort hand
  print $ sort hand
  print $ backwards hand
  putStrLn "----------------"
  print $ typeOf hand
  print $ (typeOf . head) hand
  print $ (typeOf . rank . head) hand
  print $ (typeOf . suit . head) hand
  print $ (typeOf . cardValue . head) hand
  putStrLn "----------------"
  print $ Ace == Ace
  print $ Queen == Ace
  print $ Queen == Ten
  putStrLn "----------------"
  let combinations = [(x, y) | x <- hand, y <- hand]
  mapM_ (putStrLn . compareCards) combinations
