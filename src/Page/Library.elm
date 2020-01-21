module Page.Library exposing (..)

import Book exposing (..)
import Colors
import Css exposing (..)
import Dict exposing (Dict)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Language exposing (Language(..), enRu)
import List.Extra exposing (stableSortWith)
import Maybe.Extra exposing (toList, values)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Utils exposing (..)


type Msg
    = SetLibrarySpecific (Maybe PersonKind)


type alias Model =
    { specific : Maybe PersonKind }


init : ( Model, Cmd Msg )
init =
    plain { specific = Nothing }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetLibrarySpecific specific ->
            plain { model | specific = specific }


roundSticker : Style
roundSticker =
    batch
        [ -- sticker position
          position relative
        , bottom (px 58)
        , left (px 5)
        , transform (rotate (deg -10))

        -- sticker itself
        , displayFlex
        , width (px 50)
        , height (px 50)
        , textAlign center
        , alignItems center
        , borderRadius (px 300)
        , fontSize (px 12)
        ]


viewLibraryBook : Language -> ( Book, BookAvaliability ) -> Html msg
viewLibraryBook lang ( b, availability ) =
    let
        comingSoon =
            div
                [ css
                    [ roundSticker
                    , backgroundColor Colors.darkGrey08
                    , color Colors.selection
                    ]
                ]
                [ text (enRu lang "coming soon" "скоро будет") ]

        givenToSomeone =
            div
                [ css
                    [ roundSticker
                    , backgroundColor Colors.selection07
                    , color Colors.darkGrey
                    ]
                ]
                [ text (enRu lang "already taken" "кто-то читает") ]
    in
    case availability of
        Available ->
            Book.view { sticker = Nothing, highlightFavorite = True, available = True } b

        ComingSoon ->
            Book.view { sticker = Just comingSoon, highlightFavorite = False, available = False } b

        GivenToSomeone ->
            Book.view { sticker = Just givenToSomeone, highlightFavorite = False, available = False } b


view : Language -> Model -> Dict String Book -> Dict String BookAvaliability -> { title : String, content : Html Msg }
view lang { specific } books libState =
    let
        specificPredicate : Book -> Bool
        specificPredicate (Book { topics }) =
            case specific of
                Just s ->
                    s == personKindFromTopic topics

                Nothing ->
                    True

        description =
            enRu lang
                """I have a tradition of storing my books on my desk in the workplace. Any person can borrow any book from my personal library. This applies not only to my collegues, but to any person who knows me in real life. This is my culture, it works great, and I won't give up on it, so everyone should just accept it."""
                """У меня есть традиция хранить свои книги на работе, на своём рабочем столе. Любой человек может взять почитать любую книгу из моей библиотеки. Это относится не только к моим коллегам, а к любому человеку, который знаком со мной лично. Это моя культура, она великолепно работает и я не намерен от неё отказываться."""

        splitDescription =
            description
                |> String.split "\n"
                |> List.map (\x -> p [] [ text__ x ])
                |> div [ css [ regularText, marginTop (Css.em 1) ] ]
    in
    div [ css [ fullwidthContainer, backgroundColor Colors.lightGrey ] ]
        [ article [ css [ innerContainer ] ]
            [ header2 [] [ text__ (enRu lang "Offline Library" "Оффлайн-библиотека") ]
            , splitDescription
            , p
                [ css [ displayFlex, flexWrap wrap ] ]
                [ ifElse (specific == Nothing) navButtonDisabled navButton (SetLibrarySpecific Nothing) (enRu lang "All books" "Все книги")
                , ifElse (specific == Just Developer) navButtonDisabled navButton (SetLibrarySpecific (Just Developer)) (enRu lang "For developers" "Для разработчиков")
                , ifElse (specific == Just GeneralPerson) navButtonDisabled navButton (SetLibrarySpecific (Just GeneralPerson)) (enRu lang "For everyone" "Для всех")
                , ifElse (specific == Just Musician) navButtonDisabled navButton (SetLibrarySpecific (Just Musician)) (enRu lang "For musicians" "Для музыкантов")
                ]
            , libState
                |> Dict.toList
                |> List.map (\( name, availability ) -> Dict.get name books |> Maybe.map (\b -> ( b, availability )))
                |> values
                |> List.filter (Tuple.first >> specificPredicate)
                |> stableSortWith bookOrdering
                |> List.map (viewLibraryBook lang)
                |> div [ css [ displayFlex, flexWrap wrap, alignItems baseline ] ]
            ]
        ]
        |> (\x -> { title = enRu lang "Offline Library" "Оффлайн-библиотека", content = x })
