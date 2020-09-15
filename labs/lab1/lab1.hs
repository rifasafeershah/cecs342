
-- CECS 342 Lab 1 Quicksort and Mergesort in C vs Haskell
-- main method for testing qsort and msort methods
main = do 
  putStrLn "Quick Sort" -- use putStrLn instead of print to get rid of quotes
  print (qsort [4,65,2,-31,0,99,2,83,782,1]) -- calling qsort and printing the results
  putStrLn "Merge Sort" -- use putStrLn instead of print to get rid of quotes
  print (msort [4,65,2,-31,0,99,2,83,782,1]) -- calling msort and printing the results


--quick sort method declaration : (Ord a) - type constraint that a must be an orderable type ; [a] -> [a] - list must be of type a and return a list of type a
qsort :: (Ord a) => [a] -> [a]  
qsort [] = []  -- empty list, then return an empty list
qsort (x:xs) =  -- list length >= 1, then apply (x:xs) to use x as our pivot
  let smallerSorted = qsort [a | a <- xs, a <= x] -- creates list of values less than x and passes to q sort
      biggerSorted = qsort [a | a <- xs, a > x]-- creates list of values less than x and passes to q sort
  in  smallerSorted ++ [x] ++ biggerSorted -- pivot placed between the two lists


--merge sort method  : (Ord a) - type constraint that a must be an orderable type ; [a] -> [a] - list must be of type a and return a list of type a
msort :: (Ord a) => [a] -> [a]
msort [] = []  -- empty list, then return an empty list
msort [a] = [a] -- list of length 1, then return the same
msort xs = merge (msort (firstHalf xs)) (msort (secondHalf xs)) -- merging sorted first half and sorted second half 

firstHalf  xs = let { n = length xs } in take (div n 2) xs -- takes the first half of the list
secondHalf xs = let { n = length xs } in drop (div n 2) xs -- drops the first half of the list to get the second half

--merge method: merges two sorted array halves together; : (Ord a) - type constraint that a must be an orderable type ; [a] -> [a] -> [a] - accepts two lists of type a and return a list of type a
merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs -- first half and empty second half = return first half
merge [] ys = ys -- empty first half and second half = return second half
merge (x:xs) (y:ys) = if x <= y then x:merge xs (y:ys) else y:merge (x:xs) ys -- performs the merge process by comparing first element of first half x with first element of second half y
