module Colors exposing (..)

import Css exposing (..)
import String exposing (fromInt)


light1 : Color
light1 =
    hex "E5E7E9"


light2 : Color
light2 =
    hex "E5E7E9"


light3 : Color
light3 =
    hex "CACFD2"


light4 : Color
light4 =
    hex "BDC3C7"


highlightHex : String
highlightHex =
    "F7DC6F66"


highlight : Color
highlight =
    hex highlightHex


link : Color
link =
    rgb 0 72 96


linkAlpha05 : Color
linkAlpha05 =
    rgba 0 72 96 0.5


linkAlpha025 : Color
linkAlpha025 =
    rgba 0 72 96 0.25


linkOnBlack : Color
linkOnBlack =
    rgb 97 185 214


hover : Color
hover =
    rgb 194 78 59


hover05 : Color
hover05 =
    rgba 194 78 59 0.5


hover025 : Color
hover025 =
    rgba 194 78 59 0.25


dark1 : Color
dark1 =
    rgb 18 25 33


dark1b : Color
dark1b =
    rgba 18 25 33 0.8


dark2 : Color
dark2 =
    dark1


sel1rgb =
    { r = 255, g = 152, b = 0 }


selection1 : String
selection1 =
    "rgba("
        ++ fromInt sel1rgb.r
        ++ ", "
        ++ fromInt sel1rgb.g
        ++ ", "
        ++ fromInt sel1rgb.b
        ++ ", 0.71)"


selection1a : Color
selection1a =
    rgb sel1rgb.r sel1rgb.g sel1rgb.b


selection1b : Color
selection1b =
    rgba sel1rgb.r sel1rgb.g sel1rgb.b 0.7
