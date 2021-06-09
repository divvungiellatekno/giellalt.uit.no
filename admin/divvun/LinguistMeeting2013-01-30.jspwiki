# Lingvistmøte

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* Testdata i lexc-filene
* Taggar for unormerte former og ord

# Testdata i lexc-filene

[Spesifikasjonar](/infra/infraremake/AddingMorphologicalTestData.html#Lexc+tests)

```
## €fst-type:
    Specifies the fst-type to run a test set against, must be followed by the
    test name, and must be the first line in a test set.
## €
    print positive test data to output
## $
    print negative test data to output
```

Ei yaml-fil ser slik ut:

```
Tests:
  Adjective - båadtsah: # 
    båadtsah+A+Attr: båadtsah 
    båadtsah+A+Sg+Nom: [ båadtsan, båadtsa, båadtsode]
```

I lexc blir dette sjåande slik ut:

```
## €gt-norm: @LEXNAME@ - båadtsah
## € båadtsah    båadtsah+A+Attr
## € båadtsan    båadtsah+A+Sg+Nom
## € båadtsa     båadtsah+A+Sg+Nom
## € båadtsode   båadtsah+A+Sg+Nom
```

make check TESTS=run-gt-norm-yaml-testcases.sh

```
Subtest 5 - xerox: Testing ./adjectives-affixes_gt-norm.yaml using ./../../../src/analyser-gt-norm.xfst

[FAIL] Test 0: adjectives on ah an - båadtsah (Lexical/Generation) 1/2/3
[FAIL] Test 1: adjectives on ah an - båadtsah (Surface/Analysis) 1/3/4
```

```
-----------------------------------------------------------
Test 0: adjectives on ah an - båadtsah (Lexical/Generation)
-----------------------------------------------------------
[PASS] båadtsah+A+Attr => båadtsah
[FAIL] båadtsah+A+Sg+Nom => Missing results: båadtsode
[FAIL] båadtsah+A+Sg+Nom => Unexpected results: båadtsan

Test 0 - Passes: 1, Fails: 2, Total: 3
---------------------------------------------------------
Test 1: adjectives on ah an - båadtsah (Surface/Analysis)
---------------------------------------------------------
[PASS] båadtsah => båadtsah+A+Attr
[FAIL] båadtsode => Missing results: båadtsah+A+Sg+Nom
[FAIL] båadtsode => Unexpected results: båadtsoeh+A+Sg+Nom, båadtsode+Adv

Test 1 - Passes: 1, Fails: 3, Total: 4
```

Pga ein feil i konverteringa av yaml-testar i lexc, må vi i ein periode skriva
testar som inneheld fleire alternative ordfomer på denne måten:

```
## €gt-norm: adjectives on ah an - båadtsah
## ¥ båadtsah+A+Attr:    båadtsah
## ¥ båadtsah+A+Sg+Nom: [båadtsan, båadtsa, båadtsode]
```

Dvs bruka `!!¥ ` i staden for `!!€ `. Deretter skriv ein testdata akkurat
som i yaml-fila.

Etter å ha skrive om testdata til dette formatet, vart testresultatet dette:

```
Test 0: adjectives on ah an - båadtsah (Lexical/Generation)
-----------------------------------------------------------
[PASS] båadtsah+A+Attr => båadtsah
[PASS] båadtsah+A+Sg+Nom => båadtsan
[FAIL] båadtsah+A+Sg+Nom => Missing results: båadtsode, båadtsa

Test 0 - Passes: 2, Fails: 2, Total: 4
---------------------------------------------------------
Test 1: adjectives on ah an - båadtsah (Surface/Analysis)
---------------------------------------------------------
[PASS] båadtsah => båadtsah+A+Attr
[PASS] båadtsan => båadtsah+A+Sg+Nom
[FAIL] båadtsa => Missing results: båadtsah+A+Sg+Nom
[FAIL] båadtsa => Unexpected results: båedtsedh+V+TV+Ind+Prs+Sg3
[FAIL] båadtsode => Missing results: båadtsah+A+Sg+Nom
[FAIL] båadtsode => Unexpected results: båadtsoeh+A+Sg+Nom, båadtsode+Adv

Test 1 - Passes: 2, Fails: 5, Total: 7
```

# Taggar for unormerte former og ord

Inga vil innføra ein tagg som viser at Divvun har normert utan at det finst
offisielt vedtak. Då vil det vera lettare å finna ting i etterhand, både for å
dokumentera ein viss bruk, og som grunnlag for normeringsdiskusjonar.

Kva med: `+Use/DNorm`? Vi treng òg motsetnaden: `+Use/NotDNorm`.

* **`+Use/DNorm`**:     Dette er det Divvun føreslår bør vera norm, før vedtak er gjort.
* **`+Use/NotDNorm`**:  Dette er former som Divvun føreslår *ikkje* bør vera norm.

Etter at vedtak er gjort, vil vi sjølvsagt retta oss etter det, og fjerna
taggane. Taggane kan brukast til å henta ut statistikk om frekvens av ulike
former, og ev. slik at vi berre tek med `+Use/DNorm` i stavekontrollen.

Taggane må førast inn forsiktig, slik at vi er sikre på at vi ikkje skiplar
kompileringa og funkjsonaliteten til ulike program og tenester.
