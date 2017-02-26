module Helpers exposing (..)

import List
import Tuple
import Types exposing (..)


linearScale : Scale -> Float -> Float
linearScale scale value =
    let
        ( d0, d1 ) =
            scale.domain

        ( r0, r1 ) =
            scale.range
    in
        value * ((r1 - r0) / (d1 - d0))


flip : Range -> Float -> Float
flip range value =
    (Tuple.second range) - value


buildPoints : (Float -> Float) -> (Float -> Float) -> Range -> List Point -> String
buildPoints xScale yScale yRange points =
    List.foldr
        (\point acc ->
            acc
                ++ " "
                ++ (xScale point.x |> toString)
                ++ ","
                ++ (yScale point.y |> flip yRange |> toString)
        )
        ""
        points
