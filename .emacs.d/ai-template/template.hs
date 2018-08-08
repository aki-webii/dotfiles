#!/usr/bin/env runghc
{-
***********************************
 %file% - ????
 
   Copyright (C) %cyear% rakuten 
     by %name% <%mail%> 
     Date : %cdate%
***********************************
-}
import Prelude hiding (catch)
import Debug.Trace
import Data.List (elemIndices)
import System.Process ( runInteractiveProcess , waitForProcess )
import System.IO ( IOMode ( ReadMode , WriteMode , AppendMode , ReadWriteMode ) , openFile , hClose , hPutStr , hGetContents , stdin , stdout , stderr)
import System.Exit  ( ExitCode ( ExitSuccess , ExitFailure ) )
import Control.Exception ( Exception(ErrorCall) , throw , throwIO , catch )
-- ------------------------------------
quotedWords :: String -> [String]
quotedWords s = quote s
    where
      quote  [] = [""]
      quote  ('"':xs)  = quoted : recursive
          where 
            quoted = (dquote xs)!!0
            remain = (dquote xs)!!1
            recursive = tail $ quote remain
      quote  ('\'':xs)  = quoted : recursive
          where
            quoted = (squote xs)!!0
            remain = (squote xs)!!1
            recursive = tail $ quote remain
      quote  (' ':[]) = [""];
      quote  (' ':xs) = "" : (quote xs)
      quote  (x:xs) = word : recursive
          where 
            word = x : (head $ quote xs)
            recursive = tail $ quote xs
      dquote [] = ["",""]
      dquote ('"':xs) = "" : [xs]
      dquote (x:xs) = word : recursive
          where
            word = x : (dquote xs)!!0
            recursive = [(dquote xs)!!1]
      squote [] = ["",""]
      squote ('\'':xs) = "" : [xs]
      squote (x:xs) = word : recursive
          where 
            word = x : (squote xs)!!0
            recursive = [(squote xs)!!1]

-- runInteractiveProcess command [args] (Maybe workdir) (Maybe [(env,val)])
system :: String -> IO (Int,String,String)
system s = let cs = quotedWords s;
           in do {
                (i,o,e,p) <- runInteractiveProcess (head cs) (tail cs) Nothing Nothing;
                out <- hGetContents o;
                err <- hGetContents e;
                res <- waitForProcess p;
                return (e2i res,out,err);
              }
    where
      e2i ExitSuccess   = 0
      e2i (ExitFailure i) = i
--                  res <- getProcessExitCode p; <= async
-- ------------------------------------
replace :: Int -> a -> [a] -> [a]
replace i y xs = a ++ [b] ++ c
    where
      t1 = splitAt i xs 
      t2 = splitAt 1 (snd t1)
      a  = fst t1
      b  = y
      c  = snd t2
-- ------------------------------------
lookups :: (Eq a,Show a,Show b) => a -> [(a,b)] -> Maybe [b]
lookups _ [] = Nothing
lookups a b = pickup (elemIndices a keys) values
    where
      keys = fst (unzip b)
      values = snd (unzip b)
      pickup [] _ = Nothing
      pickup ks vs = Just (map (\x->vs!!x) ks)

-- ------------------------------------
sample :: IO ()
sample = do {
         print $ replace 2 [8,9] [[1,2],[3],[],[5,6,7]];
         print $ lookups 7 [(1,"abcd"),(2,"ef"),(3,"ghi"),(7,"jkl"),(7,"Jkl"),(7,"JKL"),(8,"mnopq")];
         print $ lookups 6 [(1,"abcd"),(2,"ef"),(3,"ghi"),(7,"jkl"),(7,"Jkl"),(7,"JKL"),(8,"mnopq")];
         (i,o,e) <- system "grep \"lookups 7\" -n -r . ";
         putStr o;
         putStr e;
         print i;
         catch ( do {         
                    rfh <- openFile "/tmp/foo.txt" ReadMode;
                    cs <- hGetContents rfh; -- semiClose
                    rd <- return $! cs; -- eval
--                     seq cs $return (); -- eval 
--                     return $! cs;      -- eval
                    hClose rfh;
                    print $ length rd;
                    wfh <- openFile "/tmp/foo.txt" AppendMode;
                    hPutStr wfh (rd++"foobar\nxyzzy");
                    hClose wfh;
                   throw (ErrorCall rd);
                 }
               ) (\e -> do putStr $ "Program finnished!! : " ++ (show e));
       }

-- ------------------------------------
main = do {
         sample;
       }
