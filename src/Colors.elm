module Colors exposing (..)

import Css exposing (..)
import String exposing (fromInt)


{-| Background for main content and text color on dark
-}
lightGrey : Color
lightGrey =
    hex "E5E7E9"

{-| Background for secondary content and text color on dark
-}
secondaryLightGrey : Color
secondaryLightGrey =
    hex "D7DBDD"


{-| Slightly colored background around favorite books
-}
itemHighlight : Color
itemHighlight =
    hex itemHighlightHex


{-| ... favorite books. also included in shadow style for such books
-}
itemHighlightHex : String
itemHighlightHex =
    "F7DC6F66"


{-| Primary link (and button) color for light backgrounds
-}
link : Color
link =
    rgb 0 72 96


{-| Link decoration
-}
link025 : Color
link025 =
    rgba 0 72 96 0.25


{-| Primary link (and button) color for dark backgrounds
-}
linkOnDark : Color
linkOnDark =
    rgb 97 185 214

{-| Link decoration for dark backgrounds
-}
linkOnDark025 : Color
linkOnDark025 =
    rgba 97 185 214 0.25


{-| Link (and button) hover color for light backgrounds
-}
hover : Color
hover =
    rgb 194 78 59


{-| Hover decoration
-}
hover025 : Color
hover025 =
    rgba 194 78 59 0.25


{-| Link (and button) hover color for dark backgrounds
-}
hoverOnDark : Color
hoverOnDark =
    hover


{-| Text color for main content and background for dark
-}
darkGrey : Color
darkGrey =
    rgb 18 25 33


{-| Background for dark stickers
-}
darkGrey08 : Color
darkGrey08 =
    rgba 18 25 33 0.8


{-| Selection background for whole page, also used in stickers
-}
selectionSrc : { r : Int, g : Int, b : Int }
selectionSrc =
    { r = 255, g = 152, b = 0 }


pageSelection : String
pageSelection =
    "rgba("
        ++ fromInt selectionSrc.r
        ++ ", "
        ++ fromInt selectionSrc.g
        ++ ", "
        ++ fromInt selectionSrc.b
        ++ ", 0.71)"


{-| ... and text color for dark stickers
-}
selection : Color
selection =
    rgb selectionSrc.r selectionSrc.g selectionSrc.b


{-| Background for stickers
-}
selection07 : Color
selection07 =
    rgba selectionSrc.r selectionSrc.g selectionSrc.b 0.7
