module Aux (Page, button) where 

{-| Module Aux

# Types

@docs Page

# Functions

@docs button


-}

import Html exposing (..)
import Html.Attributes exposing (style, type')
import Html.Events exposing (onClick)
import Aux.Layout exposing (..)
import Aux.Skin exposing (Skin)
import Aux.Utils exposing (..)

{-| A Page captures the idea of a Place and its context. -}
type Page = Page

{-| An App is a series of Pages/Places with a router that routes the requests to
the proper place. -}
type App = App 

emptySpace : Int -> Int -> Html
emptySpace width height = 
  div 
  [ style 
    [ "width" => dp width
    , "height" => dp height 
    ]
  ][]


{-| -}
page : Skin -> Html -> Html 
page skin ui = 
  div []
  [ node "style" [type' "text/css"] [text skin.css]
  , ui ]


{-| -}
button : Skin -> String -> action -> Signal.Address action -> Html
button skin label action address =
  div 
  [ onClick address action
  , design <| alignItemsCenter skin.styles.button]
  [ text label]

