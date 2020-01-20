module Route exposing (..)

import Browser.Navigation as Nav
import Html.Styled exposing (Attribute)
import Html.Styled.Attributes as Attributes
import Language exposing (Language(..))
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf)
import Utils exposing (..)


type Route
    = Projects
    | Library
    | LearningMaterials
    | Cv


parseUrl : Nav.Key -> Language -> Url -> ( ( Language, Route ), Cmd msg )
parseUrl key fallbackLang url =
    fromUrl url
        |> Maybe.map plain
        |> Maybe.withDefault ( ( fallbackLang, Projects ), replaceUrl key fallbackLang Projects )


toUrl : Language -> Route -> String
toUrl lang targetRoute =
    routeToString lang targetRoute


routeToPieces : Route -> List String
routeToPieces page =
    case page of
        Projects ->
            [ "projects" ]

        Library ->
            [ "library" ]

        LearningMaterials ->
            [ "learning-materials" ]

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
                [ Parser.map Projects (Parser.s "projects")
                , Parser.map Library (Parser.s "library")
                , Parser.map LearningMaterials (Parser.s "learning-materials")
                , Parser.map Cv (Parser.s "cv")
                ]
    )
        |> Parser.map (\a b -> ( a, b ))


replaceUrl : Nav.Key -> Language -> Route -> Cmd msg
replaceUrl key lang route =
    Nav.pushUrl key (routeToString lang route)
