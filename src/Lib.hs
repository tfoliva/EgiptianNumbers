module Lib
  ( Fraction (..),
    UnitFraction (..),
    egyptianRepresentation,
  )
where

newtype UnitFraction = UnitFraction Int
  deriving (Show, Eq)

data Fraction = Fraction {numerator :: Int, denominator :: Int}

egyptianRepresentation :: Fraction -> [UnitFraction]
egyptianRepresentation inputFraction
  | a == 1 = [UnitFraction b]
  | otherwise = UnitFraction c : egyptianRepresentation (Fraction (a * c - b) (b * c))
  where
    a = numerator inputFraction
    b = denominator inputFraction
    c = ceiling (fromIntegral b / fromIntegral a)
