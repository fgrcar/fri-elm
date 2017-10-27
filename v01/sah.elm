module Main exposing (main)

import Html exposing (Html, text)


main : Html msg
main =
    Html.pre[] [Html.text (chessboard 8)]

chessboard n =
    let

        chessboardCreator m x y out =
        if y < m then
            if x < m then
                if ((x+y) % 2) == 0 then
                    chessboardCreator m (x+1) y (out ++ "*")
                else
                    chessboardCreator m (x+1) y (out ++ " ")
            else
                chessboardCreator m 0 (y+1) (out ++ "\n")
        else
            out
    in

    chessboardCreator n 0 0 ""
