import Aux.MaterialSkin exposing (..)
import Aux exposing (button)
import StartApp exposing (start)
import Effects 

import Aux.Layout exposing (..)
import Html exposing (div)
import Aux.Utils exposing (..)

skin : MaterialSkin
skin = indigoPink

type Action = Click 

view : Signal.Address Action -> a -> Html.Html
view address model =
  div 
  [ design <| alignItemsCenter <| justifyCenter <| fullscreen ]
  [ button skin "HELLO WORLD" Click address ]

main : Signal Html.Html
main = 
  .html <| start 
    { init = (0, Effects.none)
    , update = (\a m -> (m, Effects.none))
    , view = view
    , inputs = [] }