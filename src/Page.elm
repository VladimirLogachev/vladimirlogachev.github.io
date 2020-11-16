module Page exposing (..)

import Browser
import Colors
import Css exposing (..)
import Css.Global exposing (global, selector)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, attribute, css, href, src, title)
import Language exposing (Language(..), enRu)
import Route exposing (Route)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Utils exposing (..)


{-| Same thing as route,
but not parametrized with anything.
(this remains true until routes became complex)
Idea is to use it for navbar.
-}
type Page
    = Projects
    | Library
    | LearningMaterials
    | Cv


toRoute : Page -> Route
toRoute page =
    case page of
        Projects ->
            Route.Projects

        Library ->
            Route.Library

        LearningMaterials ->
            Route.LearningMaterials

        Cv ->
            Route.Cv


fromRoute : Route -> Page
fromRoute route =
    case route of
        Route.Projects ->
            Projects

        Route.Library ->
            Library

        Route.LearningMaterials ->
            LearningMaterials

        Route.Cv ->
            Cv


isCurrentlyActive : Page -> Route -> Bool
isCurrentlyActive page route =
    fromRoute route == page


generalTemplate : Language -> Page -> Html msg -> Html msg
generalTemplate lang page content =
    div
        [ css
            [ backgroundColor Colors.lightGrey
            , fontFamilies [ "Nunito", "sans-serif" ]
            , fontWeight (int 400)
            , lineHeight (num 1.1)
            , color Colors.darkGrey
            ]
        , attribute "lang" (enRu lang "en" "ru")
        ]
        [ global
            [ selector "html" [ backgroundColor Colors.lightGrey ]
            , selector
                "::selection"
                [ color Colors.darkGrey
                , property "background" Colors.pageSelection
                , textShadow none
                ]
            ]
        , viewHeader lang page (viewIntro lang)
        , viewNav lang page
        , content
        ]


viewHeader : Language -> Page -> Html msg -> Html msg
viewHeader lang page content =
    let
        linkToLang targetLang caption =
            ifElse (lang == targetLang)
                navLinkDisabledOnDark
                navLinkOnDark
                (Route.toUrlPath targetLang (toRoute page))
                caption
    in
    header
        [ css
            [ fullwidthContainer
            , backgroundColor Colors.darkGrey
            , color Colors.lightGrey
            ]
        ]
        [ div [ css [ innerContainer, paddingTop (px 32) ] ]
            [ p [ css [ textAlign end ] ]
                [ linkToLang En "En"
                , linkToLang Ru "Ru"
                ]
            , header1 [ css [ color Colors.lightGrey ] ]
                [ text__ (enRu lang "Vladimir Logachev" "Владимир Логачев") ]
            , content
            ]
        ]


viewIntro : Language -> Html msg
viewIntro lang =
    let
        icon filename altText =
            img
                [ css [ maxHeight (px 24), marginRight (Css.em 0.5) ]
                , src <| "/images/logos/" ++ filename
                , alt altText
                , title altText
                ]
                []

        link url txt =
            textLinkOnDark
                [ targetBlank
                , noOpener
                , css [ marginRight (Css.em 1) ]
                , href url
                ]
                [ text__ txt ]
    in
    section [ css [ regularText ] ]
        [ p [ css [ displayFlex, marginTop (Css.em 0.8), marginBottom (Css.em 0.8) ] ]
            [ icon "haskell.svg" "Haskell"
            , icon "scala.svg" "Scala"
            , icon "elm.svg" "Elm"
            ]
        , p [] [ text__ (enRu lang "Fullstack developer" "Fullstack-разработчик") ]
        , p []
            [ text
                (enRu lang
                    "Chief Enthusiast in "
                    "Организатор "
                )
            , textLinkOnDark [ href "https://fpspecialty.github.io/", targetBlank, noOpener ] [ text "FP Specialty" ]
            , text
                (enRu lang
                    " — FP reading group, meetups, collaborations."
                    " — книжный клуб, митапы, совместные проекты."
                )
            ]
        , p []
            [ text__
                (enRu lang
                    "Available for hiring, collaboration and pair programming."
                    "Открыт для совместных проектов и парного программирования."
                )
            ]
        , p [ css [ displayFlex, flexWrap wrap ] ]
            [ link "https://github.com/VladimirLogachev" "github"
            , link "mailto:logachev.dev@ya.ru" "mail"
            , link "https://t.me/vladimirlogachev" "telegram"
            , link "https://twitter.com/v__logachev" "twitter"
            , link "http://www.linkedin.com/in/vladimirlogachev" "linkedin"
            , link "https://logachev.dev/" (enRu lang "cv" "резюме")
            ]
        ]


viewNav : Language -> Page -> Html msg
viewNav lang model =
    let
        link route txt =
            ifElse (isCurrentlyActive model route) navLinkDisabled navLink (Route.toUrlPath lang route) txt
    in
    div [ css [ fullwidthContainer, backgroundColor Colors.secondaryLightGrey ] ]
        [ nav
            [ css
                [ displayFlex
                , flexWrap wrap
                , width (pct 100)
                , maxWidth (px 1000)
                , padding4 zero (px 16) (px 16) (px 32)
                , mediaSmartphonePortrait [ paddingLeft (px 16), paddingRight (px 16) ]
                ]
            ]
            [ link Route.Projects (enRu lang "Projects" "Проекты")
            , link Route.Library (enRu lang "Offline Library" "Оффлайн-библиотека")
            , link Route.LearningMaterials (enRu lang "Learning Materials" "Учебные материалы")
            ]
        ]


view : Language -> Page -> { title : String, content : Html msg } -> Browser.Document msg
view lang page { title, content } =
    { title = title ++ " — " ++ enRu lang "Vladimir Logachev" "Владимир Логачев"
    , body = [ toUnstyled <| generalTemplate lang page content ]
    }
