{-# LANGUAGE GADTs #-}

module Main
  ( main
  ) where

import KValue (KValue (KvInt), toKVal)


main :: IO ()
main = do
  let (KvInt i) = (id . toKVal) (41 :: Integer)
  print i
