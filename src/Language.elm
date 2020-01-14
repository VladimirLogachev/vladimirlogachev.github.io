module Language exposing (..)

import Json.Decode as D exposing (decodeValue)
import Utils exposing (..)


type Language
    = Ru
    | En


decodeLanguage : D.Value -> Language
decodeLanguage locale =
    case decodeValue D.string locale of
        Ok x ->
            ifElse (String.contains "ru" <| String.toLower x) Ru En

        Err _ ->
            En
