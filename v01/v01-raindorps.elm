module Main exposing (main)

import Html exposing (Html, text)


main : Html msg
main =
    text (raindrops 105)


raindrops n =
    let
        div3 x =
            if (x % 3) == 0 then
                "Pling"
            else
                ""

        div5 x =
            if (x % 5) == 0 then
                "Plang"
            else
                ""

        div7 x =
            if (x % 7) == 0 then
                "Plong"
            else
                ""
    in
    div3 n ++ div5 n ++ div7 n
