module Testes (main) where

import Test.QuickCheck
import Tipos 
import Validacao 

{-- //**********************************************\\
    || QuickCheck: Testes baseados em propriedades   ||
    \\**********************************************//
--}

-- Propriedade: Tabuleiro vazio deve ser considerado válido
prop_emptyBoard :: Bool
prop_emptyBoard = validTabuleiroCompleto (replicate 9 (replicate 9 0))

-- Propriedade: Um tabuleiro completamente preenchido sem repetições deve ser considerado válido
prop_filledBoard :: Bool
prop_filledBoard = validTabuleiroCompleto [[1,2,3,4,5,6,7,8,9],
                                           [4,5,6,7,8,9,1,2,3],
                                           [7,8,9,1,2,3,4,5,6],
                                           [2,3,4,5,6,7,8,9,1],
                                           [5,6,7,8,9,1,2,3,4],
                                           [8,9,1,2,3,4,5,6,7],
                                           [3,4,5,6,7,8,9,1,2],
                                           [6,7,8,9,1,2,3,4,5],
                                           [9,1,2,3,4,5,6,7,8]]

-- Propriedade: Tabuleiro resolvido é identificado corretamente
prop_solvedBoard :: Bool
prop_solvedBoard =
    validTabuleiroCompleto [[1,2,3,4,5,6,7,8,9],
              [4,5,6,7,8,9,1,2,3],
              [7,8,9,1,2,3,4,5,6],
              [2,3,4,5,6,7,8,9,1],
              [5,6,7,8,9,1,2,3,4],
              [8,9,1,2,3,4,5,6,7],
              [3,4,5,6,7,8,9,1,2],
              [6,7,8,9,1,2,3,4,5],
              [9,1,2,3,4,5,6,7,8]]

-- Propriedade: Tabuleiro incompleto não é considerado resolvido
prop_unsolvedBoard :: Bool
prop_unsolvedBoard =
    not $ validTabuleiroCompleto [[1,2,3,4,5,6,7,8,0],
                    [4,5,6,7,8,9,1,2,3],
                    [7,8,9,1,2,3,4,5,6],
                    [2,3,4,5,6,7,8,9,1],
                    [5,6,7,8,9,1,2,3,4],
                    [8,9,1,2,3,4,5,6,7],
                    [3,4,5,6,7,8,9,1,2],
                    [6,7,8,9,1,2,3,4,5],
                    [9,1,2,3,4,5,6,7,8]]

-- Executar os testes
main :: IO ()
main = do
    quickCheck prop_emptyBoard
    quickCheck prop_filledBoard
    quickCheck prop_solvedBoard
    quickCheck prop_unsolvedBoard