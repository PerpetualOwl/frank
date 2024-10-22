{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_frank (
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

bindir     = "/workspaces/frank/.stack-work/install/x86_64-linux-tinfo6-libc6-pre232/0577e3bb078f5f44b02b71d4fa4b145a69d44434d376dd5ca70cd09e3c278cd0/8.6.3/bin"
libdir     = "/workspaces/frank/.stack-work/install/x86_64-linux-tinfo6-libc6-pre232/0577e3bb078f5f44b02b71d4fa4b145a69d44434d376dd5ca70cd09e3c278cd0/8.6.3/lib/x86_64-linux-ghc-8.6.3/frank-0.1.0.0-6BynyVx89Jj15ysrfQYJvo-frank"
dynlibdir  = "/workspaces/frank/.stack-work/install/x86_64-linux-tinfo6-libc6-pre232/0577e3bb078f5f44b02b71d4fa4b145a69d44434d376dd5ca70cd09e3c278cd0/8.6.3/lib/x86_64-linux-ghc-8.6.3"
datadir    = "/workspaces/frank/.stack-work/install/x86_64-linux-tinfo6-libc6-pre232/0577e3bb078f5f44b02b71d4fa4b145a69d44434d376dd5ca70cd09e3c278cd0/8.6.3/share/x86_64-linux-ghc-8.6.3/frank-0.1.0.0"
libexecdir = "/workspaces/frank/.stack-work/install/x86_64-linux-tinfo6-libc6-pre232/0577e3bb078f5f44b02b71d4fa4b145a69d44434d376dd5ca70cd09e3c278cd0/8.6.3/libexec/x86_64-linux-ghc-8.6.3/frank-0.1.0.0"
sysconfdir = "/workspaces/frank/.stack-work/install/x86_64-linux-tinfo6-libc6-pre232/0577e3bb078f5f44b02b71d4fa4b145a69d44434d376dd5ca70cd09e3c278cd0/8.6.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "frank_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "frank_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "frank_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "frank_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "frank_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "frank_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
