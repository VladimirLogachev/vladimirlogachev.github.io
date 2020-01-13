module Main exposing (main)

import Book exposing (..)
import Browser
import Css exposing (..)
import Css.Global exposing (global, selector)
import Dataset exposing (..)
import Dict exposing (Dict)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, css, href, id, src, title)
import Html.Styled.Events exposing (onClick)
import List.Extra exposing (stableSortWith)
import Maybe.Extra exposing (toList, values)
import Project exposing (..)
import SharedStyles exposing (..)
import Utils exposing (..)
import Colors 

type Msg
    = LearningMaterialsOnlyFavorites Bool
    | SetLibrarySpecific (Maybe PersonKind)


type alias Model =
    { library :
        { specific : Maybe PersonKind
        }
    , learningMaterials :
        { onlyFavorite : Bool
        }
    }


init : Model
init =
    { library =
        { specific = Nothing
        }
    , learningMaterials =
        { onlyFavorite = True
        }
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        LearningMaterialsOnlyFavorites x ->
            { model | learningMaterials = { onlyFavorite = x } }

        SetLibrarySpecific x ->
            { model | library = { specific = x } }


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = mainView >> toUnstyled
        }


mainView : Model -> Html Msg
mainView model =
    div
        [ css
            [ backgroundColor Colors.light1
            , fontFamilies [ "Lato", "sans-serif" ]
            , fontWeight (int 400)
            , lineHeight (num 1.1)
            , color Colors.dark2
            ]
        ]
        [ global
            [ selector "::selection"
                [ color Colors.dark2
                , property "background" Colors.selection1
                , textShadow none
                ]
            ]
        , viewHeader viewIntro
        , viewProjects projects
        , viewLibrary model.library.specific knownBooks libraryState
        , viewLearningMaterials model.learningMaterials.onlyFavorite knownBooks learningPath
        ]


viewHeader : Html Msg -> Html Msg
viewHeader content =
    header
        [ css
            [ fullwidthContainer
            , backgroundColor Colors.dark1
            , color Colors.light2
            ]
        ]
        [ div [ css [ innerContainer ] ]
            [ header1 [ css [ color Colors.light1 ] ]
                [ text "Vladimir Logachev" ]
            , content
            ]
        ]


viewIntro : Html Msg
viewIntro =
    let
        icon filename altText =
            img
                [ css [ maxHeight (px 24), marginRight (Css.em 0.5) ]
                , src <| "images/logos/" ++ filename
                , alt altText
                , title altText
                ]
                []

        link url txt =
            anchor
                [ Attributes.target "_blank"
                , css [ marginRight (Css.em 0.5) ]
                , href url
                ]
                [ text txt ]
    in
    section []
        [ p [ css [ displayFlex, marginTop (Css.em 0.8), marginBottom (Css.em 0.8) ] ]
            [ icon "haskell.svg" "Haskell"
            , icon "scala.svg" "Scala"
            , icon "elm.svg" "Elm"
            ]
        , p [] [ text "Fullstack developer" ]
        , p []
            [ text "Chief Enthusiast in "
            , anchor [ Attributes.target "_blank", href "https://fpspecialty.github.io/" ] [ text "FP Specialty" ]
            , text " — FP reading group, meetups, collaborations"
            ]
        , p [] [ text "Available for hiring, collaboration and pair programming." ]
        , p [ css [ marginTop (Css.em 0.8), marginRight (Css.em 0.5) ] ]
            [ link "https://github.com/VladimirLogachev" "github"
            , link "mailto:doit@keemail.me" "mail"
            , link "https://t.me/vladimirlogachev" "telegram"
            , link "https://twitter.com/v__logachev" "twitter"
            , link "http://www.linkedin.com/in/vladimirlogachev" "linkedin"
            , link "https://github.com/VladimirLogachev/cv/raw/master/Vladimir_Logachev_cv_en.pdf" "cv"
            ]
        ]


viewProjectImage : Project -> Html Msg
viewProjectImage (Project { name, imgFileName }) =
    case imgFileName of
        Just filename ->
            img
                [ css
                    [ regularShadow
                    , maxWidth (px 200)
                    , maxHeight (px 300)
                    , borderRadius (px 3)
                    ]
                , src <| "images/projects/" ++ filename
                , alt name
                ]
                []

        Nothing ->
            emptyHtml


viewTeam : ProjectTeam -> Html Msg
viewTeam projectTeam =
    let
        teamStyle =
            [ displayFlex
            , alignItems center
            , marginRight <| Css.em 0.5
            ]
    in
    case projectTeam of
        OnlyMe ->
            emptyHtml

        Team team ->
            let
                allButLast =
                    team
                        |> List.Extra.init
                        |> toList
                        |> List.concat
                        |> List.map
                            (\{ url, userpic, name } ->
                                li [ css teamStyle ]
                                    [ anchor [ css [ lineHeight (num 0) ], href url, Attributes.target "_blank" ] [ viewUserPic userpic ]
                                    , anchor [ href url, Attributes.target "_blank" ] [ text name ]
                                    , text ","
                                    ]
                            )

                last =
                    team
                        |> List.Extra.last
                        |> toList
                        |> List.map
                            (\{ url, userpic, name } ->
                                li [ css teamStyle ]
                                    [ anchor [ css [ lineHeight (num 0) ], href url, Attributes.target "_blank" ] [ viewUserPic userpic ]
                                    , anchor [ href url, Attributes.target "_blank" ] [ text name ]
                                    ]
                            )
            in
            ul
                [ css
                    [ marginTop (Css.em 0.5)
                    , displayFlex
                    , flexWrap wrap
                    ]
                ]
            <|
                [ li [ css teamStyle ] [ span [ css [ fontWeight (int 700) ] ] [ text "Team:" ] ] ]
                    ++ allButLast
                    ++ last
                    ++ [ li [ css teamStyle ] [ text " and me." ] ]


viewProject : Project -> Html Msg
viewProject ((Project { name, description, team, links }) as project) =
    let
        projectSection =
            section
                [ css
                    [ displayFlex
                    , marginTop (px 32)
                    , marginBottom (px 32)
                    ]
                ]

        imageWrapper =
            div
                [ css
                    [ width (px 200)
                    , flexGrow (num 0)
                    , flexShrink (num 0)
                    , textAlign right
                    , marginRight (px 32)
                    ]
                ]

        descriptionWrapper =
            div
                [ css
                    [ flexShrink (num 1)
                    , minWidth (px 350)
                    ]
                ]

        splitDescription =
            description |> String.split "\n" |> List.map (\x -> p [ css [ regularText ] ] [ text x ]) |> div []
    in
    projectSection
        [ imageWrapper [ viewProjectImage project ]
        , descriptionWrapper
            [ header3 []
                [ text name ]
            , splitDescription
            , div
                [ css
                    [ marginTop (Css.em 0.4)
                    , marginBottom (Css.em 0.4)
                    ]
                ]
              <|
                List.map
                    (\link ->
                        anchor
                            [ css [ marginRight (Css.em 1) ]
                            , href link.url
                            , Attributes.target "_blank"
                            ]
                            [ text link.name ]
                    )
                    links
            , viewTeam team
            ]
        ]


viewProjects : List Project -> Html Msg
viewProjects projs =
    div [ css [ fullwidthContainer, backgroundColor Colors.light3 ], id "projects" ]
        [ article [ css [ innerContainer ] ]
            [ header2 [] [ text "side projects" ]
            , div [] <| List.map viewProject projs
            ]
        ]


viewBook : { sticker : Maybe (Html Msg), highlightFavorite : Bool, available : Bool } -> Book -> Html Msg
viewBook { sticker, highlightFavorite, available } (Book book) =
    let
        shadow =
            ifElse (book.favorite && highlightFavorite && available)
                highlightShadow
                regularShadow

        textStyle =
            ifElse (book.favorite && highlightFavorite && available)
                [ css [ highlight, backgroundColor Colors.highlight] ]
                []

        availabilityStyle =
            batch <| ifElse available [] [ highlight, property "filter" "grayscale(1)" ]

        {- sticker area is placed in a bottom left corner of the book -}
        {- use ralative position for sticker to move inside this area -}
        stickerNode =
            case sticker of
                Just x ->
                    div
                        [ css
                            [ position relative
                            , height zero
                            , userSelectNone
                            ]
                        ]
                        [ x ]

                Nothing ->
                    emptyHtml
    in
    section
        [ css
            [ marginRight (px 32)
            , width (px 100)
            , fontSize (px 12)
            ]
        ]
        [ anchor [ href book.url, Attributes.target "_blank" ]
            [ img
                [ css
                    [ availabilityStyle
                    , shadow
                    , maxHeight (px 150)
                    , maxWidth (px 100)
                    , borderRadius (px 3)
                    , marginTop (Css.em 2)
                    ]
                , src book.coverUrl
                , alt <| book.author ++ ", " ++ book.title
                ]
                []
            ]
        , stickerNode
        , div textStyle
            [ p [ css [ margin2 (Css.em 0.5) zero ] ] [ anchor [ href book.url, Attributes.target "_blank" ] [ text book.title ] ]
            , p [] [ text book.author ]
            ]
        ]


roundSticker : Style
roundSticker =
    batch
        [ -- sticker position
          position relative
        , bottom (px 58)
        , left (px 5)
        , transform (rotate (deg -10))

        -- sticker itself
        , displayFlex
        , width (px 50)
        , height (px 50)
        , textAlign center
        , alignItems center
        , borderRadius (px 300)
        , fontSize (px 12)
        ]


viewLibraryBook : ( Book, BookAvaliability ) -> Html Msg
viewLibraryBook ( b, availability ) =
    let
        comingSoon =
            div
                [ css
                    [ roundSticker
                    , backgroundColor Colors.dark1b
                    , color Colors.selection1a
                    ]
                ]
                [ text "coming soon" ]

        givenToSomeone =
            div
                [ css
                    [ roundSticker
                    , backgroundColor Colors.selection1b
                    , color Colors.dark1
                    ]
                ]
                [ text "already taken" ]
    in
    case availability of
        Available ->
            viewBook { sticker = Nothing, highlightFavorite = True, available = True } b

        ComingSoon ->
            viewBook { sticker = Just comingSoon, highlightFavorite = False, available = False } b

        GivenToSomeone ->
            viewBook { sticker = Just givenToSomeone, highlightFavorite = False, available = False } b


enabledLink : Msg -> String -> Html Msg
enabledLink e txt =
    anchor [ css [ linkStyle ], onClick e ] [ text txt ]


disabledLink : Msg -> String -> Html Msg
disabledLink _ txt =
    anchor
        [ css
            [ linkStyle
            , color Colors.light2
            , cursor default
            , hover [ color Colors.light2 ]
            ]
        , Attributes.disabled True
        ]
        [ text txt ]


viewLibrary : Maybe PersonKind -> Dict String Book -> Dict String BookAvaliability -> Html Msg
viewLibrary specific books libState =
    let
        specificPredicate : Book -> Bool
        specificPredicate (Book { topics }) =
            case specific of
                Just s ->
                    s == personKindFromTopic topics

                Nothing ->
                    True
    in
    div [ css [ fullwidthContainer, backgroundColor Colors.light4 ], id "library" ]
        [ article [ css [ innerContainer ] ]
            [ header2 [] [ text "My offline library, shared" ]
            , div [ css [ regularText, marginTop (Css.em 1) ] ]
                [ p [] [ text "I have a tradition of storing my books on my desk in the workplace." ]
                , p [] [ text "Any person can borrow any book from my personal library." ]
                , p [] [ text "This applies not only to my collegues, but to any person who knows me in real life." ]
                , p [] [ text "This is my culture, it works great, and I won't give up on it, so everyone should just accept it." ]
                ]
            , p
                [ css [ marginTop (Css.em 1) ] ]
                [ ifElse (specific == Nothing) disabledLink enabledLink (SetLibrarySpecific Nothing) "All books"
                , ifElse (specific == Just Developer) disabledLink enabledLink (SetLibrarySpecific (Just Developer)) "For developers"
                , ifElse (specific == Just GeneralPerson) disabledLink enabledLink (SetLibrarySpecific (Just GeneralPerson)) "For everyone"
                , ifElse (specific == Just Musician) disabledLink enabledLink (SetLibrarySpecific (Just Musician)) "For musicians"
                ]
            , libState
                |> Dict.toList
                |> List.map (\( name, availability ) -> Dict.get name books |> Maybe.map (\b -> ( b, availability )))
                |> values
                |> List.filter (Tuple.first >> specificPredicate)
                |> stableSortWith bookOrdering
                |> List.map viewLibraryBook
                |> div [ css [ displayFlex, flexWrap wrap, alignItems baseline ] ]
            ]
        ]


viewLearningMaterials : Bool -> Dict String Book -> List LearningMaterial -> Html Msg
viewLearningMaterials onlyFavorite books learnPath =
    div [ css [ fullwidthContainer, backgroundColor Colors.light3 ], id "learning-materials" ]
        [ div [ css [ innerContainer ] ]
            [ header2 [] [ text "My learning materials" ]
            , p
                [ css [ marginTop (Css.em 1) ] ]
                [ ifElse (not onlyFavorite) disabledLink enabledLink (LearningMaterialsOnlyFavorites False) "All books and courses"
                , ifElse onlyFavorite disabledLink enabledLink (LearningMaterialsOnlyFavorites True) "Only the best"
                ]
            , learnPath
                |> List.map (\(BookTitle title) -> title)
                |> getMany books
                |> List.filter (\(Book { favorite }) -> ifElse onlyFavorite favorite True)
                |> List.map (viewBook { sticker = Nothing, highlightFavorite = not onlyFavorite, available = True })
                |> div [ css [ displayFlex, flexWrap wrap, alignItems baseline ] ]
            ]
        ]
