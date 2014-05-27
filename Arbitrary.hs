{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE FlexibleInstances, FlexibleContexts #-}
module Arbitrary where

import Test.QuickCheck
import Control.Applicative ((<$>), (<*>))
import Control.Monad (replicateM)

import Sigym4.Geometry
import Sigym4.Geometry.Binary (ByteOrder(..))

instance Arbitrary ByteOrder where
  arbitrary = elements [NDR, XDR]

instance Arbitrary t => Arbitrary (V2 t) where
  arbitrary = V2 <$> arbitrary <*> arbitrary

instance Arbitrary t => Arbitrary (V3 t) where
  arbitrary = V3 <$> arbitrary <*> arbitrary <*> arbitrary

instance (Arbitrary (v Double), IsVertex v Double) =>
  Arbitrary (Geometry Point v) where
    arbitrary = fmap MkPoint arbitrary
