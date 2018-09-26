{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_primeiro_projeto (
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

bindir     = "D:\\Haskell-Curso\\aula1\\primeiro-projeto\\.stack-work\\install\\0f3b3bca\\bin"
libdir     = "D:\\Haskell-Curso\\aula1\\primeiro-projeto\\.stack-work\\install\\0f3b3bca\\lib\\x86_64-windows-ghc-8.4.3\\primeiro-projeto-0.1.0.0-KtsYMLw60LK3TJ6ayVXwyp-primeiro-projeto"
dynlibdir  = "D:\\Haskell-Curso\\aula1\\primeiro-projeto\\.stack-work\\install\\0f3b3bca\\lib\\x86_64-windows-ghc-8.4.3"
datadir    = "D:\\Haskell-Curso\\aula1\\primeiro-projeto\\.stack-work\\install\\0f3b3bca\\share\\x86_64-windows-ghc-8.4.3\\primeiro-projeto-0.1.0.0"
libexecdir = "D:\\Haskell-Curso\\aula1\\primeiro-projeto\\.stack-work\\install\\0f3b3bca\\libexec\\x86_64-windows-ghc-8.4.3\\primeiro-projeto-0.1.0.0"
sysconfdir = "D:\\Haskell-Curso\\aula1\\primeiro-projeto\\.stack-work\\install\\0f3b3bca\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "primeiro_projeto_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "primeiro_projeto_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "primeiro_projeto_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "primeiro_projeto_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "primeiro_projeto_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "primeiro_projeto_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
