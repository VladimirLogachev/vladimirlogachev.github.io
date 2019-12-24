module Project exposing (..)

-- TODO: team :: Nel TeamMate


type alias Project =
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



-- TODO: githubUserId - delete
-- type userpic = External | Github Int | twitter maybe...


type alias TeamMate =
    { name : String
    , githubUserId : Int
    , url : String
    }
