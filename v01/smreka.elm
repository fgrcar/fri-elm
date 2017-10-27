module Main exposing (main)

import Html exposing (Html, text)


pyramid : Int -> String
pyramid n =
    let
        smreka stuk out =
            if stuk == -1 then
                out
            else
                smreka (stuk - 1) (out ++ presledki stuk "" ++ zvezdice ((n - 1 - stuk) * 2 + 1) "" ++ presledki stuk "" ++ "\n")

        --smreka (stuk - 1) (out ++ zvezdice ((n - 1 - stuk) * 2 + 1) "" ++ "\n")
        presledki stuk text =
            if stuk == 0 then
                text
            else
                presledki (stuk - 1) (text ++ " ")

        zvezdice stevilo text =
            if stevilo == 0 then
                text
            else
                zvezdice (stevilo - 1) (text ++ "*")
    in
    smreka (n - 1) ""


main : Html msg
main =
    Html.pre [] [ Html.text (pyramid 5) ]
