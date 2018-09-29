module Main where

{- Lista de exercícios para praticar.
   Complete os códigos abaixo substituindo os termos `undefined`.
-}

-- | Exercício 01
-- Retorne o último elemento de uma lista.
-- Temos três padrões possíveis:
--   * Lista vazia, retorna vazio
--   * Lista contém um único elemento, que é a resposta
--   * Lista contém mais de um elemento, continue procurando
ultimo :: [a] -> [a]
ultimo []     = []
ultimo [x]    = [x]
ultimo (x:xs) = ultimo xs

-- | Exercício 02
-- Retorne o penúltimo elemento de uma lista.
penultimo :: [a] -> [a]
penultimo []     = []
penultimo [x]    = []
penultimo [x,y]  = [x]
penultimo (x:xs) = penultimo xs

-- | Exercício 03
-- Crie uma função `elementoEm` que imita o operador !!
-- porém começando a contar o índice do 1
elementoEm :: [a] -> Int -> a
elementoEm [] n         = error "Lista vazia."
elementoEm xs n | n < 1 = error "Indique um valor maior do que 1"
elementoEm (x:xs) 1 = head xs
elementoEm (x:xs) n = elementoEm xs (n-1)

-- | Exercício 04
-- Faça a função `tamanho` que retorna o tamanho
-- de uma lista.
tamanho :: [a] -> Int
tamanho []     = 0
tamanho (x:xs) = 1 + tamanho xs

-- | Exercício 05
-- Faça uma função `soma` recursivo que retorna 
-- a somatória dos elementos de uma lista
soma :: Num a => [a] -> a 
soma []     = 0
soma (x:xs) = x + soma xs

-- | Exercício 06
-- Faça uma função `produto` recursivo que retorna 
-- a produtória dos elementos de uma lista
produto :: Num a => [a] -> a 
produto []     = 1
produto (x:xs) = x * produto xs

-- | Exercício 07
-- Dada a função agrega, reescreva os exercícios 04, 05, 06 
-- utilizando essa função
agrega :: (a -> b -> b) -> b -> [a] -> b
agrega f v []     = v 
agrega f v (x:xs) = f x (agrega f v xs) 

tamanho' :: [a] -> Int
tamanho' xs = agrega faux 0 xs

faux ::Num a => b -> a -> a
faux a b = b + 1

soma' :: Num a => [a] -> a 
soma' xs = agrega (+) 0 xs

produto' :: Num a => [a] -> a 
produto' xs = agrega (*) 1 xs

-- | euler 01: 
-- A soma de todos os múltiplos de 3 e 5 menores que 10 é 23.
-- Encontre a soma de todos os múltiplos de 3 e 5 menores que 1000.

-- Estamos trabalhando com números inteiros, então criaremos a função 
-- euler01 que recebe um `n` e retorna a soma dos múltiplos até n.
-- a assinatura será:
euler01 :: Integer -> Integer

-- a definição inicial será simplesmente a soma dos múltiplos:
euler01 n = sum multiplos
  where
    -- primeiro passo, substitua `undefined` pela lista de 5 até n-1, de 5 em 5
    -- altere essa lista para filtrar os elementos que são múltiplos de 3.
    multiplos = [undefined]

-- | euler 02:
-- Retorne a soma dos números de fibonacci pares menores do que `n`
-- A sequência de fibonacci é: 1, 2, 3, 5, 8, ...
-- Podemos utilizar a função `takeWhile` que recebe um predicado e uma lista
-- e retorna os primeiros elementos da lista que obedecem o predicado.
-- Exemplo: takeWhile even [2,4,8,10,11,12,14], retornará [2,4,8,10]
euler02 :: Integer -> Integer
euler02 n = sum [x | x <- menoresQueN, even x]
  where 
    menoresQueN = undefined 

-- fibSeq
-- uma forma de definir a sequência de Fibonacci
-- é começar a lista com os dois primeiros elementos
-- e aproveitar a avaliação preguiçosa para gerar o restante.

-- Para isso utilizaremos a função `zipWith` que aplica uma função 
-- nos pares de elementos de uma lista:
-- zipWith (+) [1,2,3] [4,5,6]  = [5,7,9]
fibSeq :: [Integer]
fibSeq = 1 : 2 : zipWith (+) fibSeq (tail fibSeq)
-- Quando requisitarmos o quinto elemento dessa lista, o Haskell fará a seguinte sequência:
-- 1 : 2 : naoSeiAinda
-- 1 : 2 : zipWith (+) [1,2,naoSeiAinda] [2, naoSeiAinda]
-- 1 : 2 : (1+2) : zipWith (+) [2,naoSeiAinda] [naoSeiAinda]
-- 1 : 2 : 3 : zipWith (+) [2,naoSeiAinda] [naoSeiAinda]
-- 1 : 2 : 3 : zipWith (+) [2,3,naoSeiAinda] [3,naoSeiAinda]
-- 1 : 2 : 3 : (2+3) : zipWith (+) [3,naoSeiAinda] [naoSeiAinda]
-- 1 : 2 : 3 : 5 : zipWith (+) [3,5,naoSeiAinda] [5,naoSeiAinda]
-- 1 : 2 : 3 : 5 : (3+5) : zipWith (+) [5,naoSeiAinda] [naoSeiAinda]
-- 1 : 2 : 3 : 5 : 8 : zipWith (+) [5,8,naoSeiAinda] [8,naoSeiAinda]
-- 1 : 2 : 3 : 5 : 8 : zipWith (+) [5,8,naoMeImporto] [8,naoMeImporto]
-- 8

-- | euler 09
-- Uma tripla de pitágoras é o conjunto de três números
-- naturais a < b < c tal que:
-- a^2 + b^2 = c^2
-- Encontre a única tripla de Pitágoras tal que a + b + c = 1000
-- e retorne o produto a*b*c
--
-- DICA: `a` varia de 1 até infinito, porém `b` pode começar de a + 1
--       tendo os valores de `a` e `b`, você já sabe o valor de `c`
-- Para dar nomes a variáveis dentro de compreensão de lista basta usar `let`:
-- [x*y | x <- [1..100], let y = 2*x]
euler09 :: Integer
euler09 = head triplas
  where
    triplas = [a*b*c | a <- [1..], 
                       b <- undefined,
                       let c = 1000 - a - b,
                       b < c,
                       a^2 + b^2 == c^2]


main :: IO ()
main = do
  print (ultimo [1..10])
  print (penultimo [1..10])
  print (elementoEm [1..10] 3)
  print (tamanho [1..10])
  print (soma [1..10])
  print (produto [1..10])
  print (tamanho' [1..10])
  print (soma' [1..10])
  print (produto' [1..10])
  print (euler01 1000)
  print (euler02 10000)
  print euler09