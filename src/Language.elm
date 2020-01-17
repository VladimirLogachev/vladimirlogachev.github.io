module Language exposing (..)

import Json.Decode as D exposing (decodeValue)
import Url.Parser exposing (string)
import Utils exposing (..)


type Language
    = En
    | Ru


{-| The only place for hardcoding a language
-}
default : Language
default =
    En


{-| Decodes Json Value, provided via flags
-}
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
            "en" ->
                Just En

            "ru" ->
                Just Ru

            _ ->
                Nothing
    )
        |> Url.Parser.custom "LANGUAGE"


toString : Language -> String
toString lang =
    case lang of
        En ->
            "en"

        Ru ->
            "ru"


{-| This is a combinator for choosing either english or russian translation.
Though whole idea of having a language is OK,
this crutch was made just to avoid horrible formatting
of case-of expressions by elm-format
-}
enRu : Language -> a -> a -> a
enRu lang enVersion ruVersion =
    case lang of
        En ->
            enVersion

        Ru ->
            ruVersion
