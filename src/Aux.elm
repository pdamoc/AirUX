module Aux exposing (Page, button)

{-| Module Aux

# Types

@docs Page

# Functions

@docs button


-}

import Html exposing (..)
import Html.Attributes exposing (style, type_)
import Html.Events exposing (onClick)
import Aux.Layout exposing (..)
import Aux.Skin exposing (Skin)
import Aux.Utils exposing (..)


{-| A Page captures the idea of a Place and its context.
-}
type Page
    = Page


{-| An App is a series of Pages/Places with a router that routes the requests to
the proper place.
-}
type App
    = App


emptySpace : Int -> Int -> Html msg
emptySpace width height =
    div
        [ style
            [ "width" => dp width
            , "height" => dp height
            ]
        ]
        []


{-| -}
page : Skin -> Html msg -> Html msg
page skin ui =
    div []
        [ node "style" [ type_ "text/css" ] [ text skin.css ]
        , ui
        ]


{-| -}
button : Skin -> String -> msg -> Html msg
button skin label action =
    div
        [ onClick action
        , design <| alignItemsCenter skin.styles.button
        ]
        [ text label ]
