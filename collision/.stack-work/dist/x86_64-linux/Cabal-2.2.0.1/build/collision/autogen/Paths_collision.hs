{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_collision (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/filipi/Documents/Haskell-Curso/collision/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/bin"
libdir     = "/home/filipi/Documents/Haskell-Curso/collision/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/lib/x86_64-linux-ghc-8.4.3/collision-0.1.0.0-DBYroBhbH2TFP5fdozLYlA-collision"
dynlibdir  = "/home/filipi/Documents/Haskell-Curso/collision/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/lib/x86_64-linux-ghc-8.4.3"
datadir    = "/home/filipi/Documents/Haskell-Curso/collision/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/share/x86_64-linux-ghc-8.4.3/collision-0.1.0.0"
libexecdir = "/home/filipi/Documents/Haskell-Curso/collision/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/libexec/x86_64-linux-ghc-8.4.3/collision-0.1.0.0"
sysconfdir = "/home/filipi/Documents/Haskell-Curso/collision/.stack-work/install/x86_64-linux/lts-12.10/8.4.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "collision_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "collision_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "collision_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "collision_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "collision_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "collision_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
