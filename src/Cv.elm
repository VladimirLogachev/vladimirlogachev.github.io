module Cv exposing (cv)

import Browser
import Html.Styled exposing (..)


cv : a -> Browser.Document b
cv _ =
    { title = "Cv — Vladimir Logachev"
    , body = [ toUnstyled <| text "Cv content" ]
    }
