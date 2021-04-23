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
        ] :> u1 <> " per " <> u2
    },
    {
        "productUnit" -> r : DelimitedSequence[GrammarToken["exponentiatedUnit"], "."] :> StringRiffle[{r}],
        "exponentiatedUnit" -> {
            GrammarToken["prefixedUnit"],
            FixedOrder[
                u : GrammarToken["prefixedUnit"],
                exp : GrammarToken["exp"]
            ] :> exp <> " " <> u
        },
        "exp" -> {
            "2" -> "square",
            "3" -> "cubic"
        },
        "prefixedUnit" -> {
            GrammarToken["unprefixedUnit"],
            FixedOrder[
                pr : GrammarToken["prefix"],
                u : GrammarToken["unprefixedUnit"]
            ] :> pr <> u
        },
        "prefix" -> {
            "Y" -> "yotta",
            "Z" -> "zetta",
            "E" -> "exa",
            "P" -> "peta",
            "T" -> "tera",
            "G" -> "giga",
            "M" -> "mega",
            "k" -> "kilo",
            "h" -> "hecto",
            "da" -> "deca",
            "d" -> "deci",
            "c" -> "centi",
            "m" -> "milli",
            "u" -> "micro",
            "n" -> "nano",
            "p" -> "pico",
            "f" -> "femto",
            "a" -> "atto",
            "z" -> "zepto",
            "y" -> "yocto"
        },
        "unprefixedUnit" -> {
            "m" -> "metre",
            "s" -> "second",
            "g" -> "gram",
            "rad" -> "radian",
            "K" -> "kelvin",
            "C" -> "coulomb",
            "cd" -> "candela",
            "mol" -> "mole",
            "sr" -> "steradian",
            "Hz" -> "hertz",
            "N" -> "newton",
            "Pa" -> "pascal",
            "J" -> "joule",
            "W" -> "watt",
            "A" -> "ampere",
            "V" -> "volt",
            "F" -> "farad",
            "Ohm" -> "ohm",
            "S" -> "siemens",
            "Wb" -> "weber",
            "T" -> "tesla",
            "H" -> "henry",
            "lm" -> "lumen",
            "lx" -> "lux",
            "Bq" -> "becquerel",
            "Gy" -> "gray",
            "Sv" -> "sievert",
            "kat" -> "katal",
            "l" | "L" -> "litre",
            "min" -> "minute",
            "h" -> "hour",
            "d" -> "day",
            "bar" -> "bar",
            "eV" -> "electronvolt"
        }
    }
]
