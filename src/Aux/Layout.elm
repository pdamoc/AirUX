module Aux.Layout 
  ( Design, design
  , row, column, rowReverse, columnReverse
  , wrap, wrapReverse, noWrap
  , justifyStart, justifyCenter, justifyEnd, justifyBetween, justifyAround
  , alignItemsStart, alignItemsCenter, alignItemsEnd
  , alignItemsStretch, alignItemsBaseline
  , alignContentStart, alignContentCenter, alignContentEnd, alignContentStretch
  , alignContentBetween, alignContentAround
  , flex, order
  , alignSelfStart, alignSelfCenter, alignSelfEnd, alignSelfStretch, alignSelfBaseline
  ) where 

{-| Module Aux.Layout

# Types 

@docs Design

# Functions 

@docs design, row, column, rowReverse, columnReverse, wrap, wrapReverse, noWrap

@docs justifyStart, justifyCenter, justifyEnd, justifyBetween, justifyAround

@docs alignItemsStart, alignItemsCenter, alignItemsEnd, alignItemsStretch, alignItemsBaseline

@docs alignContentStart, alignContentCenter, alignContentEnd, alignContentStretch, alignContentBetween, alignContentAround

@docs flex, order, alignSelfStart, alignSelfCenter, alignSelfEnd, alignSelfStretch, alignSelfBaseline 

-}

import Html exposing (Attribute)
import Html.Attributes exposing (style)
import Vendor exposing (prefix, Prefix(Webkit))

{-| -}
type alias Design = List (String, String)

{-| -}
design : Design -> Attribute
design design = 
  style 
    ([("display", if prefix == Webkit then "-webkit-flex" else "flex")]
    ++ design)


direction : (String, String, String) -> Design -> Design
direction (boxDirection, boxOrientation, value) design =
  [ ("-webkit-box-direction", boxDirection)
  , ("-webkit-box-orient", boxOrientation)
  , ("-webkit-flex-direction", value)
  , ("-ms-flex-direction", value)
  , ("flex-direction", value)
  ] ++ design

{-| -}
row : Design -> Design
row = direction ("normal", "horizontal", "row")


{-| -}
rowReverse : Design -> Design
rowReverse = direction ("reverse", "horizontal", "row-reverse")

{-| -}
column : Design -> Design
column = direction ("normal", "vertical", "column")

{-| -}
columnReverse : Design -> Design
columnReverse = direction ("reverse", "vertical", "column-reverse")

wrapVendor : (String, String) -> Design -> Design
wrapVendor (vendorValue, value) design = 
  [ ("-webkit-flex-wrap", value)
  , ("-ms-flex-wrap", vendorValue)
  , ("flex-wrap", value)
  ] ++ design

{-| -}
wrap : Design -> Design
wrap = wrapVendor ("wrap", "wrap")

{-| -}
wrapReverse : Design -> Design
wrapReverse = wrapVendor ("wrap-reverse", "wrap-reverse")

{-| -}
noWrap : Design -> Design
noWrap = wrapVendor ("none", "nowrap")

justifyVendor : (String, String, String) -> Design -> Design
justifyVendor (webkitValue, msValue, value) design =
  [ ("-webkit-box-pack", webkitValue)
  , ("-webkit-justify-content", value)
  , ("-ms-flex-pack", msValue)
  , ("justify-content", value)
  ] ++ design

{-| -}
justifyStart : Design -> Design
justifyStart = justifyVendor ("start", "start", "flex-start")


{-| -}
justifyCenter : Design -> Design
justifyCenter = justifyVendor ("center", "center", "center")


{-| -}
justifyEnd : Design -> Design
justifyEnd = justifyVendor ("end", "end", "flex-end")


{-| -}
justifyBetween : Design -> Design
justifyBetween = justifyVendor ("justify", "justify", "space-between")


{-| -}
justifyAround : Design -> Design
justifyAround = justifyVendor ("none", "distribute", "space-around")



alignItemsVendor : (String, String) -> Design -> Design
alignItemsVendor (vendorValue, value) design =
  [ ("-webkit-box-align", vendorValue)
  , ("-webkit-align-items", value)
  , ("-ms-flex-align", vendorValue)
  , ("align-items", value)
  ] ++ design

{-| -}
alignItemsStart : Design -> Design
alignItemsStart = alignItemsVendor ("start", "flex-start")


{-| -}
alignItemsCenter : Design -> Design
alignItemsCenter = alignItemsVendor ("center", "center")



{-| -}
alignItemsEnd : Design -> Design
alignItemsEnd = alignItemsVendor ("end", "flex-end")


{-| -}
alignItemsStretch : Design -> Design
alignItemsStretch = alignItemsVendor ("stretch", "stretch")


{-| -}
alignItemsBaseline : Design -> Design
alignItemsBaseline = alignItemsVendor ("baseline", "baseline")


alignContentVendor : String -> Design -> Design
alignContentVendor value design = 
  [ ("-webkit-align-content", value)
  , ("align-content", value)
  ] ++ design  

{-| -}
alignContentStart : Design -> Design
alignContentStart = alignContentVendor "flex-start"


{-| -}
alignContentCenter : Design -> Design
alignContentCenter = alignContentVendor "center"


{-| -}
alignContentEnd : Design -> Design
alignContentEnd = alignContentVendor "flex-end"


{-| -}
alignContentStretch : Design -> Design
alignContentStretch = alignContentVendor "stretch"


{-| -}
alignContentBetween : Design -> Design
alignContentBetween = alignContentVendor "space-between"


{-| -}
alignContentAround : Design -> Design
alignContentAround = alignContentVendor "space-around"


{-| -}
flex : Float -> Float -> String -> Design -> Design
flex grow shrink basis design =
  let
    growString =
      toString grow

    shrinkString =
      toString shrink

    value =
      growString  ++ " " ++ shrinkString ++ " " ++ basis
  in
    [ ("-webkit-box-flex", growString)
    , ("-webkit-flex", value)
    , ("-ms-flex", value)
    , ("flex", value)
    ] ++ design

{-| -}
order : Int -> Design -> Design
order value design=
  let 
    string =
      toString value
  in
    [ ("-webkit-box-ordinal-group", string)
    , ("-webkit-order", string)
    , ("-ms-flex-order", string)
    , ("-order", string)
    ] ++ design


alignSelfVendor : String -> Design -> Design
alignSelfVendor value design =
  [ ("-webkit-align-self", value)
  , ("-ms-flex-item-align", value)
  , ("align-self", value)
  ] ++ design


{-| -}
alignSelfStart : Design -> Design
alignSelfStart = alignSelfVendor "flex-start"


{-| -}
alignSelfCenter : Design -> Design
alignSelfCenter = alignSelfVendor "center"


{-| -}
alignSelfEnd : Design -> Design
alignSelfEnd = alignSelfVendor "flex-end"


{-| -}
alignSelfStretch : Design -> Design
alignSelfStretch = alignSelfVendor "stretch"


{-| -}
alignSelfBaseline : Design -> Design
alignSelfBaseline = alignSelfVendor "baseline"




