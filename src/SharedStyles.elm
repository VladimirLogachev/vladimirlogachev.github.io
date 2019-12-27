module SharedStyles exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)


regularShadow : Attribute a
regularShadow =
    style "box-shadow" """0px -1px 1px rgba(0, 0, 0, 0.1), 
    0px 1px 1px rgba(0, 0, 0, 0.1),
    0px 2px 2px rgba(0, 0, 0, 0.1), 
    0px 3px 3px rgba(0, 0, 0, 0.1)"""


highlightShadow : Attribute a
highlightShadow =
    style "box-shadow" """rgba(0, 0, 0, 0.1) 0px -1px 1px,
    rgba(0, 0, 0, 0.1) 0px 1px 1px,
    rgba(0, 0, 0, 0.1) 0px 2px 2px,
    rgba(0, 0, 0, 0.1) 0px 3px 3px, 
    #F7DC6F66 0px 0px 5px 10px"""


highlight : Attribute a
highlight =
    style "box-shadow" """#F7DC6F66 0px 0px 5px 10px"""


fullwidthContainer : List (Attribute a)
fullwidthContainer =
    [ style "display" "flex"
    , style "flex-direction" "row"
    , style "justify-content" "center"
    , style "border-bottom" "1px solid rgba(0, 0, 0, 0.1)"
    ]


innerContainer : List (Attribute a)
innerContainer =
    [ style "width" "1000px"
    , style "padding" "32px 16px 16px 32px"
    ]


regularText : List (Attribute a)
regularText =
    [ style "line-height" "1.3"
    , style "margin-top" "0.4em"
    , style "margin-bottom" "0.4em"
    ]
