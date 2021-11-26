module Lib
    ( greedyDenominator
    ) where

greedyDenominator :: Integer -> Integer -> Integer -> Integer
greedyDenominator a b c
    | 1 `div` c < a `div` b = c
    | otherwise = greedyDenominator a b (c+1)

-- egyptianFraction :: Int -> Int -> [Int]
-- egyptianFraction a b
--     | a == 1 = b
--     | otherwise = egyptianFraction (a*c - b) b*c
--     where c = greedyDenominator a b
