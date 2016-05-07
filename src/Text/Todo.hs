{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

import           Control.Lens
import qualified Data.Text          as T
import           Data.Time.Calendar

import           Text.Parsec.Char
import           Text.Parsec.Text

data Content
  = Free    T.Text   -- free text
  | Project T.Text   -- +project
  | Context T.Text   -- @context
  | KeyVal  T.Text T.Text  -- key:value
  deriving Show

data Todo = Todo
  { _todoCompletion :: Maybe Day
  , _todoPriority   :: Maybe Char
  , _todoCreation   :: Maybe Day
  , _todoContent    :: [Content]
  }
  deriving Show

makeLenses ''Todo

spaces1 :: Parser ()
spaces1 = () <$ many1 space

parseTodo :: Parser Todo
parseTodo =
  Todo <$> parseCompletion <*> parsePriority <*> parseCreation <*> parseContent

parseCompletion :: Parser (Maybe Day)
parseCompletion = try (char 'x' *> spaces1 *> parseDay) <|> pure Nothing

parseDay :: Parser Day
parseDay = pure undefined

