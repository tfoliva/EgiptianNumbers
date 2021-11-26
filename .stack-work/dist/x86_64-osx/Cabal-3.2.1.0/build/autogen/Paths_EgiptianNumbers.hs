{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_EgiptianNumbers (
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

bindir     = "/Users/tiagooliva/code/EgiptianNumbers/.stack-work/install/x86_64-osx/59c78852f69f49554a9160f1b77f6bbb7893e5d634f22a3635f5e632a992769d/8.10.7/bin"
libdir     = "/Users/tiagooliva/code/EgiptianNumbers/.stack-work/install/x86_64-osx/59c78852f69f49554a9160f1b77f6bbb7893e5d634f22a3635f5e632a992769d/8.10.7/lib/x86_64-osx-ghc-8.10.7/EgiptianNumbers-0.1.0.0-3J9QTJy2gP4JWb5lJXr5g6"
dynlibdir  = "/Users/tiagooliva/code/EgiptianNumbers/.stack-work/install/x86_64-osx/59c78852f69f49554a9160f1b77f6bbb7893e5d634f22a3635f5e632a992769d/8.10.7/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/tiagooliva/code/EgiptianNumbers/.stack-work/install/x86_64-osx/59c78852f69f49554a9160f1b77f6bbb7893e5d634f22a3635f5e632a992769d/8.10.7/share/x86_64-osx-ghc-8.10.7/EgiptianNumbers-0.1.0.0"
libexecdir = "/Users/tiagooliva/code/EgiptianNumbers/.stack-work/install/x86_64-osx/59c78852f69f49554a9160f1b77f6bbb7893e5d634f22a3635f5e632a992769d/8.10.7/libexec/x86_64-osx-ghc-8.10.7/EgiptianNumbers-0.1.0.0"
sysconfdir = "/Users/tiagooliva/code/EgiptianNumbers/.stack-work/install/x86_64-osx/59c78852f69f49554a9160f1b77f6bbb7893e5d634f22a3635f5e632a992769d/8.10.7/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "EgiptianNumbers_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "EgiptianNumbers_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "EgiptianNumbers_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "EgiptianNumbers_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "EgiptianNumbers_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "EgiptianNumbers_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
