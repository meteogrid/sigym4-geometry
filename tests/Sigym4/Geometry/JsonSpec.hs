{-# LANGUAGE FlexibleContexts, ScopedTypeVariables, OverloadedStrings #-}

module Sigym4.Geometry.JsonSpec (main, spec) where

import Test.Hspec
import Test.Hspec.QuickCheck
import Sigym4.Geometry
import Sigym4.Geometry.Json (jsonEncode, jsonDecode)
import Arbitrary ()

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Sigym4.Geometry.Binary" $ do
    describe "2D Point" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry Point V2) -> Bool)
    describe "3D Point" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry Point V3) -> Bool)

    describe "2D MultiPoint" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry MultiPoint V2) -> Bool)
    describe "3D MultiPoint" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry MultiPoint V3) -> Bool)

    describe "2D LineString" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry LineString V2) -> Bool)
    describe "3D LineString" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry LineString V3) -> Bool)

    describe "2D MultiLineString" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry MultiLineString V2) -> Bool)
    describe "3D MultiLineString" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry MultiLineString V3) -> Bool)

    describe "2D Polygon" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry Polygon V2) -> Bool)
    describe "3D Polygon" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry Polygon V3) -> Bool)

    describe "2D MultiPolygon" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry MultiPolygon V2) -> Bool)
    describe "3D MultiPolygon" $ do
      prop "deserializes the same thing it serializes" $
        (encodeDecodeIsId :: (Geometry MultiPolygon V3) -> Bool)

    {-
    describe "2D GeometryCollection" $ do
      it "deserializes the same thing it serializes" $ property $
        (encodeDecodeIsId :: (Geometry GeometryCollection V2) -> Bool)
    describe "3D MultiPolygon" $ do
      it "deserializes the same thing it serializes" $ property $
        (encodeDecodeIsId :: (Geometry GeometryCollection V3) -> Bool)
    -}

encodeDecodeIsId o = (jsonDecode . jsonEncode $ o) == Right o
