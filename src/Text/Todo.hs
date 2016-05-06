{-# LANGUAGE TemplateHaskell #-}

import           Control.Lens
import           Data.Text
import           Data.Time.Calendar

data Content
  = Free    Text   -- free text
  | Project Text   -- +project
  | Context Text   -- @context
  | KeyVal  Text Text  -- key:value

data Todo = Todo
  { _todoCompletion :: Maybe Day
  , _todoPriority   :: Maybe Char
  , _todoCreation   :: Maybe Day
  , _todoContent    :: [Content]
  }

makeLenses ''Todo
