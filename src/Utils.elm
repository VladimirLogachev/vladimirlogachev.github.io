module Utils exposing (..)

import Dict exposing (Dict)
import Html exposing (Html, text)
import Maybe.Extra


emptyHtml : Html a
emptyHtml =
    Html.text ""


getMany : Dict comparable v -> List comparable -> List v
getMany dict keys =
    keys
        |> List.map (\k -> Dict.get k dict)
        |> Maybe.Extra.values
