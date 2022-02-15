# Notes from the Helsinki meeting
## Improvements

### Documentation

Corpus location and processing

Corpus infrastructure:

a genre-based catalogue structure, accessing files catalogue-wise:
```
    admin/depts/  (governmental departments)
          guovda/ (Guovdageaidnu municipality)
          karas/  (Kárášjohka municipality)
          sd/     (Saami parliament)
          others/ (everything else)
    bible/ot/
          nt/
    facta/
    ficti/
    laws/
    newsp/MinAigi
         /Assu
```

a2. alternative a. extended with a command-line xml-aware grep tool (sgrep,
    xmlstarlet)

b.  an xml-database, accessing text via the information in the xml files
    This will be an alternative if the corpus grows to be an unwieldy mass, and
    if our current tools are not able to cope with that amount of data.

Structure of the corp/sme/ catalogue

- A basic 3-way division: orig(inal files), int(ermediate files), and
  the processed files (now called gt, new name?)
- Same directory substructure in all three catalogues

## Speller infrastructure

Responsibilities

* rpm/Debian/etc: Børre
* Sjur continues this list

## Speller internals

* Aspell complains about UTF-8 chars in affix contexts - the affix will be ignored.
* Aspell munch-list crashes when the input list is too big (out-of-memory?)

## Lexicon format

### Lexicon content

* lexc requires the following parts:
    - lemma
    - stem (if different from lemma)
    - continuation_class
    - mother_lexicon
* spellers need:
    - compound first part
    - compound middle part
    - compound last part
* We may add these things:
    - ID? (lexicon synchronisation with outside sources = Anders Kintel):
        - use lemma and continuation lexicon as unique identifiers
    - frequency?
* hyphenation needs:
    - hyphenation points that are rule exceptions
* The lexicographers want the ordinary dictionary parts
    - grammatical info, translations, examples, etc. For Lule, we get this as input

id=lemma lexc
id=lemma dict

Non-xml formatting:

* strict attribute order
* aligned attribute position

### Tools

* conversion from XML to:
    - lexc
    - Aspell
    - hunspell
    - whatever...
* sorting the lexicon
* editing:
    - text only for the time being
        - xml checking/validation on commit, not as part of the editing?
* synchronisation:
    - central version containing everything
        - we synch against that one
        - Anders synch against that one

## Proofing tools public tender

Technical specification delayed till after

## Computer issues

* UTF-8 and perl
* Aspell, latest version sme speller
* UTF-8 in the shell (Saara)
* do all have the Xerox tools? The latest version?
* forrest installed?
* do the lš -> ls test.
* BCKSP in certain Xerox applications
* install Trond's Saami y-keyboard
* security: password change

## Linguistic issues

* threepart compounding
* Oslo -> oslola
* vowel shortening
* number generator works only in nominative
* indefinite pronouns

1. Discussion:
    1. Should we sort the lexica alphabetically?

* Groups:

* g1 vowel shortening trond, thomas, børre
* g2 3-part compounds sjur, maaren, ilona
* g3 downcasing (oslolaš) tomi, saara

* g4 currency sign ilona, børre

numeral compounds

* Open:
3-part compounds sáme-gielLA-prošeakta, kárášjoga olmmoš = kárášjohkalaš
indefinite pronouns

1. The issues
    1. currency sign - what is it supposed to do?
    1. blocking problems (3-part compounds, Oslolaš)
    1. blocking problems (Oslo -> oslolaš)
    1. vowel shortening in compounds
    1. numerals (get the facts right - and make a generator)
    1. indefinite pronouns (linguistics)

## Linguistic issues - Northern Sámi
* currency sign - what is it supposed to do?
    - Evaluating, it seems it most cases is in front of VIVVA, but also in front of GOAHTI, It is required in diphthong simplification rules.
    - Goal: Write a documentation for this sign
    - Theories: It blocks consonant gradation, it blocks diphthong simplification, it is there to distinguish between animate and inanimate nouns
    - Hint: Check out the first versions of sme-lex

* 3-part compounds,
    - Here, we need lingustic input, but first and foremost we need a computational linguistic treatment.

* Oslola≈°)
    - Here, the flag diacritic solution should work (TM). The facts here are clear, and the linguists do not need to discuss them, it is solely an issue for computational linguists.

* vowel shortening in compounds
    - 6 of the rules in the twol file are relevant to this issuee, viz.
```
"Optional Vowel Shortening after Short 1st Syllable"
"Optional Shortening of á in Compounds after Long 1st Syllable 1"
"Optional Shortening of á in Compounds after Long 1st Syllable 2"
"Vowel Shortening in Vowel-Final Compounds after Long 1st Syllable 1"
"Optional Vowel Shortening in Cns-Final Compounds after Long 1st Syllable 1"
"Vowel Shortening in Compounds of Contract Stems"
```
* facultative vowel simplification in compounds
    - Linked to the weakening issue.
    - Also an issue how to do simplificatrion in twol.

* numerals (get the facts right - and make a generator)
    - today: two.nom-hundred.nom-fifty.nom-five.{nom/gen/loc/../ordinal}, but not concord
    - The issue: What are the facts, and how to analyse

* indefinite pronouns
    - Read through the source code.

#  Legal issues

The Oslo requirement for corpus end users:
1 ("Eg lovar å bruke Oslo-korpuset av tagga tekstar utelukkande for akademiske,
    ikkje-kommersielle føremål")
2 ("Eg lovar å la passordet mitt vere strengt personleg, og vil ikkje distribuere
    det vidare til nokon person eller institusjon. ")
3 ("Eg vil alltid referere skikkeleg til korpuset med namn og internettadresse
    i alt eg skriv der korpuset er brukt, både når det gjeld publiserte og upubliserte
    tekstar.)

## Availability, documentation and translations:
* Finnish orig
* Norwegian translation (basis for other Nordic languages, at least SWE and DAN)
* English?

Documentation:
* background info about the lic. model in the same languages as above
* process of getting user access (to make sure the publishers will trust us enough)
