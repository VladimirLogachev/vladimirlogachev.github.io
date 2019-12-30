module Utils exposing (..)

import Css exposing (..)
import Dict exposing (Dict)
import Html.Styled exposing (..)
import Maybe.Extra


emptyHtml : Html a
emptyHtml =
    text ""


getMany : Dict comparable v -> List comparable -> List v
getMany dict keys =
    keys
        |> List.map (\k -> Dict.get k dict)
        |> Maybe.Extra.values


ifElse : Bool -> a -> a -> a
ifElse b x y =
    if b then
        x

    else
        y
