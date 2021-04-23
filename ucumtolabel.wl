(* ::Package:: *)

BeginPackage["UCUMToLabel`"];


UCUMToLabel::usage =
"UCUMToLabel[ucum, lang] gives the label of the unit represented by the UCUM code ucum in the language with code lang.
UCUMToLabel[{ucum1, ucum2, \[Ellipsis]}, lang] gives the label for multiple units";


Begin["`Private`"];


$grammarDir = FileNameJoin[{
    DirectoryName[$InputFileName],
    "grammar"
}];


UCUMToLabel[ucum_String, lang_String] := Replace[
    UCUMToLabel[{ucum}, lang],
    {x_} :> x
];


UCUMToLabel[{}, _] := {};
UCUMToLabel[ucumList:{__String}, lang_String] := Enclose[
    Module[{grammar},
        grammar = Confirm[
            Get[
                FileNameJoin[{$grammarDir, lang <> ".wl"}]
            ]
        ];
        myGrammarApply[grammar, #] & /@ ucumList
    ]
];


myGrammarApply[grammar_GrammarRules, input_String] := (
    Needs["GraphStore`"];
    GraphStore`Parsing`GrammarApply1[
        grammar,
        input,
        IgnoreCase -> False
    ]
)


End[];


EndPackage[];
