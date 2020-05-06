module Page.LearningMaterials exposing (..)

import Book exposing (..)
import Colors
import Css exposing (..)
import Dict exposing (Dict)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)
import Language exposing (Language(..), enRu)
import Typography exposing (text__)
import UiElements exposing (..)
import UiStyles exposing (..)
import Utils exposing (..)


type alias Model =
    { onlyFavorite : Bool }


type Msg
    = LearningMaterialsOnlyFavorites Bool


init : ( Model, Cmd Msg )
init =
    plain { onlyFavorite = True }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LearningMaterialsOnlyFavorites onlyFavorite ->
            plain { model | onlyFavorite = onlyFavorite }


view : Language -> Model -> Dict String Book -> List LearningMaterial -> { title : String, content : Html Msg }
view lang { onlyFavorite } books learnPath =
    div [ css [ fullwidthContainer, backgroundColor Colors.lightGrey ] ]
        [ div [ css [ innerContainer ] ]
            [ header2 [] [ text__ (enRu lang "Learning Materials" "Учебные материалы") ]
            , p
                [ css [ displayFlex, flexWrap wrap ] ]
                [ ifElse onlyFavorite navButtonDisabled navButton (LearningMaterialsOnlyFavorites True) (enRu lang "Recommended by me" "Рекомендуемые мной")
                , ifElse (not onlyFavorite) navButtonDisabled navButton (LearningMaterialsOnlyFavorites False) (enRu lang "All books and courses" "Все книги и курсы")
                ]
            , learnPath
                |> List.map (\(BookTitle title) -> title)
                |> getMany books
                |> List.filter (\(Book { rating }) -> ifElse onlyFavorite (rating == Excellent) True)
                |> List.map (Book.view { sticker = Nothing, highlightFavorite = not onlyFavorite, available = True })
                |> div [ css [ displayFlex, flexWrap wrap, alignItems baseline ] ]
            ]
        ]
        |> (\x -> { title = enRu lang "Learning Materials" "Учебные материалы", content = x })
