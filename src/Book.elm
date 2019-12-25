module Book exposing (..)


type Book
    = Book
        { author : String
        , title : String
        , topics : Topic
        , url : String
        }


type Topic
    = CONSTRUCTION
    | MAINTAINANCE
    | ELECTRONICS
    | JS
    | HASKELL
    | SCALA
    | REACT
    | CSS
    | DESIGN
    | DEV



-- TODO: devTopics :: Set without comparable constraint


devTopics : List Topic
devTopics =
    [ JS
    , HASKELL
    , SCALA
    , REACT
    , CSS
    , DESIGN
    , DEV
    ]


showTopic : Topic -> String
showTopic topic =
    case topic of
        CONSTRUCTION ->
            "Guitar construction"

        MAINTAINANCE ->
            "Guitar maintainance"

        ELECTRONICS ->
            "Guitar electronics"

        JS ->
            "JavaScript"

        HASKELL ->
            "Haskell"

        SCALA ->
            "Scala"

        REACT ->
            "React"

        CSS ->
            "CSS"

        DESIGN ->
            "Design"

        DEV ->
            "Software Development"
