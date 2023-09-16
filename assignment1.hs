-- module Main where

{- This is a framework in which all functions to be written are "undefined".  -
 - Note that in most cases parameters, pattern-matching and guards have been  -
 - omitted! You will have to add those yourself.                              -}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

import Data.Char
import Data.List
import Data.Maybe

-- | Model

type Field = String
type Row   = [Field]
type Table = [Row]

-- | Main

-- main :: IO ()
-- main = interact (unlines . exercise . lines)

exercise :: [String] -> [String]
exercise = printTable
         . project ["last", "first", "salary"]
         . select "gender" "male"
         . parseTable

-- | Parsing

-- * Exercise 1

parseTable :: [String] -> Table
parseTable = map words

-- | Printing

-- * Exercise 2

printWord :: Int -> String
printWord numChars = replicate numChars '-'

printLine :: [Int] -> String
printLine = (++ "+") . ("+" ++) . intercalate "+" . map printWord

-- * Exercise 3

printField :: Int -> String -> String
printField len content
  | all isDigit content = replicate (len - length content) ' ' ++ content
  | otherwise           = content ++ replicate(len - length content) ' '

-- * Exercise 4              

printRow :: [(Int, String)] -> String
printRow = ("|" ++ ) . (++ "|") . intercalate "|" . map (uncurry printField)

-- * Exercise 5

columnWidths :: Table -> [Int]
columnWidths = map (maximum . map length) . transpose

-- * Exercise 6

printTable :: Table -> [String]
printTable table@(header:rows)
  = let colWidth = columnWidths table
        line = printLine colWidth
        headerContentsUpper = map(map toUpper) header
        headerRow = printRow (zip colWidth headerContentsUpper)
        restOfRows = map (printRow . zip colWidth ) rows
    in line : headerRow : line : restOfRows ++ [line]

-- | Querying

-- * Exercise 7

select :: Field -> Field -> Table -> Table
select column value table@(header:rows)
    = undefined

-- * Exercise 8

project :: [Field] -> Table -> Table
project columns table@(header:_)
    = undefined