module Book exposing (..)

import Colors
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (alt, css, href, src)
import Ordering exposing (Ordering)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Utils exposing (..)


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


view : { sticker : Maybe (Html msg), highlightFavorite : Bool, available : Bool } -> Book -> Html msg
view { sticker, highlightFavorite, available } (Book book) =
    let
        shadow =
            ifElse (book.favorite && highlightFavorite && available)
                itemHighlightShadow
                regularShadow

        textStyle =
            ifElse (book.favorite && highlightFavorite && available)
                [ css [ itemHighlight, backgroundColor Colors.itemHighlight ] ]
                []

        availabilityStyle =
            batch <| ifElse available [] [ itemHighlight, property "filter" "grayscale(1)" ]

        {- sticker area is placed in a bottom left corner of the book -}
        {- use ralative position for sticker to move inside this area -}
        stickerNode =
            case sticker of
                Just x ->
                    div
                        [ css
                            [ position relative
                            , height zero
                            , userSelectNone
                            ]
                        ]
                        [ x ]

                Nothing ->
                    emptyHtml
    in
    section
        [ css
            [ marginRight (px 32)
            , width (px 100)
            , fontSize (px 13)
            ]
        ]
        [ textLink [ href book.url, targetBlank, noOpener ]
            [ img
                [ css
                    [ availabilityStyle
                    , shadow
                    , maxHeight (px 150)
                    , maxWidth (px 100)
                    , borderRadius (px 3)
                    , marginTop (Css.em 2)
                    ]
                , src <| "/images/library/" ++ book.coverUrl
                , alt <| book.author ++ ", " ++ book.title
                ]
                []
            ]
        , stickerNode
        , div textStyle
            [ p [ css [ margin2 (Css.em 0.5) zero ] ] [ textLink [ href book.url, targetBlank, noOpener ] [ text__ book.title ] ]
            , p [] [ text__ book.author ]
            ]
        ]
