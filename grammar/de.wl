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
        ] :> u1 <> " pro " <> u2
    },
    {
        "productUnit" -> {
            GrammarToken["exponentiatedUnit"],
            FixedOrder[
                u1 : GrammarToken["prefixedUnit"],
                ".",
                u2 : GrammarToken["unprefixedUnit"]
            ] :> u1 <> ToLowerCase[u2],
            FixedOrder[
                u1 : GrammarToken["exponentiatedUnit"],
                ".",
                u2 : GrammarToken["exponentiatedUnit"]
            ] :> u1 <> "-" <> u2
        },
        "exponentiatedUnit" -> {
            GrammarToken["prefixedUnit"],
            FixedOrder[
                u : GrammarToken["prefixedUnit"],
                exp : GrammarToken["exp"]
            ] :> exp <> ToLowerCase[u]
        },
        "exp" -> {
            "2" -> "Quadrat",
            "3" -> "Kubik"
        },
        "prefixedUnit" -> {
            GrammarToken["unprefixedUnit"],
            GrammarToken["informationUnit"],
            FixedOrder[
                pr : GrammarToken["prefix"],
                u : GrammarToken["unprefixedUnit"]
            ] :> pr <> ToLowerCase[u],
            FixedOrder[
                pr : GrammarToken["prefixMultiple"] | GrammarToken["binaryPrefix"],
                u : GrammarToken["informationUnit"]
            ] :> pr <> ToLowerCase[u]
        },
        "prefix" -> {
            GrammarToken["prefixMultiple"],
            "d" -> "Dezi",
            "c" -> "Zenti",
            "m" -> "Milli",
            "\[Mu]" -> "Mikro",
            "n" -> "Nano",
            "p" -> "Piko",
            "f" -> "Femto",
            "a" -> "Atto",
            "z" -> "Zepto",
            "y" -> "Yokto"
        },
        "prefixMultiple" -> {
            "Y" -> "Yotta",
            "Z" -> "Zetta",
            "E" -> "Exa",
            "P" -> "Peta",
            "T" -> "Tera",
            "G" -> "Giga",
            "M" -> "Mega",
            "k" -> "Kilo",
            "h" -> "Hekto",
            "da" -> "Deka"
        },
        "binaryPrefix" -> {
            "Ki" -> "Kibi",
            "Mi" -> "Mebi",
            "Gi" -> "Gibi",
            "Ti" -> "Tebi"
        },
        "unprefixedUnit" -> {
            "m" -> "Meter",
            "s" -> "Sekunde",
            "g" -> "Gramm",
            "rad" -> "Radiant",
            "K" -> "Kelvin",
            "C" -> "Coulomb",
            "cd" -> "Candela",
            "mol" -> "Mol",
            "sr" -> "Steradiant",
            "Hz" -> "Hertz",
            "N" -> "Newton",
            "Pa" -> "Pascal",
            "J" -> "Joule",
            "W" -> "Watt",
            "A" -> "Ampere",
            "V" -> "Volt",
            "F" -> "Farad",
            "Ohm" -> "Ohm",
            "S" -> "Siemens",
            "Wb" -> "Weber",
            "T" -> "Tesla",
            "H" -> "Henry",
            "lm" -> "Lumen",
            "lx" -> "Lux",
            "Bq" -> "Becquerel",
            "Gy" -> "Gray",
            "Sv" -> "Sievert",
            "kat" -> "Katal",
            "l" | "L" -> "Liter",
            "min" -> "Minute",
            "h" -> "Stunde",
            "d" -> "Tag",
            "bar" -> "Bar",
            "eV" -> "Elektronenvolt"
        },
        "informationUnit" -> {
            "bit" -> "Bit",
            "By" -> "Byte"
        }
    }
]
