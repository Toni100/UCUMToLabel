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
        ] :> u1 <> " par " <> u2
    },
    {
        "productUnit" -> r : DelimitedSequence[GrammarToken["exponentiatedUnit"], "."] :> StringRiffle[{r}, "-"],
        "exponentiatedUnit" -> {
            GrammarToken["prefixedUnitF"],
            GrammarToken["prefixedUnitM"],
            FixedOrder[
                u : GrammarToken["prefixedUnitF"],
                exp : GrammarToken["expF"]
            ] :> u <> " " <> exp,
            FixedOrder[
                u : GrammarToken["prefixedUnitM"],
                exp : GrammarToken["expM"]
            ] :> u <> " " <> exp
        },
        "expF" -> {
            "2" -> "carr\[EAcute]e",
            "3" -> "cube"
        },
        "expM" -> {
            "2" -> "carr\[EAcute]",
            "3" -> "cube"
        },
        "prefixedUnitF" -> {
            GrammarToken["unprefixedUnitF"],
            FixedOrder[
                pr : GrammarToken["prefix"],
                u : GrammarToken["unprefixedUnitF"]
            ] :> pr <> u
        },
        "prefixedUnitM" -> {
            GrammarToken["unprefixedUnitM"],
            FixedOrder[
                pr : GrammarToken["prefix"],
                u : GrammarToken["unprefixedUnitM"]
            ] :> pr <> u
        },
        "prefix" -> {
            "Y" -> "yotta",
            "Z" -> "zetta",
            "E" -> "exa",
            "P" -> "p\[EAcute]ta",
            "T" -> "t\[EAcute]ra",
            "G" -> "giga",
            "M" -> "m\[EAcute]ga",
            "k" -> "kilo",
            "h" -> "hecto",
            "da" -> "d\[EAcute]ca",
            "d" -> "d\[EAcute]ci",
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
        "unprefixedUnitF" -> {
            "s" -> "seconde",
            "cd" -> "candela",
            "mol" -> "mole"
        },
        "unprefixedUnitM" -> {
            "m" -> "m\[EGrave]tre",
            "g" -> "gramme",
            "rad" -> "radian",
            "K" -> "kelvin",
            "C" -> "coulomb",
            "sr" -> "st\[EAcute]radian",
            "Hz" -> "hertz",
            "N" -> "newton",
            "Pa" -> "pascal",
            "J" -> "joule",
            "W" -> "watt",
            "A" -> "amp\[EGrave]re",
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
            "Ci" -> "curie",
            "R" -> "r\[ODoubleDot]ntgen"
        }
    }
]
