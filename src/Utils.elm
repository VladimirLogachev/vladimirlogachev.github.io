module Utils exposing (..)

import Css exposing (..)
import Dict exposing (Dict)
import Html.Styled exposing (..)
import Maybe.Extra

{-| Returns empty text node.
Useful for conditional rendering without "concatenating clildren" technique.
Really, empty text node is a valid neutral element for Html.
-}
emptyHtml : Html a
emptyHtml =
    text ""

{-| Gets many element from Dict.
Returns only successful results, ignores unsuccessful
-}
getMany : Dict comparable v -> List comparable -> List v
getMany dict keys =
    keys
        |> List.map (\k -> Dict.get k dict)
        |> Maybe.Extra.values


{-| this crutch was made just to avoid horrible formatting
of if-else expressions by elm-format
-}
ifElse : Bool -> a -> a -> a
ifElse b x y =
    if b then
        x

    else
        y

{-| Helper to return a model with no command
-}
plain : model -> ( model, Cmd msg )
plain m =
    ( m, Cmd.none )
