module Project exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (..)



-- TODO: team :: Nel TeamMate


type Project
    = Project
        { name : String
        , description : String
        , links : List Link
        , imgFileName : Maybe String
        , team : ProjectTeam
        }


type ProjectTeam
    = OnlyMe
    | Team (List TeamMate)


type alias Link =
    { name : String
    , url : String
    }


type Userpic
    = NoPic
    | GitHubUserId Int
    | DirectUrl String


type alias TeamMate =
    { name : String
    , userpic : Userpic
    , url : String
    }


userpicCssSize =
    16


userpicSrcSize =
    userpicCssSize * 3


viewUserPic : Userpic -> Html a
viewUserPic userpic =
    case userpic of
        NoPic ->
            emptyHtml

        GitHubUserId githubUserId ->
            img
                [ src <|
                    "https://avatars2.githubusercontent.com/u/"
                        ++ String.fromInt githubUserId
                        ++ "?s="
                        ++ String.fromInt userpicSrcSize
                        ++ "&v=4"
                ]
                []

        DirectUrl url ->
            img [ src url ] []
