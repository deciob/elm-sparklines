module Tests exposing (..)

import Test exposing (..)
import Expect
import Fuzz exposing (list, int, tuple, string)
import String
import Helpers exposing (linearScale, flip, buildPoints)
import Types exposing (Scale)


scaleA : Scale
scaleA =
    { domain = ( 0, 100 ), range = ( 0, 1000 ) }


scaleB : Scale
scaleB =
    { domain = ( -100, 100 ), range = ( 0, 1000 ) }


scaleC : Scale
scaleC =
    { domain = ( 10, 100 ), range = ( 0, 1000 ) }


scaleD : Scale
scaleD =
    { domain = ( 10, 100 ), range = ( 10, 1000 ) }


all : Test
all =
    describe "Helpers Test Suite"
        [ describe "Unit tests"
            [ test "linearScale 1" <|
                \() ->
                    linearScale scaleA 0 |> Expect.equal 0
            , test "linearScale 2" <|
                \() ->
                    linearScale scaleA 100 |> Expect.equal 1000
            , test "linearScale 3" <|
                \() ->
                    linearScale scaleA 50 |> Expect.equal 500
            , test "linearScale 4" <|
                \() ->
                    linearScale scaleB 0 |> Expect.equal 500
            , test "linearScale 5" <|
                \() ->
                    linearScale scaleB -100 |> Expect.equal 0
            , test "linearScale 6" <|
                \() ->
                    linearScale scaleC 10 |> Expect.equal 0
            , test "linearScale 7" <|
                \() ->
                    linearScale scaleC 100 |> Expect.equal 1000
            , test "linearScale 8" <|
                \() ->
                    linearScale scaleD 10 |> Expect.equal 10
            ]
        , describe "Fuzz tests, using randomly generated input"
            []
        ]
