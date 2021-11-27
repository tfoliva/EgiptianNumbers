module Lib
  ( greedyDenominator,
    Fraction (..),
    UnitFraction (..),
    egyptianRepresentation,
  )
where

newtype UnitFraction = UnitFraction Int
  deriving (Show, Eq)

data Fraction = Fraction {numerator :: Int, denominator :: Int}

greedyDenominator :: Fraction -> Int
greedyDenominator (Fraction a b) = denFinder (Fraction a b) 1

denFinder :: Fraction -> Int -> Int
denFinder (Fraction a b) c
  | b < a * c = c -- if 1/c < a/b, then c is the greedy best guess
  | otherwise = denFinder (Fraction a b) (c + 1)

egyptianRepresentation :: Fraction -> [UnitFraction]
egyptianRepresentation inputFraction
  | a == 1 = [UnitFraction b]
  | otherwise = UnitFraction c : egyptianRepresentation (Fraction (a * c - b) (b * c))
  where
    a = numerator inputFraction
    b = denominator inputFraction
    c = greedyDenominator (Fraction a b)
