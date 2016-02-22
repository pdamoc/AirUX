module Aux.Skin (Skin, ColorTheme) where 

{-| Module Aux.Skin

# Types 

@docs ColorTheme, Skin
-}

type alias Style = List (String, String)


{-| -}
type alias ColorTheme = 
  { primary : String  
  , accent : String
  , lightPrimary : String
  , darkPrimary : String
  , lightAccent : String
  , darkAccent : String

  , whiteText : String
  , whiteSecondary : String 
  , whiteDisabled : String 
  , whiteIcons : String
  , whiteHintText : String
  , whiteDividers : String 

  , blackText : String
  , blackSecondary : String 
  , blackDisabled : String 
  , blackIcons : String
  , blackHintText : String
  , blackDividers : String 
  }
    

{-| -}
type alias Skin =
  { name : String
  , css : String
  , colors : ColorTheme
  , styles : 
    { button : Style 
    }

  }