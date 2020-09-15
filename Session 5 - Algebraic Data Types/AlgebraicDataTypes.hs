-- ALgebraicDataTypes.hs
--
-- CECS 342
-- Haskell vs C
--
-- Algebraic Data Types


module AlgebraicDataTypes where

import Data.Foldable

-----------------
-- (1) Co-Product (disjunction, enumeration)
-----------------
data Gender = Female | Male deriving (Show, Eq)


isMale :: Gender -> Bool
isMale Male = True
isMale _    = False

-----------------
--(3) Type Recursion
-----------------
--  Refer to the type we're defining inside its own definition.

-- Make our own list type (to understand how lists work)
data List a = Nil | Cons a (List a) deriving Show


-- Make our own lists foldable
instance Foldable List where
  foldr f z Nil = z
  foldr f z (Cons a as) = f a (foldr f z as)
  
-- A binary tree data structure
data Tree a = Tip | Branch (Tree a) a (Tree a) deriving Show

-- Tree traversal

-- Traverse in order
inOrder :: Tree a -> [a]

