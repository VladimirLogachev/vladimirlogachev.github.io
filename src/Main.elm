module Main exposing (main)

import Book exposing (..)
import Dataset exposing (..)
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import List.Extra exposing (stableSortWith)
import Maybe.Extra exposing (toList, values)
import Project exposing (..)
import SharedStyles exposing (..)
import Utils exposing (..)


type Msg
    = Msg


main : Html Msg
main =
    div
        [ style "background-color" "#fff"
        , style "font-family" "Lato, sans-serif"
        , style "font-weight" "400"
        , style "line-height" "1.1"
        , style "color" "#111"
        ]
        [ viewHeader viewIntro
        , viewProjects projects
        , viewLibrary knownBooks libraryState
        , viewMyLearningPath knownBooks learningPath
        ]


viewHeader : Html Msg -> Html Msg
viewHeader content =
    header
        (fullwidthContainer
            ++ [ style "background-color" "#11151b"
               , style "color" "#bbbdbd"
               ]
        )
        [ div innerContainer
            [ h1 [ style "color" "#fff" ]
                [ text "Vladimir Logachev" ]
            , content
            ]
        ]


viewIntro : Html Msg
viewIntro =
    let
        icon =
            [ style "max-height" "24px", style "margin-right" "0.5em" ]

        link =
            [ target "_blank", style "margin-right" "0.5em" ]
    in
    section []
        [ p
            [ style "display" "flex"
            , style "margin-top" "0.8em"
            , style "margin-bottom" "0.8em"
            ]
            [ img (icon ++ [ src "images/logos/haskell.svg", alt "Haskell" ]) []
            , img (icon ++ [ src "images/logos/scala.svg", alt "Scala" ]) []
            , img (icon ++ [ src "images/logos/elm.svg", alt "Elm" ]) []
            ]
        , p [] [ text "Fullstack developer" ]
        , p [] [ text "Chief Enthusiast in ", a [ target "_blank", href "https://fpspecialty.github.io/" ] [ text "FP Specialty" ], text " — FP reading group, meetups, collaborations" ]
        , p [] [ text "Available for hiring, collaboration and pair programming." ]
        , p
            [ style "margin-top" "0.8em"
            , style "margin-right" "0.5em"
            ]
            [ a (link ++ [ href "https://github.com/VladimirLogachev" ]) [ text "github" ]
            , a (link ++ [ href "mailto:doit@keemail.me" ]) [ text "mail" ]
            , a (link ++ [ href "https://t.me/vladimirlogachev" ]) [ text "telegram" ]
            , a (link ++ [ href "http://www.linkedin.com/in/vladimirlogachev" ]) [ text "linkedin" ]
            , a (link ++ [ href "https://github.com/VladimirLogachev/cv/raw/master/Vladimir_Logachev_cv_en.pdf" ]) [ text "cv" ]
            ]
        ]


viewProjectImage : Project -> Html Msg
viewProjectImage (Project { name, imgFileName }) =
    case imgFileName of
        Just filename ->
            img
                [ regularShadow
                , style "max-width" "300px"
                , style "max-height" "300px"
                , style "border-radius" "3px"
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
            [ style "display" "flex"
            , style "align-items" "center"
            , style "margin-right" "0.5em"
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
                                li teamStyle
                                    [ a [ style "line-height" "0", href url, target "_blank" ] [ viewUserPic userpic ]
                                    , a [ href url, target "_blank" ] [ text name ]
                                    , text ","
                                    ]
                            )

                last =
                    team
                        |> List.Extra.last
                        |> toList
                        |> List.map
                            (\{ url, userpic, name } ->
                                li teamStyle
                                    [ a [ style "line-height" "0", href url, target "_blank" ] [ viewUserPic userpic ]
                                    , a [ href url, target "_blank" ] [ text name ]
                                    ]
                            )
            in
            ul
                [ style "margin-top" "0.5em"
                , style "display" "flex"
                , style "flex-wrap" "wrap"
                ]
            <|
                [ li teamStyle [ strong [] [ text "Team:" ] ] ]
                    ++ allButLast
                    ++ last
                    ++ [ li teamStyle [ text " and me." ] ]


viewProject : Project -> Html Msg
viewProject ((Project { name, description, team, links }) as project) =
    let
        projectSection =
            section
                [ style "display" "flex"
                , style "margin-top" "64px"
                , style "margin-bottom" "32px"
                ]

        imageWrapper =
            div
                [ style "width" "300px"
                , style "flex-grow" "0"
                , style "flex-shrink" "0"
                , style "text-align" "right"
                , style "margin-right" "32px"
                ]

        descriptionWrapper =
            div
                [ style "flex-shrink" "1"
                , style "min-width" "350px"
                ]
    in
    projectSection
        [ imageWrapper [ viewProjectImage project ]
        , descriptionWrapper
            [ h3 []
                [ text name ]
            , p regularText [ text description ]
            , div
                [ style "margin-top" "0.4em"
                , style "margin-bottom" "0.4em"
                ]
              <|
                List.map
                    (\link ->
                        a
                            [ style "margin-right" "1em"
                            , href link.url
                            , target "_blank"
                            ]
                            [ text link.name ]
                    )
                    links
            , viewTeam team
            ]
        ]


viewProjects : List Project -> Html Msg
viewProjects projs =
    div (fullwidthContainer ++ [ style "background-color" "#e3e3e3" ])
        [ article innerContainer
            [ h2 [] [ text "side projects" ]
            , article [] <| List.map viewProject projs
            ]
        ]


viewBook : { sticker : Maybe (Html Msg), highlightFavorite : Bool, available : Bool } -> Book -> Html Msg
viewBook { sticker, highlightFavorite, available } (Book book) =
    let
        shadow =
            if book.favorite && highlightFavorite && available then
                highlightShadow

            else
                regularShadow

        textStyle =
            if book.favorite && highlightFavorite && available then
                [ highlight, style "background-color" "#F7DC6F66" ]

            else
                []

        availabilityStyle =
            if available then
                []

            else
                [ highlight, style "filter" "grayscale(1)" ]

        {- sticker area is placed in a bottom left corner of the book -}
        {- use ralative position for sticker to move inside this area -}
        stickerNode =
            case sticker of
                Just x ->
                    div
                        [ style "position" "relative"
                        , style "height" "0"
                        , style "user-select" "none"
                        ]
                        [ x ]

                Nothing ->
                    emptyHtml
    in
    section
        [ style "margin-right" "32px"
        , style "width" "100px"
        , style "font-size" "12px"
        ]
        [ a [ href book.url, target "_blank" ]
            [ img
                (availabilityStyle
                    ++ [ shadow
                       , style "max-height" "150px"
                       , style "max-width" "100px"
                       , style "border-radius" "3px"
                       , style "margin-top" "2em"
                       , src book.coverUrl
                       , alt <| book.author ++ ", " ++ book.title
                       ]
                )
                []
            ]
        , stickerNode
        , div textStyle
            [ p [ style "margin" ".5em 0" ] [ a [ href book.url, target "_blank" ] [ text book.title ] ]
            , p [] [ text book.author ]
            ]
        ]


roundSticker : List (Html.Attribute Msg)
roundSticker =
    [ -- sticker position
      style "position" "relative"
    , style "width" "50px"
    , style "height" "50px"
    , style "bottom" "58px"
    , style "left" "5px"

    -- sticker
    , style "display" "flex"
    , style "text-align" "center"
    , style "align-items" "center"
    , style "border-radius" "300px"
    , style "font-size" "12px"

    -- , style "opacity" ".8"
    , style "transform" "rotate(-10deg)"
    ]


viewLibraryBook : ( Book, BookAvaliability ) -> Html Msg
viewLibraryBook ( b, availability ) =
    let
        book =
            div [ style "opacity" ".5" ] [ viewBook { sticker = Nothing, highlightFavorite = True, available = True } b ]

        comingSoon =
            div
                (roundSticker
                    ++ [ style "background-color" "rgba(17, 21, 27, 0.8)"
                       , style "color" "rgb(255, 152, 0)"
                       ]
                )
                [ text "coming soon" ]

        givenToSomeone =
            div
                (roundSticker
                    ++ [ style "background-color" "rgba(255, 152, 0, 0.7)"
                       , style "color" "rgb(17, 21, 27)"
                       ]
                )
                [ text "already taken" ]
    in
    case availability of
        Available ->
            viewBook { sticker = Nothing, highlightFavorite = True, available = True } b

        ComingSoon ->
            viewBook { sticker = Just comingSoon, highlightFavorite = False, available = False } b

        GivenToSomeone ->
            viewBook { sticker = Just givenToSomeone, highlightFavorite = False, available = False } b


viewLibrary : Dict String Book -> Dict String BookAvaliability -> Html Msg
viewLibrary books libState =
    div (fullwidthContainer ++ [ style "background-color" "#d2dbe0" ])
        [ article innerContainer
            [ h2 [] [ text "My offline library, shared" ]
            , div regularText
                [ p [] [ text "I have a tradition of storing my books on my desk in the workplace." ]
                , p [] [ text "Any person can borrow any book from my personal library." ]
                , p [] [ text "This applies not only to my collegues, but to any person who knows me in real life." ]
                , p [] [ text "This is my culture, it works great, it makes the world around me a better place," ]
                , p [] [ text "and I won't give up on it, so everyone should just accept it." ]
                ]
            , libState
                |> Dict.toList
                |> List.map (\( name, availability ) -> Dict.get name books |> Maybe.map (\b -> ( b, availability )))
                |> values
                |> stableSortWith bookOrdering
                |> List.map viewLibraryBook
                |> div [ style "display" "flex", style "flex-wrap" "wrap", style "align-items" "baseline" ]
            ]
        ]


viewMyLearningPath : Dict String Book -> List LearningMaterial -> Html Msg
viewMyLearningPath books learnPath =
    -- Best | All (with best marked)
    div (fullwidthContainer ++ [ style "background-color" "#e3e3e3" ])
        [ div innerContainer
            [ h2 [] [ text "My learning path" ]
            , learnPath
                |> List.map (\(BookTitle title) -> title)
                |> getMany books
                |> List.map (viewBook { sticker = Nothing, highlightFavorite = True, available = True })
                |> div [ style "display" "flex", style "flex-wrap" "wrap", style "align-items" "baseline" ]
            ]
        ]
