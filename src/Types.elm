module Types exposing (..)


type alias Domain =
    ( Float, Float )


type alias Range =
    ( Float, Float )


type alias Scale =
    { domain : Domain, range : Range }


type alias Point =
    { x : Float, y : Float }
