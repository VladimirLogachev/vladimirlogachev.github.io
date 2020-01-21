module Session exposing (..)

import Browser.Navigation as Nav
import Language exposing (Language(..))

type alias Session =
    { lang : Language
    , navKey : Nav.Key
    }
