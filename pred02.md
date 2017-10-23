TV - 20. okt

Pregled:
- tipi v funkcijah
- funkcije kot podatki
- anonimne funkcije
- currying
- pipes

## Tipi v funkcijah

```elm

module Main exposing (...)

import HTML

f: Int -> Int
f n = 
    n * 5

g: Int -> Int -> Int
g n m = 
    n * m

-----------------------------

range: Int -> Int -> String
range start end =
    if start >= end then
        ""
    else
        (toString start)++" "++(range (start+1) end)


rangeMap: (Int -> String) -> Int-> Int -> String
rangeMap f start end = 
    if starte >= end then
        ""
    else
        (f start)++(rangeMap f (start+1) end)

zvezdica: Int -> String
zvezdica int =
    "*"

vrstica: Int  -> String
vrstica n =
    (rangeMap zvezdica 1 n)++"\n"
    

smrekica : Int -> String
smrekica n = 
    rangeMap vrstica 1 (n+1)
    -- Z uporabo anonimnih funkcij
    -- rangeMap (\m -> (rangeMap (\x -> "*") 1 (m+1)) ++ "\n")) 1 (n+1)

main = 
    Html.pre[] [Html.text (smrekica 5)]
```

```elm

    rangeFold: (Int -> Int -> Int) -> Int -> Int -> Inft -> Int
    rangeFold f init s e = 
        if s >= e then
            init
        else
            rangeFold f (f init s) (s + 1) e

    sumRange s e = 
        rangeFold (\x y -> x+y) 0 s e

```

## Pipes "|>"

```elm

main = 
    smrekica 10
        |> String.reverse
        -- besedila na vrhu
        |> String.append "Moja smrekica \n"
        -- besedilo spodaj
        |> \s -> String append s "Moja Smrekica \n"

        |> Html.text
        |> \x -> Html.pre[] [ x ]
