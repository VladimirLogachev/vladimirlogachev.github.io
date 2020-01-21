module Page.Cv exposing (cv)

import Html.Styled exposing (..)
import Language exposing (Language(..), enRu)

cv : Language -> { title : String, content : Html msg }
cv lang =
    { title = enRu lang "Cv" "Резюме"
    , content = text "Cv content"
    }
