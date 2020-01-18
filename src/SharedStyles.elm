module SharedStyles exposing (..)

import Colors
import Css exposing (..)
import Css.Transitions as Transitions exposing (ease, transition)
import Html.Styled exposing (a, h1, h2, h3, styled)


regularShadow : Style
regularShadow =
    property "box-shadow" """0px -1px 1px rgba(0, 0, 0, 0.1), 
    0px 1px 1px rgba(0, 0, 0, 0.1),
    0px 2px 2px rgba(0, 0, 0, 0.1), 
    0px 3px 3px rgba(0, 0, 0, 0.1)"""


highlightShadow : Style
highlightShadow =
    property "box-shadow" <| """rgba(0, 0, 0, 0.1) 0px -1px 1px,
    rgba(0, 0, 0, 0.1) 0px 1px 1px,
    rgba(0, 0, 0, 0.1) 0px 2px 2px,
    rgba(0, 0, 0, 0.1) 0px 3px 3px, 
    #""" ++ Colors.highlightHex ++ " 0px 0px 5px 10px"


highlight : Style
highlight =
    boxShadow5 (px 0) (px 0) (px 5) (px 10) Colors.highlight


fullwidthContainer : Style
fullwidthContainer =
    batch
        [ displayFlex
        , flexDirection row
        , justifyContent center
        , borderBottom3 (px 1) solid (rgba 0 0 0 0.1)
        ]


innerContainer : Style
innerContainer =
    batch
        [ width (px 1000)
        , padding4 (px 48) (px 16) (px 48) (px 32)
        ]


regularText : Style
regularText =
    batch
        [ lineHeight (num 1.3)
        , marginTop (em 0.4)
        , marginBottom (em 0.4)
        ]


linkStyle : Style
linkStyle =
    batch [ marginRight (em 1), cursor pointer, userSelectNone ]


allHeaders : Style
allHeaders =
    batch
        [ fontFamilies [ "Merriweather", "serif" ]
        , fontWeight (int 400)
        , lineHeight (num 1.6)
        ]


header1 : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
header1 =
    styled h1
        [ allHeaders
        , fontSize (px 36)
        ]


header2 : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
header2 =
    styled h2
        [ allHeaders
        , fontSize (px 32)
        ]


header3 : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
header3 =
    styled h3
        [ allHeaders
        , fontSize (px 24)
        ]


anchor : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
anchor =
    styled a
        [ textDecoration none
        , color Colors.link
        , transition [ Transitions.color3 150 0 ease ]
        , hover
            [ color Colors.hover
            , transition [ Transitions.color3 150 0 ease ]
            ]
        ]


userSelectNone : Style
userSelectNone =
    property "user-select" "none"
