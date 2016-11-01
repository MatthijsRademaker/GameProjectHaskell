{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_lambda_wars (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Matthijs\\Documents\\GitHub\\GameProject-Haskell\\framework\\.cabal-sandbox\\bin"
libdir     = "C:\\Users\\Matthijs\\Documents\\GitHub\\GameProject-Haskell\\framework\\.cabal-sandbox\\x86_64-windows-ghc-8.0.1\\lambda-wars-0.1.0.0-JKuqcpuegwDCZu7EN6iiRO"
datadir    = "C:\\Users\\Matthijs\\Documents\\GitHub\\GameProject-Haskell\\framework\\.cabal-sandbox\\x86_64-windows-ghc-8.0.1\\lambda-wars-0.1.0.0"
libexecdir = "C:\\Users\\Matthijs\\Documents\\GitHub\\GameProject-Haskell\\framework\\.cabal-sandbox\\lambda-wars-0.1.0.0-JKuqcpuegwDCZu7EN6iiRO"
sysconfdir = "C:\\Users\\Matthijs\\Documents\\GitHub\\GameProject-Haskell\\framework\\.cabal-sandbox\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lambda_wars_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lambda_wars_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "lambda_wars_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lambda_wars_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lambda_wars_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
