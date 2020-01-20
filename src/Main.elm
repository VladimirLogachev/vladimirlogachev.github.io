module Main exposing (main)

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
import Route exposing (Route, toUrl)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Url exposing (Url)
import Utils exposing (..)


type alias Session =
    { lang : Language
    , navKey : Nav.Key
    }


toSession : Model -> Session
toSession page =
    case page of
        Projects session ->
            session

        Library session _ ->
            session

        LearningMaterials session _ ->
            session

        Cv session ->
            session


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


type Model
    = Projects Session
    | Library Session Page.Library.Model
    | LearningMaterials Session Page.LearningMaterials.Model
    | Cv Session


type Msg
    = GotLearningMaterialsMsg Page.LearningMaterials.Msg
    | GotLibraryMsg Page.Library.Msg
    | RouteChange Url
    | OnUrlRequest Browser.UrlRequest


routeToInit : Session -> Route -> ( Model, Cmd Msg )
routeToInit session route =
    case route of
        Route.Projects ->
            plain <| Projects session

        Route.Library ->
            let
                ( state, cmd ) =
                    Page.Library.init
            in
            ( Library session state, Cmd.map GotLibraryMsg cmd )

        Route.LearningMaterials ->
            let
                ( state, cmd ) =
                    Page.LearningMaterials.init
            in
            ( LearningMaterials session state, Cmd.map GotLearningMaterialsMsg cmd )

        Route.Cv ->
            plain <| Cv session


{-| A crutch. I don't know how to implement it the right way for now.
Later will remove it, for sure.
Needed in cases when user clicks Enter with the same url,
or when language changes
-}
preserveOldState : Model -> Model -> Model
preserveOldState prev next =
    case ( prev, next ) of
        ( Library _ x, Library session _ ) ->
            Library session x

        ( LearningMaterials _ x, LearningMaterials session _ ) ->
            LearningMaterials session x

        _ ->
            next


init : D.Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        currentLang =
            Language.decode flags

        ( ( lang, route ), navCmd ) =
            Route.parseUrl key currentLang url

        ( newModel, initCmd ) =
            routeToInit (Session lang key) route
    in
    ( newModel, Cmd.batch [ navCmd, initCmd ] )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( GotLearningMaterialsMsg m, LearningMaterials session x ) ->
            let
                ( newmodel, cmd ) =
                    Page.LearningMaterials.update m x
            in
            ( LearningMaterials session newmodel, Cmd.map GotLearningMaterialsMsg cmd )

        ( GotLibraryMsg m, Library session x ) ->
            let
                ( newmodel, cmd ) =
                    Page.Library.update m x
            in
            ( Library session newmodel, Cmd.map GotLibraryMsg cmd )

        ( RouteChange url, _ ) ->
            let
                prevSession =
                    toSession model

                ( ( lang, route ), navCmd ) =
                    Route.parseUrl prevSession.navKey prevSession.lang url

                ( newModel, initCmd ) =
                    routeToInit (Session lang prevSession.navKey) route
            in
            ( preserveOldState model newModel, Cmd.batch [ navCmd, initCmd ] )

        ( OnUrlRequest urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.replaceUrl (toSession model).navKey <| "#" ++ Maybe.withDefault "" url.fragment )

                Browser.External url ->
                    ( model, Nav.load url )

        _ ->
            plain model


viewRoute : Model -> Browser.Document Msg
viewRoute model =
    case model of
        Projects { lang } ->
            Page.Projects.viewProjects lang Dataset.projects
                |> generalTemplate model

        Library { lang } state ->
            Page.Library.viewLibrary lang state Dataset.knownBooks Dataset.libraryState GotLibraryMsg
                |> generalTemplate model

        LearningMaterials { lang } state ->
            Page.LearningMaterials.viewLearningMaterials lang state Dataset.knownBooks Dataset.learningPath GotLearningMaterialsMsg
                |> generalTemplate model

        Cv _ ->
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
        , viewHeader (toSession model).lang (viewIntro (toSession model).lang)
        , viewNav (toSession model).lang model
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
        , p [ css [ displayFlex, flexWrap wrap ] ]
            [ link "https://github.com/VladimirLogachev" "github"
            , link "mailto:doit@keemail.me" "mail"
            , link "https://t.me/vladimirlogachev" "telegram"
            , link "https://twitter.com/v__logachev" "twitter"
            , link "http://www.linkedin.com/in/vladimirlogachev" "linkedin"
            , link "https://github.com/VladimirLogachev/cv/raw/master/Vladimir_Logachev_cv_en.pdf" "cv"
            ]
        ]


isCurrentlyActive : Model -> Route -> Bool
isCurrentlyActive model route =
    case ( model, route ) of
        ( Projects _, Route.Projects ) ->
            True

        ( Library _ _, Route.Library ) ->
            True

        ( LearningMaterials _ _, Route.LearningMaterials ) ->
            True

        ( Cv _, Route.Cv ) ->
            True

        _ ->
            False


viewNav : Language -> Model -> Html Msg
viewNav lang model =
    let
        link route txt =
            ifElse (isCurrentlyActive model route) navLinkDisabled navLink (toUrl lang route) txt
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
