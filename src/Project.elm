module Project exposing (..)

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
