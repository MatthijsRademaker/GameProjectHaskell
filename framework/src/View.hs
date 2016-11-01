{-# LANGUAGE RecordWildCards #-}

module View (
    draw
) where

import Graphics.Gloss
import Graphics.Gloss.Geometry.Angle

import Model

-- | Drawing

draw :: Float -> Float -> World -> Picture
draw horizontalResolution verticalResolution world@(World{rndGen,rotateAction,movementAction,shootAction, rotation, translation})
                                                              =Pictures [translationText world, rotationText world, (Translate (takeX translation) (takeY translation) (Rotate rotation player))] 
                                                              
player :: Picture
player = Color white (polygon triangle)


rotationText :: World -> Picture
rotationText world@(World{rndGen,rotateAction,movementAction,shootAction, rotation, translation}) = Color black $ Translate (-100) 100 (text (show rotation))

translationText :: World -> Picture
translationText world@(World{rndGen,rotateAction,movementAction,shootAction, rotation, translation}) = Color red $ Translate (-100) 100 (text (show translation))

triangle :: Path 
triangle  = [(-5,-5), (5, -5), (0, 12)]

takeX :: Vector -> Float
takeX (x,_) = x

takeY :: Vector -> Float
takeY (_,y) = y