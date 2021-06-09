# Lingvistmøte

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* proper nouns
* normeringsorgan
* adjektivkontlex i SMA

# proper nouns

## For SMJ

Det er lite rusk der no mot tidlegare, og vi slår på lemmatesting for alle propernouns no (tidlegare har vi berre testa dei SMJ-spesifikke namna). 14 feil i lemma-testen for SMJ, som Inga ser på.

## Analyse av samansette ord

Desse to orda får ulik analyse, sjølv om dei er av same type:
```
motorjuogos
motorjuogos	motåvrrå+N+SgNomCmp+Cmp#juogos+N+Sg+Nom
motorjuogos	motåvrrå+N+SgNomCmp+Cmp#juohko+N+Pl+Nom+PxSg3
motorjuogos	motåvrrå+N+SgNomCmp+Cmp#juohko+N+Sg+Ela
motorjuogos	motåvrrå+N+SgNomCmp+Cmp#juohko+N+Sg+Acc+PxSg3
motorjuogos	motåvrrå+N+SgNomCmp+Cmp#juohko+N+Sg+Gen+PxSg3

bassengjuogos
bassengjuogos	basseng+N+Cmp#juogos+N+Sg+Nom
bassengjuogos	basseng+N+Cmp#juohko+N+Pl+Nom+PxSg3
bassengjuogos	basseng+N+Cmp#juohko+N+Sg+Ela
bassengjuogos	basseng+N+Cmp#juohko+N+Sg+Acc+PxSg3
bassengjuogos	basseng+N+Cmp#juohko+N+Sg+Gen+PxSg3
```

*motorjuogos* er ikkje ein nominativsamansetjing, og *bassengjuogos* manglar tagg for samansetjingstype.

Spørsmål: kva slags tag vil vi ha for denne typen samansetjing med stammeformen av låneord? `+ShCmp` er ikkje bra, fordi denne taggen blir brukt for samiske kortformer brukt i samansetjingar, og dekkjer eit anna fenomen. Kva med `+CitCmp`, dvs ei samansetjing der ein bruker sitatformen av eit låneord?

## Skal SMA bruka smi-lista?

SMI-lista inneheld 29 000 ord, medan *heile* SMA-lista er på 27 000 oppføringar, og mange av desse er sjølvsagt SMA-spesifikke. Det er altså ein god grunn til å ta i bruk SMI-lista for SMA.

**VEDTAK:** vi tek i bruk SMI-lista for SMA.

**GJERELISTE:**
* flytta alle smi-namn i sma over til smi (dersom dei ikkje finst i smi frå før)
  (**Maja, Thomas**)
* laga fortsetjingsleksikon for smi-namna i sma (**Maja, Thomas**)
* laga testar for smi-namn (**Maja, Thomas**)

# normeringsorgan

SGL/SGM er lagt ned frå 31.12.2011, funksjonane blir teke over av eit nordisk samisk språksenter som startar 1.1.2013.

# adjektivkontlex i SMA

## Leksikon som Maja vil jobba med:

* ies/an - slå sammen - NOCOMP
* oeh/an - NOCOMP-
* ehke -som eget lemma - slittet lexicon ies_ehke - til 2
* ehts/ehth
    - NOCOMP -nomen
    - COMP-deverbal

## Omlyd i adjektiv

Det er kring 38 leksikon som dekkjer adjektiv med omlyd. Dei er no koda slik at omlyden blir behandla direkte i LexC-koden, med eitt leksikon pr ord. Dette er ikkje den beste måten å organisera koden på: omlyd bør behandlast for seg (med tonivåreglar), i alle fall når det gjeld såpass mange ord. Deretter kan adjektiva dei gjeld behandlast som alle andre adjektiv når det gjeld bøying.

**GJERELISTE:**
1. retta yaml-testane for verb (**Maja**)
1. retta opp i dei fire adjektiva som no ikkje passerer yaml-testane (**Maja**)
1. laga yaml-testar for adjektiva med omlyd (**Maja**)
1. laga omlydsreglar for adjektiva (**Maja**)
1. skriva om leksikona for omlydsadjektiva til å bruka twol-reglane for å
  handtera omlyden (**Maja**)
