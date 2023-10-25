# Plan for common conversion from LexC to speller engines of Aspell type

Three different speller engines

* Polderland
* Aspell
* OOo speller => HunSpell

Common features and properties:

* not lexc-compatible => they require converting from lexc to native/whatever
* basically list-based, with compounding and morphology (Aspell has no compounding)
* => similar expressive power
* takes surface forms as input

Because of the similarities:

* one conversion "engine"/script
* several output formats

## Output format

varies according to engine, but is basically a full-form word list that can be
processed for compresssion. In Aspell, this processing is called `munch`-ing.
For Polderland, we have no name yet, but they have a similar processing with the
same goal.

## Information to be added:

* "inflection" tags: munching of fullform lists
* wordform frequency: extracted and added during compilation, can use full-form lists
* compounding: tags as comments in the LexC format
* style: tags as comments in the LexC format

Pseudocode:

1. closed POS: create a transducer containing all and only the rest, and xfst:print;
  convert to desired format
1. NAVAdv: For each word:
    1. read one line from the lexicon files, including Comp and Style comments
    1. generate full paradigm, and all compounding forms
    1. filter the resulting word form list against any Comp and Style restrictions
    1. add the Comp and Style restrictions to the relative wordforms (all for Style, 5 for Comp)
    1. output in the desired format

Implementation points to consider:
* It should be easy to add new output formats
* the transducer(s) used for the conversion should be wrapped into a server
* the same server setup could be used for the CGI-BIN scripts

WHO??? Candidates: Saara, Tomi

The following output was generated to try out different strategies for
generating the compounding stem.

```
hum-tf4-ans157:~ trond$ lookup -flags mbTT -utf8 gt/sme/bin/isme.fst
0%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>100%
eadni+N+SgNomCmp#giella+N+Sg+Nom
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadnegiella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadnegiella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadnegiella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadnegiella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadnegiella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadnegiella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadne-giella
eadni+N+SgNomCmp#giella+N+Sg+Nom        eadne-giella

eadni+N+SgNomCmp
eadni+N+SgNomCmp        eadni+N+SgNomCmp        +?

Trond's version:

sealgi+N+SgCmp#eadni+N+Sg+Nom
sealgi+N+SgCmp#eadni+N+Sg+Nom   sealeadni
sealgi+N+SgCmp#eadni+N+Sg+Nom   seal-eadni
sealgi+N+SgCmp#eadni+N+Sg+Nom   sealgeadni
sealgi+N+SgCmp#eadni+N+Sg+Nom   sealg-eadni
sealgi+N+SgCmp#eadni+N+Sg+Nom   sealggeadni
sealgi+N+SgCmp#eadni+N+Sg+Nom   sealgg-eadni

sealgi+N+SgNomCmp#eadni+N+Sg+Nom
sealgi+N+SgNomCmp#eadni+N+Sg+Nom        sealgeeadni
sealgi+N+SgNomCmp#eadni+N+Sg+Nom        sealge-eadni
sealgi+N+SgNomCmp#eadni+N+Sg+Nom        sealgieadni    <==== ?
sealgi+N+SgNomCmp#eadni+N+Sg+Nom        sealgi-eadni   <==== ?

sealgi+N+SgGenCmp#eadni+N+Sg+Nom
sealgi+N+SgGenCmp#eadni+N+Sg+Nom        sealggeeadni
sealgi+N+SgGenCmp#eadni+N+Sg+Nom        sealgge-eadni
sealgi+N+SgGenCmp#eadni+N+Sg+Nom        sealggieadni
sealgi+N+SgGenCmp#eadni+N+Sg+Nom        sealggi-eadni

sealgi+N+PlGenCmp#eadni+N+Sg+Nom
sealgi+N+PlGenCmp#eadni+N+Sg+Nom        selggiideadni
sealgi+N+PlGenCmp#eadni+N+Sg+Nom        selggiid-eadni

dušši+N+SgNomCmp#eadni+N+Sg+Nom
dušši+N+SgNomCmp#eadni+N+Sg+Nom duššeadni
dušši+N+SgNomCmp#eadni+N+Sg+Nom dušši-eadni
dušši+N+SgNomCmp#eadni+N+Sg+Nom duššieadni
```
