Needs["UCUMToLabel`"];

VerificationTest[
    UCUMToLabel["m", "en"],
    "metre"
]

VerificationTest[
    UCUMToLabel["km", "en"],
    "kilometre"
]

VerificationTest[
    UCUMToLabel["m/s", "en"],
    "metre per second"
]

VerificationTest[
    UCUMToLabel["N.m", "en"],
    "newton metre"
]

VerificationTest[
    UCUMToLabel[{"m", "s"}, "en"],
    {"metre", "second"}
]

VerificationTest[
    UCUMToLabel["m", "de"],
    "Meter"
]

VerificationTest[
    UCUMToLabel["m", "X"],
    _?FailureQ,
    {Get::noopen},
    SameTest -> MatchQ
]
