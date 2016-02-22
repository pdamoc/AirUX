module Aux.MaterialSkin (MaterialSkin, skin, shadow, indigoPink) where

{-| Aux.MaterialSkin


# Types

@docs MaterialSkin

# Functions 

@docs shadow, skin

# Values 

@docs indigoPink

-}

import Aux.MaterialColors exposing (colorTheme, PrimaryColor(..))
import Aux.Skin exposing (Skin, ColorTheme)
import Aux.Layout exposing (design, alignItemsCenter)
import Aux.Utils exposing (..)

type alias Design = List (String, String)

{-| type alias to avoid the need for Aux.Skin import. 
-}
type alias MaterialSkin = Skin

{-| adds a shadow to the box. 
-}
shadow : Int -> Design -> Design
shadow value design =
  let 
    string = 
      case value of 
        2 -> "0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12)"
        3 -> "0 3px 4px 0 rgba(0, 0, 0, 0.14), 0 3px 3px -2px rgba(0, 0, 0, 0.2), 0 1px 8px 0 rgba(0, 0, 0, 0.12)"
        4 -> "0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.2)"
        6 -> "0 6px 10px 0 rgba(0, 0, 0, 0.14), 0 1px 18px 0 rgba(0, 0, 0, 0.12), 0 3px 5px -1px rgba(0, 0, 0, 0.2)"
        8 -> "0 8px 10px 1px rgba(0, 0, 0, 0.14), 0 3px 14px 2px rgba(0, 0, 0, 0.12), 0 5px 5px -3px rgba(0, 0, 0, 0.2)"
        16 -> "0 16px 24px 2px rgba(0, 0, 0, 0.14), 0 6px 30px 5px rgba(0, 0, 0, 0.12), 0 8px 10px -5px rgba(0, 0, 0, 0.2)"
        24 -> "0 9px 46px 8px rgba(0, 0, 0, 0.14), 0 11px 15px -7px rgba(0, 0, 0, 0.12), 0 24px 38px 3px rgba(0, 0, 0, 0.2)"
        _ -> "none"
  in 
    [ ("boxShadow", string)] ++ design

robotoAndIcons : String
robotoAndIcons = """
@import url(https://fonts.googleapis.com/icon?family=Material+Icons);
@import url(https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en)
"""

{-| creates a skin from a colorTheme 
-}
skin : ColorTheme -> Skin
skin colorTheme = 
  { name = "Material Skin"
  , css = robotoAndIcons
  , colors = colorTheme
  , styles = 
    { button = alignItemsCenter <| shadow 2
      [ "fontFamily" => " \"Roboto\", \"Helvetica\", \"Arial\", sans-serif"
      , "fontSize" => dp 14
      , "fontWeight" => "600"
      , "borderRadius" => dp 2
      , "height" => dp 36
      , "background" => colorTheme.primary
      , "color" => colorTheme.whiteText
      , "padding" => "0px 16px"
      , "cursor" => "pointer"
      ]
    }
  }

{-| the Indigo - Pink Skin
-}
indigoPink : MaterialSkin
indigoPink = skin <| colorTheme Indigo Pink

