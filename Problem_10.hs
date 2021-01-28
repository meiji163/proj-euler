import System.Environment
import qualified Data.PQueue.Prio.Min as PQ
-- pqueue package: https://hackage.haskell.org/package/pqueue

sieve :: (Num a, Ord a) => [a] -> [a]
sieve [] = []
sieve (x:xs) = x : sieve' xs (insertp x xs PQ.empty)
    where 
        insertp p xs table = PQ.insert (p^2) (map (*p) xs) table
        sieve' [] table = []
        sieve' (x:xs) table
            | next <= x = sieve' xs (adjust table) 
            | otherwise = x : sieve' xs (insertp x xs table)
                where
                    (next,_) = PQ.findMin table
                    adjust table
                        | n <= x = adjust ( PQ.insert n' ns (PQ.deleteMin table))
                        | otherwise = table
                            where
                                (n, n':ns) = PQ.findMin table

sieveOptim = 2:3:5: sieve ( shift incr 7 )
    where
        incr = cycle [4,2,4,2,4,6,2,6]
        shift (x:xs) n = n : shift xs (n+x) 
        
main :: IO ()
main = do
    args <- getArgs 
    let m = (read $ head args :: Int)
    print $ sum (takeWhile (<m) sieveOptim)
