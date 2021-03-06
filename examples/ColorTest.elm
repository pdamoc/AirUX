module ColorTest exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Aux.MaterialColors exposing (..)
import Aux.MaterialSkin exposing (..)
import Aux.Layout exposing (..)
import Debug
import Color exposing (Color, toRgb)


toCssColor : Color -> String
toCssColor color =
    let
        r =
            toRgb color
    in
        Debug.log "color" <|
            "rgba("
                ++ (toString r.red)
                ++ ", "
                ++ (toString r.green)
                ++ ", "
                ++ (toString r.blue)
                ++ ", "
                ++ (toString r.alpha)
                ++ ")"


subBox : (PrimaryColor -> Variant -> String) -> PrimaryColor -> Variant -> Html msg
subBox f p c =
    div
        [ style
            [ ( "width", "40px" )
            , ( "height", "20px" )
            , ( "backgroundColor", f p c )
            ]
        ]
        []


primBox : PrimaryColor -> Html msg
primBox c =
    div
        [ design <|
            justifyAround
                [ ( "width", "250px" )
                , ( "height", "280px" )
                , ( "backgroundColor", primaryToString c )
                ]
        ]
        [ p
            [ design <|
                alignSelfCenter
                    [ ( "fontSize", "32" )
                    , ( "fontWeight", "bold" )
                    , ( "color"
                      , if (List.member (toString c) [ "Lime", "Yellow", "Amber" ]) then
                            blackText
                        else
                            whiteText
                      )
                    ]
            ]
            [ text <| toString c ]
        ]


box : PrimaryColor -> Html msg
box c =
    div
        [ design <| shadow 2 [ ( "margin", "10px" ) ]
        ]
        [ primBox c
        , div
            [ design <| column [] ]
            (List.map (subBox toHex c) variants)
        ]


main : Html msg
main =
    div
        [ design <|
            Aux.Layout.wrap <|
                alignContentAround <|
                    alignItemsCenter <|
                        justifyCenter fullscreen
        ]
        (List.map box primaries)
