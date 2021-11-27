-- Test cases:
    --    Input | Output
    --     0/1 == 0/1
    --     1/2 == 1/2
    --     2/3 == 1/3 + 1/3
    --     5/6 == 1/2 + 1/3
    --     6/7 == 1/2 + 1/3 + 1/42
    --   13/36 == 1/4 + 1/9
    -- 113/355 == 0.318309 (approx 1/pi)

{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# LANGUAGE RecordWildCards #-}

import           Data.Foldable     (for_)
import           Data.Function     (on)
import           Test.Hspec        (Spec, describe, it, shouldBe)
import           Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import           Lib               (Fraction (..), UnitFraction (..),
                                    egyptianRepresentation)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "egyptianRepresentation" $ for_ cases test
    where
    test Case{..} = it description assertion
      where
        assertion   = egyptianRepresentation (Fraction numerator denominator) `shouldBe` expected

data Case = Case { description :: String
                 , numerator   :: Int
                 , denominator :: Int
                 , expected    :: [UnitFraction]
                 }

cases :: [Case]
cases = [
          Case { description = "6/7"
               , numerator   = 6
               , denominator = 7
               , expected    = map UnitFraction [2, 3, 42]
               }
        ]
