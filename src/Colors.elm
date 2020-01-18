module Colors exposing (..)

import Css exposing (..)
import String exposing (fromInt)


light1 : Color
light1 =
    hex "fff"


light2 : Color
light2 =
    hex "bbbdbd"


light3 : Color
light3 =
    hex "e3e3e3"


light4 : Color
light4 =
    hex "d2dbe0"


highlightHex : String
highlightHex =
    "F7DC6F66"


highlight : Color
highlight =
    hex highlightHex


link : Color
link =
    hex "0097a7"


linkAlpha50 : Color
linkAlpha50 =
    hex "#0097a780"


linkAlpha025 : Color
linkAlpha025 =
    rgba 0 151 167 0.25


hover : Color
hover =
    hex "d50000"


dark1 : Color
dark1 =
    hex "11151b"


dark1b : Color
dark1b =
    rgba 17 21 27 0.8


dark2 : Color
dark2 =
    hex "111"


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
