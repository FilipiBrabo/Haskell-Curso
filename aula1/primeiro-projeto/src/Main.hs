module Main where
  
dobra x = x + x

quadruplica x = dobra (dobra x)

fatorial n = product[1..n]

raiz2Grau :: (Ord a, Floating a) => a -> a -> a -> (a, a)
raiz2Grau a b c 
  | delta >= 0 = (x1, x2)
  | otherwise = error "Raízes negativas."                  
                  
  where 
    x1      = ((-b) + sqDelta) / (2*a)
    x2      = ((-b) - sqDelta) / (2*a)
    sqDelta = sqrt(delta)
    delta   = b^2 - 4*a*c

mul :: (Num a, Eq a) => a -> a -> a
mul 0 _ = 0
mul _ 0 = 0
mul 1 y = y
mul x 1 = x
mul x y = x*y

(&&) :: Bool -> Bool -> Bool
True && True = True
_    && _    = False

take_v2 :: Int -> [a] -> [a]
take_v2 n _ | n <= 0 = []
take_v2 _ []         = []
take_v2 n (x:xs)     = x : take_v2 (n-1) xs

length' :: (Num a) => [a] -> a
length' xs = sum [1 | _ <- xs]

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

primo :: Int -> Bool
primo n = divisores n == [1,n]

primos :: Int -> [Int]
primos n = [x | x <- [1..n], primo x]

par :: Integer -> Bool
par n = n `mod` 2 == 0

etiope :: Integer -> Integer -> Integer
etiope 1 n = n
etiope m n 
  | par m     = etiope (m `div` 2) (n*2)
  | otherwise = n + (etiope (m `div` 2) (n*2))


insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)  
  | x <= y    = x:y:ys
  | otherwise = y : insert x ys

isort :: (Ord a) => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)

-- qsort :: Ord a => [a] -> [a]
-- qsort [] = []
-- qsort (x:xs) = qsort menores ++ [x] ++ qsort maiores
--   where
--     --menores = [y | y <- xs, y < x]
--     --maiores = [y | y <- xs, y > x]

main :: IO ()
main = do
  putStrLn "hello world"