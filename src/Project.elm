module Project exposing (..)

import Css exposing (..)
import Html.Styled exposing (Html, img)
import Html.Styled.Attributes exposing (css, src)
import Language exposing (Language)
import Utils exposing (..)



-- TODO: team :: Nel TeamMate


type Project
    = Project
        { name_i18n : String
        , description_i18n : String
        , links : List Link
        , imgFileName : Maybe String
        , team : ProjectTeam
        }


type alias Link =
    { name_i18n : String
    , url : String
    }


type ProjectTeam
    = OnlyMe
    | Team (List TeamMate)


type alias TeamMate =
    { name_i18n : String
    , userpic : Userpic
    , url : String
    }


type Userpic
    = NoPic
    | GitHubUserId Int
    | DirectUrl String


viewUserPic : Userpic -> Html a
viewUserPic userpic =
    let
        userpicSize =
            22

        userpicSrcSize =
            userpicSize * 3
    in
    case userpic of
        NoPic ->
            emptyHtml

        GitHubUserId githubUserId ->
            img
                [ css
                    [ maxHeight (px userpicSize)
                    , borderRadius (px 3)
                    , marginRight (em 0.2)
                    ]
                , src <|
                    "https://avatars2.githubusercontent.com/u/"
                        ++ String.fromInt githubUserId
                        ++ "?s="
                        ++ String.fromInt userpicSrcSize
                        ++ "&v=4"
                ]
                []

        DirectUrl url ->
            img [ src url ] []
