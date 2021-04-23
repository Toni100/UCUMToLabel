# ucumtolabel

Generate labels for [units of measurement](http://www.wikidata.org/entity/Q47574) from [UCUM](http://www.wikidata.org/entity/Q2494286) codes using [WL](http://www.wikidata.org/entity/Q15241057).

## Setup
```
myGrammarApply[grammar_GrammarRules, input_String] := (
    Needs["GraphStore`"];
    (* internal function; use at your own risk *)
    (* - supports IgnoreCase -> False *)
    (* - speed (offline) *)
    GraphStore`Parsing`GrammarApply1[
        grammar,
        input,
        IgnoreCase -> False
    ]
)
```

## Examples

### English
Load a grammar:
```
grammarRulesEN = Get["~/git/ucumtolabel/grammar/en.wl"];
```

Base unit:
```
In[]:= myGrammarApply[grammarRulesEN, "m"]

Out[]= "metre"
```

Prefixed unit:
```
In[]:= myGrammarApply[grammarRulesEN, "km"]

Out[]= "kilometre"
```

Compound units:
```
In[]:= myGrammarApply[grammarRulesEN, #] & /@ {"m/s", "N.m", "mol/dm3"}

Out[]= {"metre per second", "newton metre", "mole per cubic decimetre"}
```

### German
```
In[]:= With[
    {rules = Get["~/git/ucumtolabel/grammar/de.wl"]},
    myGrammarApply[rules, #] & /@ {"m2", "A.s/m3", "J", "J/kg", "Pa.s"}
]

Out[]= {"Quadratmeter", "Amperesekunde pro Kubikmeter", "Joule", "Joule pro Kilogramm", "Pascalsekunde"}
```

### Spanish
```
In[]:= With[
    {rules = Get["~/git/ucumtolabel/grammar/es.wl"]},
    myGrammarApply[rules, #] & /@ {"m2", "A.s/m3", "J", "J/kg", "Pa.s"}
]

Out[]= {"metro cuadrado", "amperio segundo por metro cúbico", "julio", "julio por kilogramo", "pascal segundo"}
```

### French
```
In[]:= With[
    {rules = Get["~/git/ucumtolabel/grammar/fr.wl"]},
    myGrammarApply[rules, #] & /@ {"m2", "A.s/m3", "J", "J/kg", "Pa.s"}
]

Out[]= {"mètre carré", "ampère-seconde par mètre cube", "joule", "joule par kilogramme", "pascal-seconde"}
```

### Hungarian
```
In[]:= With[
    {rules = Get["~/git/ucumtolabel/grammar/hu.wl"]},
    myGrammarApply[rules, #] & /@ {"m3", "A/m2", "J", "mol/kg"}
]

Out[]= {"köbméter", "amper per négyzetméter", "joule", "mól per kilogramm"}
```
