module Lib
    ( greedyDenominator,
      Fraction(..)
    ) where


data Fraction = Fraction Int Int
data UnitFraction = UnitFraction Int

greedyDenominator :: Fraction -> Int
greedyDenominator (Fraction a b) = denFinder (Fraction a b) 1

denFinder :: Fraction -> Int -> Int
denFinder (Fraction a b) c
    | b < a*c = c  -- if 1/c < a/b, then c is the greedy best guess
    | otherwise = denFinder (Fraction a b) (c+1)

-- egyptianFraction :: Int -> Int -> [Int]
-- egyptianFraction 1 b = b
-- egyptianFraction a b = [] ++ egyptianFraction (a*c - b) b*c
--     where c = greedyDenominator a b
