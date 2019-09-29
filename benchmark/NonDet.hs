{-# LANGUAGE TypeApplications #-}
module NonDet
( benchmark
) where

import qualified Control.Carrier.NonDet.Church as NonDet.Church
import           Control.Carrier.Pure
import           Gauge hiding (benchmark)
import qualified NonDet.NQueens

benchmark :: Gauge.Benchmark
benchmark = bgroup "NonDet"
  [ bgroup "N-queens problem"
    [ NonDet.NQueens.benchmark "NonDet.Church" (run . NonDet.Church.runNonDet)
    , NonDet.NQueens.benchmark "[]"            (id @[_])
    ]
  ]
