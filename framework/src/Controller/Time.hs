{-# LANGUAGE DisambiguateRecordFields, NamedFieldPuns, RecordWildCards       #-}
{-# LANGUAGE ParallelListComp                                                #-}

module Controller.Time (
    timeHandler
) where

import Control.Arrow ((>>>))

import Data.List

import Graphics.Gloss
import Graphics.Gloss.Geometry.Angle
import Graphics.Gloss.Data.Vector
import System.Random

import Model

-- | Time handling

timeHandler :: Float -> World -> World
timeHandler time world@(World{rndGen, rotateAction, movementAction, shootAction, rotation, translation}) 
     | rotateAction == RotateLeft  = world {rotation = rotation - 1}
     | rotateAction == RotateRight = world {rotation = rotation + 1}
     | movementAction == Thrust    = world {translation = translation `vectorPlus` (unitVectorAtAngle rotation*(3,14/180)) }
     | otherwise = world


vectorPlus :: Vector -> Vector -> Vector
vectorPlus (x1,y1) (x2,y2) = (x1+x2,y1+y2)