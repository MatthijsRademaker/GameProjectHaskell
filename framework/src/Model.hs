{-# LANGUAGE DisambiguateRecordFields, NamedFieldPuns #-}

module Model where

import System.Random
-- | Game state
import Graphics.Gloss.Data.Vector

data World = World {
        -- Random generator
        rndGen           :: StdGen,
        -- Event queue
        rotateAction     :: RotateAction,
        movementAction   :: MovementAction,
        shootAction      :: ShootAction,
        rotation         :: Float,
        translation      :: Vector
        -- TODO: add more fields here!
    }
    
data RotateAction   = NoRotation | RotateLeft | RotateRight
 deriving (Eq)
data MovementAction = NoMovement | Thrust
 deriving (Eq)
data ShootAction    = Shoot      | DontShoot
 deriving (Eq)

initial :: Int -> World
initial seed = World (mkStdGen seed) NoRotation NoMovement DontShoot 0 0
