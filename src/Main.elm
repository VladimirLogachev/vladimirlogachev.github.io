module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div [ class "app" ]
        [ nav [ class "nav" ]
            [ div []
                [ h1 [] [ text "Vladimir Logachev" ], intro ]
            ]
        ]


intro =
    div
        []
        [ p []
            [ strong []
                [ text "Programmer" ]
            , text
                ", also"
            , a [ href "/musician" ]
                [ text "a musician" ]
            ]
        , p []
            [ text "Available only for some non-commercial collaboration and pair programming." ]
        , p []
            [ img [ src "./images/items/facfaf.jpg", alt "FACFAF" ] [] ]
        , p []
            [ a [ href "mailto:doit@keemail.me" ]
                [ text "doit@keemail.me" ]
            ]
        ]



-- # Routes
-- # This file defines all application routes (Higher priority routes first)
-- # ~~~~
-- # Basic pages
-- GET     /                           controllers.HomeController.programmer
-- GET     /programmer                 controllers.HomeController.programmer
-- GET     /musician                   controllers.HomeController.musician
-- # Map static resources from the /public folder to the /assets URL path
-- GET     /assets/*file               controllers.Assets.versioned(path="/public", file: Asset)
-- # Redirect from 404
-- GET     /*anything                  controllers.HomeController.redirect404(anything)
