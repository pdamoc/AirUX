module Main exposing (..)

import Aux.MaterialSkin exposing (..)
import Aux exposing (button)
import Aux.Layout exposing (..)
import Html exposing (Html, program, div)
import Aux.Utils exposing (..)


skin : MaterialSkin
skin =
    indigoPink


type Msg
    = Click


view : a -> Html Msg
view model =
    div
        [ design <| alignItemsCenter <| justifyCenter <| fullscreen ]
        [ button skin "HELLO WORLD" Click ]


main : Program Never number Msg
main =
    program
        { init = ( 0, Cmd.none )
        , update = (\a m -> ( m, Cmd.none ))
        , view = view
        , subscriptions = \_ -> Sub.none
        }
