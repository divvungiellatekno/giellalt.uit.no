# Taggmøte 2. mars 2021
Tilstede: Sjur, Trond, Inga, Lene, Thomas

## Samansetjingstaggar i GiellaLT:

### Tre klassar:
* deskriptive taggar: +Cmp/*
    - desse kjem i affixes/nouns.lexc, compounds.lexc legg til Cmp#
* normative taggar: +CmpN/*
    - Her er CmpN/SgN default som aleinetag, lagt til i stems/nouns.lexc
* normative posisjonstaggar: +CmpNP/*
    - desse avgrensar berre normativ posisjon (prefiks, fyrst, berre i slutten, ikkje i det heile, osb)

### Hvilke tagger skal vi bruke når det er førsteleddet er forkortet eller ikke-assimilert lån?
Eksempler med ny tagg +Cmp/Unass
* asylårdnik     +Cmp/Unass   asyl+ådnik (asyl er ikke produktiv)
* asijllaårdnik  +Cmp/SgNom  asijlla+årdnik
+CmpNP/Pref (Prefiks) Normativ Posisjon 

balkong og kultur er produktive:
* balkoaŋŋa+årdnik  +Cmp/SgNom
* balkong+årdnik                +Cmp/Unass   
* balkoaŋŋa+N+Sem/Dummytag+Cmp/Unass:balkong%> R ;
* balkoaŋ+årdnik                +Cmp/Sh
* +CmpNP/Pref+Cmp/SgNom:r%> R ; !short cmp, "kulturskåvllå"  , fra affix-fila, KULTUVRRA:

balkoaŋŋa+N+Sem/Dummytag:balkong%> R ; (Her mangler Cmp-tagg, bør det være +Cmp/Unass eller +Cmp/Sh ?)

## Problemet er harmonisering
Vi må ha et system som gjør det mulig å gå fra språk til språk

* For analyse: tagger forteller om typen Cmp
* For generering i MT: sammensetninga som ikke er foretrukket, skal ha en annen tagg, eller en ekstra tagg

### Det er behov for å skille mellom sammensetninger (dvs. vi kan ikke gjøre dem valgfrie)
* eatnigiella  +Cmp/SgGen  (morsmål)
* eadneluopmu  +Cmp/SgNom    (morpermisjon)
* etniidbeaivi +Cmp/PlGen  (morsdag)

Mulig løsning
* Den foretrukne vil aldri være +Cmp/Unass
* Hvis den foretrukne er den lange formen, kan vi legge +Cmp/Sh til den korte
* Hvis den foretrukne er den korte formen, kan vi legge +Cmp/Long til den korte
Men da vil ikke analysen fortelle alltid gi god informasjon

Det er mulig å legge til regel i tools/mt/apertium/tagger/modify.regex fra smj:
* +Cmp/Sh > +Cmp/SgNom

```
balkoaŋŋaårdnik
balkoaŋŋaårdnik    balkoaŋŋa+N+G3+Cmp/SgNom+Cmp#årdnik+v1+N+Sg+Nom    0,000000
balkoaŋŋaårdnik    balkoaŋŋa+N+G3+Cmp/SgNom+Cmp#årdnik+v1+N+Sg+Nom    0,000000

balkongårdnik
balkongårdnik    balkoaŋŋa+N+Cmp#årdnik+v1+N+Sg+Nom    0,000000
balkongårdnik    balkoaŋŋa+N+Cmp#årdnik+v1+N+Sg+Nom    0,000000

kultuvrraårdnik +Cmp/SgNom+Cmp/Long
kulturårdnik   +Cmp/SgNom
```

Oversikt fra smj root:
```
+CmpNP/All       !!≈ * **@CODE@** - ... in all positions, **default**, this tag does not have to be written
+CmpNP/First     !!≈ * **@CODE@** - ... only be first part in a compound or alone
+CmpNP/Pref      !!≈ * **@CODE@** - ... only **first** part in a compound, NEVER alone
+CmpNP/Last      !!≈ * **@CODE@** - ... only be last part in a compound or alone
+CmpNP/Suff      !!≈ * **@CODE@** - ... only **last** part in a compound, NEVER alone
+CmpNP/None      !!≈ * **@CODE@** - ... does not take part in compounds
+CmpNP/Only      !!≈ * **@CODE@** - ... only be part of a compound, i.e. can never

+CmpN/SgN      !!≈ * **@CODE@** Singular Nominative !! Unmarked = Default
+CmpN/SgG      !!≈ * **@CODE@** Singular Genitive
+CmpN/PlG      !!≈ * **@CODE@** Plural Genitive
+CmpN/PlN      !!≈ * **@CODE@** Plural Nominative, propers!
+CmpN/SgNomLeft  !!≈ * **@CODE@** Singular Nominative
+CmpN/SgGenLeft  !!≈ * **@CODE@** Singular Genitive
+CmpN/PlGenLeft  !!≈ * **@CODE@** Plural Genitive

 +Cmp          !!≈ * **@CODE@** - Dynamic compound. This tag should always be part

 +Cmp/Attr     !!≈ * **@CODE@** - Attributive
 +Cmp/SgNom    !!≈ * **@CODE@** - Singular Nominative
 +Cmp/SgGen    !!≈ * **@CODE@** - Singular Genitive
 +Cmp/PlGen    !!≈ * **@CODE@** - Plural Genitiv
 +Cmp/SplitR   !!≈ * **@CODE@** - This is a split compound with the other part to
##                  => Arbeids- = +Cmp/SplitR
 +Cmp/SplitL   !!≈ * **@CODE@** - This is a split compound with the other part to the left
 +Cmp/Sh       !!≈ * **@CODE@** - testing +Cmp/Sh
 +Cmp/Hyph     !!≈ * **@CODE@** - on dynamic compounds that have a hyphen
 +Cmp/NoHyph   !!≈ * **@CODE@** - On compounds that COULD have had a hyphen (and usually have), but doesn't
 +Cmp/SoftHyph !!≈ * **@CODE@** - Tags compounds containing SOFT HYPHENS (U+00AD)
 +Cmp/Cit      !!≈ * **@CODE@** - Tags citation compounds, which can in principle

 
 ```
