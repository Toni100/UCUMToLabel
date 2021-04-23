(* ::Package:: *)

GrammarRules[
    {
        GrammarToken["exponentiatedUnit"],
        FixedOrder[
            u1 : GrammarToken["exponentiatedUnit"],
            "/",
            Alternatives[
                u2 : GrammarToken["exponentiatedUnit"],
                FixedOrder["(", u2 : GrammarToken["exponentiatedUnit"], ")"]
            ]
        ] :> u1 <> " per " <> u2
    },
    {
        "exponentiatedUnit" -> {
            GrammarToken["prefixedUnit"],
            FixedOrder[
                u : GrammarToken["prefixedUnit"],
                exp : GrammarToken["exp"]
            ] :> exp <> u
        },
        "exp" -> {
            "2" -> "n\[EAcute]gyzet",
            "3" -> "k\[ODoubleDot]b"
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
            "h" -> "hekto",
            "da" -> "deka",
            "d" -> "deci",
            "c" -> "centi",
            "m" -> "milli",
            "u" -> "mikro",
            "n" -> "nano",
            "p" -> "piko",
            "f" -> "femto",
            "a" -> "atto",
            "z" -> "zepto",
            "y" -> "yokto"
        },
        "unprefixedUnit" -> {
            "m" -> "m\[EAcute]ter",
            "s" -> "m\[AAcute]sodperc",
            "g" -> "gramm",
            "rad" -> "radi\[AAcute]n",
            "K" -> "kelvin",
            "C" -> "coulomb",
            "cd" -> "kandela",
            "mol" -> "m\[OAcute]l",
            "sr" -> "szteradi\[AAcute]n",
            "Hz" -> "hertz",
            "N" -> "newton",
            "Pa" -> "pascal",
            "J" -> "joule",
            "W" -> "watt",
            "A" -> "amper",
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
            "l" | "L" -> "liter",
            "min" -> "perc",
            "h" -> "\[OAcute]ra",
            "d" -> "nap",
            "bar" -> "bar",
            "eV" -> "elektronvolt"
        }
    }
]
