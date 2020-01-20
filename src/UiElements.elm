module UiElements exposing (..)

import Colors
import Css exposing (..)
import Css.Transitions as Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Typography exposing (text__)
import UiStyles exposing (..)



-- navStyle : Style
-- navDisabledStyle : Style


navButton : msg -> String -> Html msg
navButton e txt =
    span
        [ css
            [ cursor pointer
            , borderBottom3 (px 0.5) dashed Colors.link025
            , hover [ borderBottom3 (px 0.5) dashed Colors.hover025 ]
            , marginRight (Css.em 1)
            , color Colors.link
            , transition [ Transitions.color 150, Transitions.border 150 ]
            , hover
                [ color Colors.hover
                , transition [ Transitions.color 150, Transitions.border 150 ]
                ]
            ]
        , onClick e
        ]
        [ text__ txt ]


navButtonDisabled : msg -> String -> Html msg
navButtonDisabled _ txt =
    span
        [ css
            [ color Colors.darkGrey
            , cursor default
            , marginRight (Css.em 1)
            , textDecoration none
            , transition [ Transitions.color 150, Transitions.border 150 ]
            ]
        , Attributes.disabled True
        ]
        [ text__ txt ]


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
