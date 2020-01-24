module Page.Projects exposing (..)

import Colors
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, attribute, css, href, src)
import Language exposing (Language(..), enRu)
import List.Extra
import Maybe.Extra exposing (toList)
import Project exposing (..)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Utils exposing (..)


view : Language -> (Language -> List Project) -> { title : String, content : Html msg }
view lang projs =
    div [ css [ fullwidthContainer, backgroundColor Colors.lightGrey ] ]
        [ article [ css [ innerContainer ] ]
            [ header2 [] [ text (enRu lang "Projects" "Проекты") ]
            , div [] <| List.map (viewProject lang) (projs lang)
            ]
        ]
        |> (\x -> { title = enRu lang "Projects" "Проекты", content = x })


viewProject : Language -> Project -> Html msg
viewProject lang ((Project { name_i18n, description_i18n, team, links }) as project) =
    let
        projectSection =
            section
                [ css
                    [ displayFlex
                    , marginTop (px 32)
                    , marginBottom (px 72)
                    , lastChild [ marginBottom zero ]
                    , mediaSmartphonePortrait [ flexDirection column ]
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
                    , marginBottom (px 24)
                    ]
                ]

        descriptionWrapper =
            div [ css [ flexShrink (num 1) ] ]

        splitDescription =
            description_i18n
                |> String.split "\n"
                |> List.map (\x -> p [ css [ regularText ] ] [ text__ x ])
                |> div []
    in
    projectSection
        [ imageWrapper [ viewProjectImage project ]
        , descriptionWrapper
            [ header3 []
                [ text__ name_i18n ]
            , splitDescription
            , viewTeam lang team
            , links
                |> List.map
                    (\link ->
                        buttonLink
                            [ css
                                [ marginTop (Css.em 0.7)
                                , marginBottom (Css.em 0.7)
                                , marginRight (Css.em 1)
                                , lastChild [ marginRight zero ]
                                ]
                            , href link.url
                            , targetBlank
                            , noOpener
                            ]
                            [ text__ link.name_i18n ]
                    )
                |> div
                    [ css
                        [ displayFlex
                        , flexDirection row
                        , flexWrap wrap
                        , alignItems flexStart
                        ]
                    ]
            ]
        ]


viewProjectImage : Project -> Html msg
viewProjectImage (Project { name_i18n, imgFileName }) =
    case imgFileName of
        Just filename ->
            img
                [ css
                    [ regularShadow
                    , maxWidth (px 200)
                    , maxHeight (px 300)
                    , borderRadius (px 3)
                    ]
                , srcSet ("/images/projects/" ++ filename)
                , src ("/images/projects/" ++ filename)
                , alt name_i18n
                ]
                []

        Nothing ->
            emptyHtml


viewTeam : Language -> ProjectTeam -> Html msg
viewTeam lang projectTeam =
    let
        teamStyle =
            [ displayFlex, alignItems center ]

        viewTeammate isLast { url, name_i18n } =
            textLink [ css teamStyle, href url, targetBlank, noOpener ]
                [ text__ name_i18n
                , ifElse isLast emptyHtml (text ",")
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
                        |> List.map (viewTeammate False)

                last =
                    team
                        |> List.Extra.last
                        |> toList
                        |> List.map (viewTeammate True)
            in
            div
                [ css
                    [ displayFlex
                    , flexWrap wrap
                    , flexDirection row
                    , alignItems center
                    ]
                ]
            <|
                [ span [ css [ fontWeight (int 700), marginTop (Css.em 0.5), marginRight (Css.em 0.5) ] ]
                    [ text__ (enRu lang "Project team:" "Команда проекта:") ]
                ]
                    ++ allButLast
                    ++ last
                    ++ [ span [ css [ marginTop (Css.em 0.5) ] ]
                            [ text__ (enRu lang "and me." "и я.") ]
                       ]
