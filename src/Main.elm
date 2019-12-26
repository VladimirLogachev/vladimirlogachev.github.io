module Main exposing (main)

import Book exposing (..)
import Dataset exposing (..)
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Project exposing (..)
import Utils exposing (..)


type Msg
    = Msg


main : Html Msg
main =
    div [ class "app" ]
        [ viewHeader viewIntro
        , viewProjects projects
        , viewLibrary knownBooks libraryState
        , viewMyLearningPath knownBooks learningPath
        ]


viewHeader : Html Msg -> Html Msg
viewHeader content =
    div [ class "nav", class "fullwidth_container" ]
        [ div []
            [ h1 []
                [ text "Vladimir Logachev" ]
            , content
            ]
        ]


viewIntro : Html Msg
viewIntro =
    div [ class "intro" ]
        [ p [ class "icons" ]
            [ img [ class "icon", src "images/logos/haskell.svg", alt "Haskell" ] []
            , img [ class "icon", src "images/logos/scala.svg", alt "Scala" ] []
            , img [ class "icon", src "images/logos/elm.svg", alt "Elm" ] []
            ]
        , p [] [ text "Fullstack developer" ]
        , p [] [ text "Chief Enthusiast in ", a [ target "_blank", href "https://fpspecialty.github.io/" ] [ text "FP Specialty" ], text " — FP reading group, meetups, collaborations" ]
        , p [] [ text "Available for hiring, collaboration and pair programming." ]
        , p [ class "intro-links" ]
            [ a [ target "_blank", href "https://github.com/VladimirLogachev" ] [ text "github" ]
            , a [ href "mailto:doit@keemail.me" ] [ text "mail" ]
            , a [ target "_blank", href "https://t.me/vladimirlogachev" ] [ text "telegram" ]
            , a [ target "_blank", href "http://www.linkedin.com/in/vladimirlogachev" ] [ text "linkedin" ]
            , a [ target "_blank", href "https://github.com/VladimirLogachev/cv/raw/master/Vladimir_Logachev_cv_en.pdf" ] [ text "cv" ]
            ]
        ]


viewBook : Book -> Html Msg
viewBook (Book book) =
    li [ class "book" ]
        [ a [ href book.url, target "_blank" ] [ img [ class "book_cover", src book.coverUrl, alt book.title ] [] ]
        , div []
            [ p [ class "author" ] [ text book.author ]
            , p [ class "title" ] [ a [ href book.url, target "_blank" ] [ text book.title ] ]

            -- , p [ class "topic" ] [ text <| showTopic book.topics ]
            ]
        ]


viewLibrary : Dict String Book -> Dict String BookAvaliability -> Html Msg
viewLibrary books libState =
    div [ class "library_wrapper", class "fullwidth_container" ]
        [ div []
            [ h2 [] [ text "My offline library, shared" ]
            , div [ class "description" ]
                [ p [] [ text "I have a tradition to keep my books on my desk at my workplace." ]
                , p [] [ text "Any person is able to borrow any book from my personal library." ]
                , p [] [ text "This works not only for collegues, but for any person that knows me in real life." ]
                , p [] [ text "This is my culture, it works great, it makes the world around me a better place," ]
                , p [] [ text "and I won't give it away, so everyone should just accept it." ]
                ]
            , libState
                |> Dict.keys
                |> getMany books
                |> List.map viewBook
                |> ul [ class "books" ]
            ]
        ]


viewMyLearningPath : Dict String Book -> List LearningMaterial -> Html Msg
viewMyLearningPath books learnPath =
    div [ class "books-list", class "fullwidth_container" ]
        [ div []
            [ h2 [] [ text "My learning path" ]
            , learnPath
                |> List.map (\(BookTitle title) -> title)
                |> getMany books
                |> List.map viewBook
                |> ul [ class "books" ]
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
                [ li [ class "teammate" ] [ strong [] [ text "Team:" ] ] ]
                    ++ List.map
                        (\teamMate ->
                            li [ class "teammate" ]
                                [ a [ href teamMate.url, target "_blank" ] [ viewUserPic teamMate.userpic ]
                                , a [ href teamMate.url, target "_blank" ] [ text teamMate.name ]
                                , text ","
                                ]
                        )
                        team
                    ++ [ li [ class "teammate" ] [ text "and me." ] ]


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


viewProjects : List Project -> Html Msg
viewProjects projs =
    div [ class "items-list", class "fullwidth_container" ]
        [ div []
            [ ul [] <|
                List.map viewProject projs
            ]
        ]