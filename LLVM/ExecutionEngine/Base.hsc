{-# LANGUAGE EmptyDataDecls #-}

module LLVM.ExecutionEngine.Base
    (
     -- * Execution engines
      ExecutionEngine
    , createExecutionEngine
    , disposeExecutionEngine
    ) where

import Foreign.C.String (CString)
import Foreign.C.Types (CInt)
import Foreign.Ptr (Ptr)

import LLVM.Base (ModuleProvider)

#include <llvm-c/ExecutionEngine.h>

data ExecutionEngine

foreign import ccall unsafe "LLVMCreateExecutionEngine" createExecutionEngine
    :: Ptr (Ptr ExecutionEngine) -> Ptr ModuleProvider -> Ptr CString
    -> IO CInt

foreign import ccall unsafe "LLVMDisposeExecutionEngine" disposeExecutionEngine
    :: Ptr ExecutionEngine -> IO ()