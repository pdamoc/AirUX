module Aux.Utils ((=>), dp) where
{-| Aux.Utils


# Functions 

@docs (=>), dp

-}

{-| readabiliy version of (,) 
-}
(=>) : a -> b -> ( a, b )
(=>) = (,)

{-| density independent pixels 
-}
dp : Int -> String
dp v = (toString v) ++ "px"