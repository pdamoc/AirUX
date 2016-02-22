import Aux.MaterialSkin exposing (..)
import Aux exposing (button)
import StartApp exposing (start)
import Effects 

import Aux.Layout exposing (..)
import Html exposing (div)
import Aux.Utils exposing (..)

skin = indigoPink

type Action = Click 


view address model =
  div 
  [ design <| alignItemsCenter <| justifyCenter
    [ "width" => "100vw"
    , "height" => "100vh"
    ]
  ]
  [ button skin "HELLO WORLD" Click address ]

main = 
  .html <| start 
    { init = (0, Effects.none)
    , update = (\a m -> (m, Effects.none))
    , view = view
    , inputs = [] }