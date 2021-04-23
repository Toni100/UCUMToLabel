(* ::Package:: *)

GrammarRules[
    {
        GrammarToken["productUnit"],
        FixedOrder[
            u1 : GrammarToken["productUnit"],
            "/",
            Alternatives[
                u2 : GrammarToken["exponentiatedUnit"],
                FixedOrder["(", u2 : GrammarToken["productUnit"], ")"]
            ]
        ] :> u1 <> " por " <> u2
    },
    {
        "productUnit" -> {
            r : DelimitedSequence[GrammarToken["exponentiatedUnit"], "."] :> StringRiffle[{r}]
        },
        "exponentiatedUnit" -> {
            GrammarToken["prefixedUnit"],
            FixedOrder[
                u : GrammarToken["prefixedUnit"],
                exp : GrammarToken["exp"]
            ] :> u <> " " <> exp
        },
        "exp" -> {
            "2" -> "cuadrado",
            "3" -> "c\[UAcute]bico"
        },
        "prefixedUnit" -> {
            GrammarToken["unprefixedUnit"],
            GrammarToken["informationUnit"],
            FixedOrder[
                pr : GrammarToken["prefix"],
                "m"
            ] :> StringJoin[
                StringDrop[pr, -1],
                StringReplace[
                    StringTake[pr, -1],
                    {"a" -> "\[AAcute]", "e" -> "\[EAcute]", "i" -> "\[IAcute]", "o" -> "\[OAcute]"}
                ],
                "metro"
            ],
            FixedOrder[
                pr : GrammarToken["prefix"],
                u : GrammarToken["unprefixedUnit"]
            ] :> pr <> u,
            FixedOrder[
                pr : GrammarToken["prefixMultiple"],
                u : GrammarToken["informationUnit"]
            ] :> pr <> u
        },
        "prefix" -> {
            GrammarToken["prefixMultiple"],
            "d" -> "deci",
            "c" -> "centi",
            "m" -> "mili",
            "\[Mu]" -> "micro",
            "n" -> "nano",
            "p" -> "pico",
            "f" -> "femto",
            "a" -> "atto",
            "z" -> "zepto",
            "y" -> "yocto"
        },
        "prefixMultiple" -> {
            "Y" -> "yotta",
            "Z" -> "zetta",
            "E" -> "exa",
            "P" -> "peta",
            "T" -> "tera",
            "G" -> "giga",
            "M" -> "mega",
            "k" -> "kilo",
            "h" -> "hecto",
            "da" -> "deca"
        },
        "unprefixedUnit" -> {
            "m" -> "metro",
            "s" -> "segundo",
            "g" -> "gramo",
            "rad" -> "radi\[AAcute]n",
            "K" -> "kelvin",
            "C" -> "culombio",
            "cd" -> "candela",
            "mol" -> "mol",
            "sr" -> "estereorradi\[AAcute]n",
            "Hz" -> "hercio",
            "N" -> "newton",
            "Pa" -> "pascal",
            "J" -> "julio",
            "W" -> "vatio",
            "A" -> "amperio",
            "V" -> "voltio",
            "F" -> "faradio",
            "Ohm" -> "ohmio",
            "S" -> "siemens",
            "Wb" -> "weber",
            (*"Cel"\[Rule]"grado Celsius",*)
            "T" -> "tesla",
            "H" -> "henrio",
            "lm" -> "lumen",
            "lx" -> "lux",
            "Bq" -> "becquerel",
            "Gy" -> "gray",
            "Sv" -> "sievert",
            "kat" -> "katal",
            "l" | "L" -> "litro",
            "min" -> "minuto",
            "h" -> "hora",
            "d" -> "d\[IAcute]a",
            "bar" -> "bar",
            "eV" -> "electronvoltio"
        },
        "informationUnit" -> {
            "bit" -> "bit",
            "By" -> "byte"
        }
    }
]
