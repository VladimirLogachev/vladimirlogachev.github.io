module Main exposing (main)

import Browser
import Browser.Hash exposing (application)
import Browser.Navigation as Nav
import Dataset
import Html
import Json.Decode as D
import Language
import Page
import Page.Cv as Cv
import Page.LearningMaterials as LearningMaterials
import Page.Library as Library
import Page.Projects as Projects
import Route exposing (Route)
import Session exposing (Session)
import Url exposing (Url)
import Utils exposing (..)


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
        , view = view
        , update = update
        , subscriptions = always Sub.none
        , onUrlChange = RouteChange
        , onUrlRequest = OnUrlRequest
        }


type Model
    = Projects Session
    | Library Session Library.Model
    | LearningMaterials Session LearningMaterials.Model
    | Cv Session


type Msg
    = GotLearningMaterialsMsg LearningMaterials.Msg
    | GotLibraryMsg Library.Msg
    | RouteChange Url
    | OnUrlRequest Browser.UrlRequest


updateWith :
    (subModel -> Model)
    -> (subMsg -> Msg)
    -- -> Model
    -> ( subModel, Cmd subMsg )
    -> ( Model, Cmd Msg )
updateWith toModel toMsg ( subModel, subCmd ) =
    ( toModel subModel
    , Cmd.map toMsg subCmd
    )


changeRouteTo : Route -> Session -> ( Model, Cmd Msg )
changeRouteTo route session =
    case route of
        Route.Projects ->
            plain <| Projects session

        Route.Library ->
            Library.init
                |> updateWith (Library session) GotLibraryMsg

        Route.LearningMaterials ->
            LearningMaterials.init
                |> updateWith (LearningMaterials session) GotLearningMaterialsMsg

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
            changeRouteTo route (Session lang key)
    in
    ( newModel, Cmd.batch [ navCmd, initCmd ] )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( GotLibraryMsg m, Library session x ) ->
            Library.update m x |> updateWith (Library session) GotLibraryMsg

        ( GotLearningMaterialsMsg m, LearningMaterials session x ) ->
            LearningMaterials.update m x
                |> updateWith (LearningMaterials session) GotLearningMaterialsMsg

        ( RouteChange url, _ ) ->
            let
                prevSession =
                    toSession model

                ( ( lang, route ), navCmd ) =
                    Route.parseUrl prevSession.navKey prevSession.lang url

                ( newModel, initCmd ) =
                    changeRouteTo route (Session lang prevSession.navKey)
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


view : Model -> Browser.Document Msg
view model =
    let
        lang =
            (toSession model).lang

        viewPage page toMsg config =
            let
                { title, body } =
                    Page.view lang page config
            in
            { title = title
            , body = List.map (Html.map toMsg) body
            }
    in
    case model of
        Projects _ ->
            viewPage Page.Projects identity (Projects.view lang Dataset.projects)

        Library _ state ->
            viewPage Page.Library GotLibraryMsg (Library.view lang state Dataset.knownBooks Dataset.libraryState)

        LearningMaterials _ state ->
            viewPage Page.LearningMaterials GotLearningMaterialsMsg (LearningMaterials.view lang state Dataset.knownBooks Dataset.learningPath)

        Cv _ ->
            viewPage Page.Cv identity (Cv.cv lang)
