module Main exposing (main)

import Book exposing (..)
import Dataset exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Project exposing (..)
import Utils exposing (..)
import Dict exposing (Dict)

type Msg
    = Msg


main : Html Msg
main =
    div [ class "app" ]
        [ viewNav developerIntro
        , viewProjects projects
        , viewBooks knownBooks learningPath
        ]


viewNav : Html Msg -> Html Msg
viewNav content =
    nav [ class "nav" ]
        [ div []
            [ h1 []
                [ text "Vladimir Logachev" ]
            , content
            ]
        ]


developerIntro : Html Msg
developerIntro =
    div [ class "intro" ]
        [ p [ class "icons" ]
            [ img [ class "icon", src "images/logos/haskell.svg", alt "Haskell" ] []
            , img [ class "icon", src "images/logos/scala.svg", alt "Scala" ] []
            , img [ class "icon", src "images/logos/elm.svg", alt "Elm" ] []
            ]
        , p [] [ text "Fullstack developer" ]
        , p [] [ text "Chief Enthusiast in ", a [ href "https://fpspecialty.github.io/" ] [ text "FP Specialty" ], text " — FP reading group, meetups, collaborations" ]
        , p [] [ text "Available for hiring, collaboration and pair programming." ]
        , p [ class "intro-links" ]
            [ a [ href "https://github.com/VladimirLogachev" ] [ text "github" ]
            , a [ href "mailto:doit@keemail.me" ] [ text "mail" ]
            , a [ href "https://t.me/vladimirlogachev" ] [ text "telegram" ]
            , a [ href "http://www.linkedin.com/in/vladimirlogachev" ] [ text "linkedin" ]
            , a [ href "https://github.com/VladimirLogachev/cv/raw/master/Vladimir_Logachev_cv_en.pdf" ] [ text "cv" ]
            ]
        ]


viewBooks : Dict String Book -> List LearningMaterial -> Html Msg
viewBooks books path =
    div [ class "books-list" ]
        [ div []
            [ h2 [] [ text "Books, that I've read" ]
            , ul [] <|
                List.map viewBook <|
                    getMany books <|
                        List.map (\(BookTitle title) -> title) path
            ]
        ]


viewBook : Book -> Html Msg
viewBook (Book book) =
    li [ class "book" ]
        [ a [ href book.url, target "_blank" ]
            [ span [ class "title" ]
                [ text book.title ]
            ]
        , span [ class "author" ]
            [ text <| "by " ++ book.author ]
        , span [ class "topic" ]
            [ text <| showTopic book.topics ]
        ]


viewProjects : List Project -> Html Msg
viewProjects projs =
    div [ class "items-list" ]
        [ div []
            [ ul [] <|
                List.map viewProject projs
            ]
        ]


viewProjectImage : Project -> Html Msg
viewProjectImage (Project { name, imgFileName }) =
    case imgFileName of
        Just filename ->
            img [ class "item-img", src <| "images/projects/" ++ filename, alt name ] []

        Nothing ->
            emptyHtml


viewTeam : ProjectTeam -> Html Msg
viewTeam projectTeam =
    case projectTeam of
        OnlyMe ->
            emptyHtml

        Team team ->
            ul [ class "team" ] <|
                [ li [ class "teammate" ]
                    --refactor css class: not a teammate actually, but an element of the layout.
                    [ strong []
                        [ text "Team:" ]
                    ]
                ]
                    ++ List.map
                        (\teamMate ->
                            li [ class "teammate" ]
                                [ a [ href teamMate.url, target "_blank" ]
                                    [ viewUserPic teamMate.userpic
                                    , text
                                        teamMate.name
                                    ]
                                , text
                                    ","
                                ]
                        )
                        team
                    ++ [ li [ class "teammate" ]
                            [ text "and Me." ]
                       ]


viewProject : Project -> Html Msg
viewProject ((Project { name, description, team, links }) as project) =
    li []
        [ viewProjectImage project
        , h3 []
            [ text name ]
        , p [ class "description" ] [ text description ]
        , div [ class "links" ] <|
            List.map (\link -> a [ href link.url, target "_blank" ] [ text link.name ]) links
        , viewTeam team
        ]
