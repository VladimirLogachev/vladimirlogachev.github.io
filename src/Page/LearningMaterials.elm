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


viewLearningMaterials : Language -> Model -> Dict String Book -> List LearningMaterial -> (Msg -> msg) -> Html msg
viewLearningMaterials lang { onlyFavorite } books learnPath wrapper =
    div [ css [ fullwidthContainer, backgroundColor Colors.lightGrey ] ]
        [ div [ css [ innerContainer ] ]
            [ header2 [] [ text__ (enRu lang "Learning Materials" "Учебные материалы") ]
            , p
                [ css [ marginTop (Css.em 1) ] ]
                [ ifElse onlyFavorite navButtonDisabled navButton (wrapper <| LearningMaterialsOnlyFavorites True) (enRu lang "Recommended by me" "Рекомендуемые мной")
                , ifElse (not onlyFavorite) navButtonDisabled navButton (wrapper <| LearningMaterialsOnlyFavorites False) (enRu lang "All books and courses" "Все книги и курсы")
                ]
            , learnPath
                |> List.map (\(BookTitle title) -> title)
                |> getMany books
                |> List.filter (\(Book { favorite }) -> ifElse onlyFavorite favorite True)
                |> List.map (Book.view { sticker = Nothing, highlightFavorite = not onlyFavorite, available = True })
                |> div [ css [ displayFlex, flexWrap wrap, alignItems baseline, mediaSmartphonePortrait [ spaceEvenly ] ] ]
            ]
        ]
