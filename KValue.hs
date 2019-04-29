{-# LANGUAGE GADTs, DataKinds, TypeFamilies #-}

module KValue
  ( TKind (..)
  , ToTK
  , KValue (..)
  , ToKVal (..)
  ) where


data TKind = KInt

type family ToTK a :: TKind where
  ToTK Integer = 'KInt


data KValue (t :: TKind) where
  KvInt :: Integer -> KValue 'KInt

class ToKVal a where
  toKVal :: a -> KValue (ToTK a)

instance ToKVal Integer where
  toKVal = KvInt
