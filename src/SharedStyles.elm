module SharedStyles exposing (..)

import Colors
import Css exposing (..)
import Css.Media as Media exposing (only, orientation, portrait, screen, withMedia)
import Css.Transitions as Transitions exposing (transition)
import Html.Styled exposing (a, h1, h2, h3, styled)


mediaSmartphonePortrait : List Style -> Style
mediaSmartphonePortrait =
    withMedia [ only screen [ Media.maxWidth (px 600), orientation portrait ] ]


regularShadow : Style
regularShadow =
    property "box-shadow" """0px -1px 1px rgba(0, 0, 0, 0.1), 
    0px 1px 1px rgba(0, 0, 0, 0.1),
    0px 2px 2px rgba(0, 0, 0, 0.1), 
    0px 3px 3px rgba(0, 0, 0, 0.1)"""


itemHighlightShadow : Style
itemHighlightShadow =
    property "box-shadow" <| """rgba(0, 0, 0, 0.1) 0px -1px 1px,
    rgba(0, 0, 0, 0.1) 0px 1px 1px,
    rgba(0, 0, 0, 0.1) 0px 2px 2px,
    rgba(0, 0, 0, 0.1) 0px 3px 3px, 
    #""" ++ Colors.itemHighlightHex ++ " 0px 0px 5px 10px"


{-| Missing in elm-css
-}
spaceEvenly : Style
spaceEvenly =
    property "justify-content" "space-evenly"


itemHighlight : Style
itemHighlight =
    boxShadow5 (px 0) (px 0) (px 5) (px 10) Colors.itemHighlight


fullwidthContainer : Style
fullwidthContainer =
    batch
        [ displayFlex
        , flexDirection row
        , justifyContent center
        , borderBottom3 (px 1) solid (rgba 0 0 0 0.15)
        , lastChild [ borderBottom zero ]
        ]


innerContainer : Style
innerContainer =
    batch
        [ width (pct 100)
        , maxWidth (px 1000)
        , padding4 (px 48) (px 16) (px 48) (px 32)
        , mediaSmartphonePortrait [ paddingLeft (px 16), paddingRight (px 16) ]
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


textLink : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
textLink =
    styled a
        [ textDecoration none
        , color Colors.link
        , transition [ Transitions.color 150, Transitions.border 150 ]
        , hover
            [ color Colors.hover
            , transition [ Transitions.color 150, Transitions.border 150 ]
            ]
        ]


textLinkOnDark : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
textLinkOnDark =
    styled a
        [ textDecoration none
        , color Colors.linkOnDark
        , transition [ Transitions.color 150, Transitions.border 150 ]
        , hover
            [ color Colors.hoverOnDark
            , transition [ Transitions.color 150, Transitions.border 150 ]
            ]
        ]


buttonLink : List (Html.Styled.Attribute msg) -> List (Html.Styled.Html msg) -> Html.Styled.Html msg
buttonLink =
    styled a
        [ textDecoration none
        , padding4 (px 8) (px 12) (px 8) (px 12)
        , color Colors.lightGrey
        , backgroundColor Colors.link
        , borderRadius (px 3)
        , regularShadow
        , flexShrink zero
        , transition [ Transitions.backgroundColor 150 ]
        , hover
            [ backgroundColor Colors.hover
            , transition [ Transitions.backgroundColor 150 ]
            ]
        ]


userSelectNone : Style
userSelectNone =
    property "user-select" "none"
