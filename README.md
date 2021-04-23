# ucumtolabel

Generate labels for [units of measurement](http://www.wikidata.org/entity/Q47574) from [UCUM](http://www.wikidata.org/entity/Q2494286) codes using [WL](http://www.wikidata.org/entity/Q15241057).

## Setup
```
PrependTo[$Path, "~/git/ucumtolabel"];
<< UCUMToLabel`
```

## Examples

### English
Base unit:
```
In[]:= UCUMToLabel["m", "en"]

Out[]= "metre"
```

Prefixed unit:
```
In[]:= UCUMToLabel["km", "en"]

Out[]= "kilometre"
```

Compound units:
```
In[]:= UCUMToLabel[{"m/s", "N.m", "mol/dm3"}, "en"]

Out[]= {"metre per second", "newton metre", "mole per cubic decimetre"}
```

### German
```
In[]:= UCUMToLabel[{"m2", "A.s/m3", "J", "J/kg", "Pa.s"}, "de"]

Out[]= {"Quadratmeter", "Amperesekunde pro Kubikmeter", "Joule", "Joule pro Kilogramm", "Pascalsekunde"}
```

### Spanish
```
In[]:= UCUMToLabel[{"m2", "A.s/m3", "J", "J/kg", "Pa.s"}, "es"]

Out[]= {"metro cuadrado", "amperio segundo por metro cúbico", "julio", "julio por kilogramo", "pascal segundo"}
```

### French
```
In[]:= UCUMToLabel[{"m2", "A.s/m3", "J", "J/kg", "Pa.s"}, "fr"]

Out[]= {"mètre carré", "ampère-seconde par mètre cube", "joule", "joule par kilogramme", "pascal-seconde"}
```

### Hungarian
```
In[]:= UCUMToLabel[{"m3", "A/m2", "J", "mol/kg"}, "hu"]

Out[]= {"köbméter", "amper per négyzetméter", "joule", "mól per kilogramm"}
```
