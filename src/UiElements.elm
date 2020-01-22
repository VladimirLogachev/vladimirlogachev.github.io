module UiElements exposing (..)

import Colors
import Css exposing (..)
import Css.Transitions as Transitions exposing (transition)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Typography exposing (text__)
import UiStyles exposing (..)


navStyle : Style
navStyle =
    batch
        [ textDecoration none
        , userSelectNone
        , cursor pointer
        , borderTop zero
        , lineHeight (Css.em 1.1)
        , fontSize (px 16)
        , fontFamilies [ "Nunito", "sans-serif" ]
        , padding zero
        , borderRight zero
        , borderLeft zero
        , backgroundColor transparent
        , borderBottom3 (px 0.5) dashed Colors.link025
        , hover [ borderBottom3 (px 0.5) dashed Colors.hover025 ]
        , marginTop (Css.em 1)
        , marginRight (Css.em 1)
        , color Colors.link
        , transition [ Transitions.color 150, Transitions.border 150 ]
        , hover
            [ color Colors.hover
            , transition [ Transitions.color 150, Transitions.border 150 ]
            ]
        ]


navDisabledStyle : Style
navDisabledStyle =
    batch
        [ textDecoration none
        , userSelectNone
        , cursor default
        , color Colors.darkGrey
        , marginTop (Css.em 1)
        , marginRight (Css.em 1)
        , textDecoration none
        , transition [ Transitions.color 150, Transitions.border 150 ]
        ]


navButton : msg -> String -> Html msg
navButton msg txt =
    button [ css [ navStyle ], onClick msg ] [ text__ txt ]


navButtonDisabled : a -> String -> Html msg
navButtonDisabled _ txt =
    span [ css [ navDisabledStyle ], Attributes.disabled True ] [ text__ txt ]


navLink : String -> String -> Html msg
navLink url txt =
    a [ css [ navStyle ], Attributes.href url ] [ text__ txt ]


navLinkDisabled : a -> String -> Html msg
navLinkDisabled _ txt =
    span [ css [ navDisabledStyle ], Attributes.disabled True ] [ text__ txt ]


navLinkOnDark : String -> String -> Html msg
navLinkOnDark url txt =
    a [ css [ navStyle, color Colors.linkOnDark, borderBottomColor Colors.linkOnDark025], Attributes.href url ] [ text__ txt ]


navLinkDisabledOnDark : a -> String -> Html msg
navLinkDisabledOnDark _ txt =
    span [ css [ navDisabledStyle, color Colors.lightGrey ], Attributes.disabled True ] [ text__ txt ]


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
        , marginTop (Css.em 0.5)
        , marginRight (Css.em 0.5)
        , lastChild [ marginRight zero ]
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
        , marginTop (Css.em 1)
        , marginRight (Css.em 1)
        , lastChild [ marginRight zero ]
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
        , userSelectNone
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
