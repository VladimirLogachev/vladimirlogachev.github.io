module Language exposing (..)

import Json.Decode as D exposing (decodeValue)
import Url.Parser exposing (string)
import Utils exposing (..)


type Language
    = Ru
    | En


default : Language
default =
    En


decode : D.Value -> Language
decode localeFlags =
    case decodeValue D.string localeFlags of
        Ok x ->
            ifElse (String.contains "ru" <| String.toLower x) Ru En

        Err _ ->
            default


urlParser : Url.Parser.Parser (Language -> a) a
urlParser =
    (\str ->
        case str of
            "ru" ->
                Just Ru

            "en" ->
                Just En

            _ ->
                Nothing
    )
        |> Url.Parser.custom "LANGUAGE"


toString : Language -> String
toString lang =
    case lang of
        Ru ->
            "ru"

        En ->
            "en"
