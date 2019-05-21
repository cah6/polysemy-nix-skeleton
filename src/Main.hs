{-# LANGUAGE TemplateHaskell #-}
module Main where

import Polysemy
import Polysemy.Input
import Polysemy.Output

data Teletype m a where
  ReadTTY  :: Teletype m String
  WriteTTY :: String -> Teletype m ()

makeSem ''Teletype

runTeletypeIO :: Member (Lift IO) r => Sem (Teletype ': r) a -> Sem r a
runTeletypeIO = interpret $ \case
  ReadTTY      -> sendM getLine
  WriteTTY msg -> sendM $ putStrLn msg

runTeletypePure :: [String] -> Sem (Teletype ': r) a -> Sem r ([String], a)
runTeletypePure i
  = runFoldMapOutput pure  -- For each WriteTTY in our program, consume an output by appending it to the list in a ([String], a)
  . runListInput i         -- Treat each element of our list of strings as a line of input
  . reinterpret2 \case     -- Reinterpret our effect in terms of Input and Output
      ReadTTY -> maybe "" id <$> input
      WriteTTY msg -> output msg


echo :: Member Teletype r => Sem r ()
echo = do
  i <- readTTY
  case i of
    "" -> pure ()
    _  -> writeTTY i >> echo


-- Let's pretend
echoPure :: [String] -> Sem '[] ([String], ())
echoPure = flip runTeletypePure echo

pureOutput :: [String] -> [String]
pureOutput = fst . run . echoPure

-- Now let's do things
echoIO :: Sem '[Lift IO] ()
echoIO = runTeletypeIO echo

-- echo forever
main :: IO ()
main = runM echoIO