meuConcat xss = [x | xs <- xss, x <- xs]

meuLength :: [a] -> Int
meuLength xs = sum [ 1 | _ <- xs]

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

primo :: Int -> Bool
primo n = divisores n == [1,n]

primos :: Int -> [Int]
primos n = [x | x <- [1..n], primo x]

todosPrimos :: [Int]
todosPrimos = [x | x <- [1..], primo x]

todosPrimos' :: [Int]
todosPrimos' = 2:3: [n | k <- [1..],  
                     n <- [6 * k - 1, 6 * k +1],
                     primo n]
                     
fatorial :: Integer -> Integer
fatorial 0 = 1
fatorial 1 = 1
fatorial n = fatorial' n 1
  where fatorial' 0 r = r
        fatorial' n r = fatorial' (n-1) (r*n)
        
fatorial2 :: Integer -> Integer
fatorial2 0 = 1
fatorial2 1 = 1
fatorial2 n = n * fatorial2 (n-1)

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort menores ++ [x] ++ qsort maiores
  where
    menores = [a | a <- xs, a < x]
    maiores = [b | b <- xs, b >= x]
    
somaQuadPares :: [Int] -> Int
somaQuadPares ns = sum
                 $ map (^2)
                 $ filter even ns

dobra :: Num a => a -> a
dobra x = 2*x

somaUm :: Num a => a -> a
somaUm x = x + 1

data Ponto = Ponto Double Double
                      deriving (Show)
                      
dist :: Ponto -> Ponto -> Double
dist (Ponto x y) (Ponto x' y') = sqrt
                               $ (x-x')^2 + (y-y')^2

data Forma = Circunferencia Ponto Double
           | Retangulo Ponto Double Double

area :: Forma -> Double
area (Circunferencia p r) = pi*r^2
area (Retangulo p l a) = l*a

data Contato = Contato { nome :: String, telefone :: String }
  deriving Show
  
contato = Contato "Maria" "9999-9999"

formataContato :: Contato -> String
formataContato c = (nome c) ++ " - " ++ (telefone c)

atualizaContato :: Contato -> String -> Contato
atualizaContato c t = c {telefone = t}

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just $ head xs

main = do
  -- print (meuConcat [[1,2],[3,4]])
  -- print (meuLength[1,2,3,4])
  -- print (divisores 15)
  -- print(primo 15)
  -- print(primo 11)
  -- print(primos 100)
  -- print(todosPrimos)
  -- print(todosPrimos')
  -- print(qsort[2,3,6,5,7,8,9,1,19,14,15,16])  
  -- print(qsort[50,49..10])
  -- print(somaQuadPares [0..50])
  -- print $ map somaUm $ map dobra [1..10]
  -- print $ map (somaUm.dobra) [1..10]
  -- print (formataContato contato)
  -- print (formataContato $ atualizaContato contato "8888-8888")
  
  