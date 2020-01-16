module Route exposing (..)

import Browser.Navigation as Nav
import Html.Styled exposing (Attribute)
import Html.Styled.Attributes as Attributes
import Language exposing (Language(..))
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf)
import Utils exposing (..)


type Route
    = Home
    | Recommendations
    | Cv


parseUrl : Nav.Key -> Language -> Url -> ( ( Language, Route ), Cmd msg )
parseUrl key fallbackLang url =
    fromUrl url
        |> Maybe.map plain
        |> Maybe.withDefault ( ( fallbackLang, Home ), replaceUrl key fallbackLang Home )


router_href : Language -> Route -> Attribute msg
router_href lang targetRoute =
    Attributes.href (routeToString lang targetRoute)


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Home ->
            []

        Recommendations ->
            [ "recommendations" ]

        Cv ->
            [ "cv" ]


routeToString : Language -> Route -> String
routeToString lang page =
    "#/" ++ Language.toString lang ++ "/" ++ String.join "/" (routeToPieces page)


fromUrl : Url -> Maybe ( Language, Route )
fromUrl url =
    Parser.parse parser url


parser : Parser (( Language, Route ) -> a) a
parser =
    (Language.urlParser
        </> oneOf
                [ Parser.map Home Parser.top
                , Parser.map Cv (Parser.s "cv")
                , Parser.map Recommendations (Parser.s "recommendations")
                ]
    )
        |> Parser.map (\a b -> ( a, b ))


replaceUrl : Nav.Key -> Language -> Route -> Cmd msg
replaceUrl key lang route =
    Nav.pushUrl key (routeToString lang route)
