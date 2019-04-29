{-# LANGUAGE GADTs #-}

module Main
  ( main
  ) where

import KValue (KValue (KvInt), TKind, ToTK, toKVal)


data Value' t where
  VC :: KValue t -> Value' t


class IsoValue a where
  toVal :: a -> Value' (ToTK Integer)

instance IsoValue Integer where
  toVal = VC . toKVal


main :: IO ()
main = do
  let (VC (KvInt i)) = toVal (41 :: Integer)
  print i
