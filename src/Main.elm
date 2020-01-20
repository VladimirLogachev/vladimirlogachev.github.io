module Main exposing (main)

import Book exposing (PersonKind)
import Browser
import Browser.Hash exposing (application)
import Browser.Navigation as Nav
import Colors
import Css exposing (..)
import Css.Global exposing (global, selector)
import Cv
import Dataset
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, css, href, src, title)
import Json.Decode as D
import Language exposing (Language(..), enRu)
import Page.LearningMaterials
import Page.Library
import Page.Projects
import Route exposing (Route, router_href)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Url exposing (Url)
import Utils exposing (..)


main : Program D.Value Model Msg
main =
    application
        { init = init
        , view = viewRoute
        , update = update
        , subscriptions = always Sub.none
        , onUrlChange = RouteChange
        , onUrlRequest = OnUrlRequest
        }


type alias Model =
    { library : Page.Library.Model
    , learningMaterials : Page.LearningMaterials.Model
    , lang : Language
    , route : Route
    , navKey : Nav.Key
    }


{-| Not the same as route, but page + its state
-}
type Page
    = Projects
    | Library Page.Library.Model
    | LearningMaterials Page.LearningMaterials.Model
    | Cv


type Msg
    = GotLearningMaterialsMsg Page.LearningMaterials.Msg
    | GotLibraryMsg Page.Library.Msg
    | RouteChange Url
    | OnUrlRequest Browser.UrlRequest


init : D.Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        currentLang =
            Language.decode flags

        ( ( lang, route ), cmd ) =
            Route.parseUrl key currentLang url
    in
    ( { library = { specific = Nothing }
      , learningMaterials = { onlyFavorite = True }
      , lang = lang
      , route = route
      , navKey = key
      }
    , cmd
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotLearningMaterialsMsg (Page.LearningMaterials.LearningMaterialsOnlyFavorites x) ->
            plain { model | learningMaterials = { onlyFavorite = x } }

        GotLibraryMsg (Page.Library.SetLibrarySpecific x) ->
            plain { model | library = { specific = x } }

        RouteChange url ->
            let
                ( ( lang, route ), cmd ) =
                    Route.parseUrl model.navKey model.lang url
            in
            ( { model | lang = lang, route = route }, cmd )

        OnUrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    let
                        ( ( lang, route ), cmd ) =
                            { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
                                |> Route.parseUrl model.navKey model.lang
                    in
                    ( { model | lang = lang, route = route }, cmd )

                Browser.External url ->
                    ( model, Nav.load url )


viewRoute : Model -> Browser.Document Msg
viewRoute model =
    case model.route of
        Route.Projects ->
            Page.Projects.viewProjects model.lang Dataset.projects
                |> generalTemplate model

        Route.Library ->
            Page.Library.viewLibrary model.lang model.library Dataset.knownBooks Dataset.libraryState GotLibraryMsg
                |> generalTemplate model

        Route.LearningMaterials ->
            Page.LearningMaterials.viewLearningMaterials model.lang model.learningMaterials Dataset.knownBooks Dataset.learningPath GotLearningMaterialsMsg
                |> generalTemplate model

        Route.Cv ->
            Cv.cv model


generalTemplate : Model -> Html Msg -> Browser.Document Msg
generalTemplate model content =
    div
        [ css
            [ backgroundColor Colors.lightGrey
            , fontFamilies [ "Nunito", "sans-serif" ]
            , fontWeight (int 400)
            , lineHeight (num 1.1)
            , color Colors.darkGrey
            ]
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
        , viewHeader model.lang (viewIntro model.lang)
        , viewNav model.lang
        , content
        ]
        |> (\html ->
                { title = "Vladimir Logachev"
                , body = [ toUnstyled html ]
                }
           )


viewHeader : Language -> Html Msg -> Html Msg
viewHeader lang content =
    header
        [ css
            [ fullwidthContainer
            , backgroundColor Colors.darkGrey
            , color Colors.lightGrey
            ]
        ]
        [ div [ css [ innerContainer ] ]
            [ header1 [ css [ color Colors.lightGrey ] ]
                [ text__ (enRu lang "Vladimir Logachev" "Владимир Логачев") ]
            , content
            ]
        ]


viewIntro : Language -> Html Msg
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
                [ Attributes.target "_blank"
                , css [ marginRight (Css.em 0.5) ]
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
            , textLinkOnDark [ Attributes.target "_blank", href "https://fpspecialty.github.io/" ] [ text "FP Specialty" ]
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
                    "Открыт для новой работы, совместных проектов и парного программирования."
                )
            ]
        , p [ css [ marginTop (Css.em 0.8), marginRight (Css.em 0.5) ] ]
            [ link "https://github.com/VladimirLogachev" "github"
            , link "mailto:doit@keemail.me" "mail"
            , link "https://t.me/vladimirlogachev" "telegram"
            , link "https://twitter.com/v__logachev" "twitter"
            , link "http://www.linkedin.com/in/vladimirlogachev" "linkedin"
            , link "https://github.com/VladimirLogachev/cv/raw/master/Vladimir_Logachev_cv_en.pdf" "cv"
            ]
        ]


viewNav : Language -> Html Msg
viewNav lang =
    let
        link route txt =
            textLink
                [ css [ marginRight (Css.em 1), lastChild [ marginRight zero ] ]
                , router_href lang route
                ]
                [ text__ txt ]
    in
    div [ css [ fullwidthContainer, backgroundColor (Colors.secondaryLightGrey) ] ]
        [ article [ css [ navContainer ] ]
            [ link Route.Projects (enRu lang "Projects" "Проекты")
            , link Route.Library (enRu lang "Offline Library" "Оффлайн-библиотека")
            , link Route.LearningMaterials (enRu lang "Learning Materials" "Учебные материалы")
            ]
        ]
