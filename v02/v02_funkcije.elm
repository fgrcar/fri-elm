module Main exposing (..)

import Html exposing (..)


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



-- empty : Set
-- singleton : Int -> Set
-- interval : Int -> Int -> Set
-- union : Set -> Set -> Set
-- intersect : Set -> Set -> Set
-- toString : Set -> String


type alias RealFunc =
    Float -> Float


sumf : RealFunc -> RealFunc -> RealFunc
sumf f1 f2 =
    \n -> f1 n + f2 n


multf : RealFunc -> RealFunc -> RealFunc
multf f1 f2 =
    \n -> f1 n * f2 n


compose : RealFunc -> RealFunc -> RealFunc
compose f1 f2 =
    \n -> f2 (f1 n)


eps =
    0.002


derive : RealFunc -> RealFunc
derive f1 =
    \n -> (f1 n - f1 (n + eps)) / eps


f : RealFunc
f x =
    x * x + 3


g : RealFunc
g x =
    x + 5


makeTable : RealFunc -> Float -> Float -> Float -> String
makeTable f1 zacetek konec interval =
    let
        createTable f1 zacetek konec interval out =
            if zacetek <= konec then
                createTable f1 (zacetek + interval) konec interval (out ++ toString zacetek ++ " " ++ toString (f1 zacetek) ++ "\n")
            else
                out
    in
    createTable f1 zacetek konec interval ""



--type alias Coder =
--Char -> Char
-- encode: String -> Coder -> String
-- isBijective : Coder -> Boolean


main =
    Html.text (makeTable (derive g) 0.0 1.0 0.1) |> (\e -> Html.pre [] [ e ])
