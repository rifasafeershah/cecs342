module Main where

import Data.List
import Data.Ord

--haskell source code of sortBy
--https://hackage.haskell.org/package/base-4.14.0.0/docs/src/Data.OldList.html#sortBy

--haskell source code of comparing 
--https://hackage.haskell.org/package/base-4.14.0.0/docs/src/Data.Ord.html#comparing

--haskell source code of flip
--https://hackage.haskell.org/package/base-4.14.0.0/docs/src/GHC.Base.html#flip


--http://learnyouahaskell.com/making-our-own-types-and-typeclasses
-- Person data type with record syntax
data Person = Person {name :: String, age :: Int} deriving (Show, Eq)

--Sort List of Person types by name alphetically
sortPersonByName :: [Person] -> [Person]
sortPersonByName = sortBy (comparing name) --comparing allows to sortBy with specific data type 


--Sort List of Person types by Age, if Ages are the same then order by name alphabetically 
sortPersonByAge :: [Person] -> [Person]
sortPersonByAge = sortBy  (flip  (comparing age) ) --using flip allows to reverse compare order. We use this to order by descending ages.
                                                   --"compare 1 2" will return LT, while "flip compare 1 2" will return GT 

persons = [Person "Hal" 20, Person "Susann" 31, Person "Dwight" 19, Person "Kassandra" 21, Person "Lawrence" 25, Person "Cindy" 22, Person "Cory" 27, Person "Mac" 19, Person "Romana" 27, Person "Doretha" 32, Person "Danna" 20, Person "Zara" 23, Person "Rosalyn" 26, Person "Risa" 24, Person "Benny" 28, Person "Juan" 33, Person "Natalie" 25]

main = do 
  --sort numbers ascending by numerical value
  print("sorted numbers ascending by numerical value")
  print(sort[645.32, 37.40, 76.30, 5.40, -34.23, 1.11, -34.94, 23.37, 635.46, -876.22, 467.73, 62.26])
  putStrLn("")
  --sort people alphabetically (lexicographically) by name
  print("sorted people alphabetically (lexicographically) by name")
  print(sortPersonByName persons )
  putStrLn("")
  --sort people descending by age, where people of the same age should be sorted alphabetically (lexicographically).
  print("sorted people descending by age, where people of the same age should be sorted alphabetically (lexicographically).")
  print(sortPersonByAge persons )
