module Main exposing (main)

import Html exposing (text)

main =
    text "Vladimir Logachev... testing changes 6"


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
