-- BasicLanguageConstructs.hs
--
-- CECS 342
-- Haskell vs C
--
-- Basic Language Constructs


module BasicLanguageConstructs where

-- Variables
seven = 7


sq123 = let x = 123 in x * x

sq321 = x * x where x = 321


-- Functions
twice1 n = 2 * n

twice2 = \n -> 2 * n  -- lambda-expression

twice3 = (2*)         -- section

average1 :: Float -> Float -> Float
average1 a b = (a+b)/2
average2 a = \ -> (a+b)/2
average3 = \a -> \b -> (a+b)/2
average4 = \a b -> (a+b)/2

h = average1 2
