module Aux (Page) where 

{-| Module Aux

# Types

@docs Page

-}

import Html exposing (..)
import Html.Attributes exposing (style)

{-| -}
type Page = Page

(=>) : a -> b -> ( a, b )
(=>) = (,)


dp : Int -> String
dp = toString 

emptySpace : Int -> Int -> Html
emptySpace width height = 
  div 
  [ style 
    [ "width" => dp width
    , "height" => dp height 
    ]
  ][]