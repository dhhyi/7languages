data Suit = Spades | Hearts | Diamonds | Clubs

Show Suit where
  show Clubs = "♣"
  show Spades = "♠"
  show Hearts = "♡"
  show Diamonds = "♢"

data Rank = Ace | Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King

Show Rank where
  show Ace = "A"
  show Two = "2"
  show Three = "3"
  show Four = "4"
  show Five = "5"
  show Six = "6"
  show Seven = "7"
  show Eight = "8"
  show Nine = "9"
  show Ten = "10"
  show Jack = "J"
  show Queen = "Q"
  show King = "K"

card : Rank -> Suit -> (Rank, Suit)
card rank suite = (rank, suite)

deck : List (Rank, Suit)
deck = [ card rank suit | rank <- ranks, suit <- suits ]
  where
    suits = [Spades, Hearts, Diamonds, Clubs]
    ranks = [Ace, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King]


main : IO ()
main = do
  putStrLn "Here is a deck of cards:"
  putStrLn (show deck)
