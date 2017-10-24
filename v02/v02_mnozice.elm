module Main exposing (main)

import Html exposing (Html, text)


main : Html msg
main =
    let
        a =
            singleton 5
    in
    text (show 2 13 isPrime)



--(raindrops 105)


type alias Set =
    Int -> Bool


empty : Set
empty =
    \x -> False


singleton : Int -> Set
singleton n =
    \x ->
        if n == x then
            True
        else
            False


interval : Int -> Int -> Set
interval x y =
    \n ->
        if n <= y && n >= x then
            True
        else
            False


union : Set -> Set -> Set
union set1 set2 =
    \n ->
        if set1 n || set2 n then
            True
        else
            False


intersect : Set -> Set -> Set
intersect set1 set2 =
    \n ->
        if set1 n && set2 n then
            True
        else
            False


show : Int -> Int -> Set -> String
show x1 x2 set =
    let
        createShow x1 x2 set out =
            if x1 <= x2 then
                if set x1 then
                    createShow (x1 + 1) x2 set (out ++ toString x1 ++ ",")
                else
                    createShow (x1 + 1) x2 set out
            else
                out ++ "}"
    in
    createShow x1 x2 set "{"


isPrime n =
    let
        checkDiv k i =
            if i * i > k then
                True
            else if k % i == 0 then
                False
            else
                checkDiv k (i + 1)
    in
    checkDiv n 2
