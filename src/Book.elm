module Book exposing (..)

import Ordering exposing (Ordering)


type Book
    = Book
        { author : String
        , title : String
        , topics : Topic
        , url : String
        , coverUrl : String
        , favorite : Bool
        }


favoriteOrdering : Ordering Bool
favoriteOrdering =
    Ordering.explicit
        [ True
        , False
        ]


type LearningMaterial
    = BookTitle String


type BookAvaliability
    = Available
    | ComingSoon
    | GivenToSomeone


avaliabilityOrdering : Ordering BookAvaliability
avaliabilityOrdering =
    Ordering.explicit
        [ Available
        , GivenToSomeone
        , ComingSoon
        ]


type Topic
    = DEV
    | HASKELL
    | SCALA
    | SCHEME
    | JS
    | CSS
    | DESIGN
    | MANAGEMENT
    | LEADERSHIP
    | COMMUNICATION
    | FASHION
    | ENTREPRENEURSHIP
    | MUSIC_INSTRUMENTS


type PersonKind
    = Developer
    | GeneralPerson
    | Musician


personKindOrdering : Ordering PersonKind
personKindOrdering =
    Ordering.explicit
        [ Developer
        , GeneralPerson
        , Musician
        ]


personKindFromTopic : Topic -> PersonKind
personKindFromTopic topic =
    case topic of
        DEV ->
            Developer

        HASKELL ->
            Developer

        SCALA ->
            Developer

        SCHEME ->
            Developer

        JS ->
            Developer

        CSS ->
            Developer

        DESIGN ->
            Developer

        MANAGEMENT ->
            GeneralPerson

        LEADERSHIP ->
            GeneralPerson

        COMMUNICATION ->
            GeneralPerson

        FASHION ->
            GeneralPerson

        ENTREPRENEURSHIP ->
            GeneralPerson

        MUSIC_INSTRUMENTS ->
            Musician


showPersonKind : PersonKind -> String
showPersonKind pk =
    case pk of
        Developer ->
            "Developer"

        GeneralPerson ->
            "Everyone"

        Musician ->
            "Musician"


bookOrdering : Ordering ( Book, BookAvaliability )
bookOrdering =
    Ordering.byFieldWith avaliabilityOrdering Tuple.second
        |> Ordering.breakTiesWith
            (Ordering.byFieldWith personKindOrdering (\( Book { topics }, _ ) -> personKindFromTopic topics))
        |> Ordering.breakTiesWith
            (Ordering.byFieldWith favoriteOrdering (\( Book { favorite }, _ ) -> favorite))
