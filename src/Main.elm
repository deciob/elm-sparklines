module Main exposing (..)

import Debug exposing (log)
import Html exposing (text)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Helpers exposing (..)
import Types exposing (..)


dataset : List Point
dataset =
    [ { x = 0, y = 50 }
    , { x = 2, y = 100 }
    , { x = 4, y = 500 }
    , { x = 6, y = 100 }
    , { x = 8, y = 50 }
    , { x = 10, y = 150 }
    ]


xDomain : Domain
xDomain =
    ( 0, 10 )


xRange : Range
xRange =
    ( 0, 600 )


yDomain : Domain
yDomain =
    ( 0, 500 )


yRange : Range
yRange =
    ( 0, 400 )


main =
    let
        xScale =
            linearScale { domain = xDomain, range = xRange }

        yScale =
            linearScale { domain = yDomain, range = yRange }

        _ =
            log "buildPoints" (buildPoints xScale yScale yRange dataset)
    in
        svg [ height "400", width "600" ]
            [ node "polyline"
                [ fill "none"
                , points <| buildPoints xScale yScale yRange dataset
                , stroke "black"
                ]
                []
            , Svg.text ""
            ]
