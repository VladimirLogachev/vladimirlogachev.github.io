module Book exposing (..)


type Book
    = Book
        { author : String
        , title : String
        , topics : Topic
        , url : String
        , coverUrl : String
        , favorite : Bool
        }


type LearningMaterial
    = BookTitle String



-- | Course
--     { url : String
--     , certificateUrl : String
--     , organization : String
--     , title : String
--     }


type BookAvaliability
    = Available
    | ComingSoon
    | GivenToSomeone


type Topic
    = MUSIC_INSTRUMENTS
    | JS
    | HASKELL
    | SCALA
    | SCHEME
    | CSS
    | DESIGN
    | DEV
    | LEADERSHIP
    | COMMUNICATION
    | MANAGEMENT



-- TODO: devTopics :: Set without comparable constraint


devTopics : List Topic
devTopics =
    [ JS
    , HASKELL
    , SCALA
    , SCHEME
    , CSS
    , DESIGN
    , DEV
    ]


showTopic : Topic -> String
showTopic topic =
    case topic of
        MUSIC_INSTRUMENTS ->
            "Music instruments"

        JS ->
            "JavaScript"

        HASKELL ->
            "Haskell"

        SCHEME ->
            "Scheme"

        SCALA ->
            "Scala"

        CSS ->
            "CSS"

        DESIGN ->
            "Design"

        DEV ->
            "Software Development"

        LEADERSHIP ->
            "Leadership"

        COMMUNICATION ->
            "Communication"

        MANAGEMENT ->
            "Management"
