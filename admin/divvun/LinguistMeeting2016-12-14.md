# Samansetjingsmøte 14.12.

Til stades: Duommá, Lene, Sjur, Trond

## Saksliste

* Prosessen med Cmp framover
* Samansetjing i analyse vs. leksikalisering
* Referat og neste møte

## Prosessen med Cmp framover

Vi treng betre rutiner for prosessen:

* fordele kven som sjekkar inn referatet etter kvart møte
* spesifisere tidspunkt for neste møte i slutten av referatet
* spesifisere klåre TODO-punkt til neste møte, og følgje opp

## Taggmessig spesifisering av samansetjing for Cmp/Sh

I mange tilfelle er den samansette forma underspesifisert, `+Cmp/Sh`
der forleddet er forkorta, eller ikkje skil mellom genitiv og nominativ.

**Konklusjon:** dette løses i transferfiler i MT

Framleis opent : Skilje mellom kortformer i lånord og kortformer i samiske ord.
Dette skil vi ikkje mellom no, det blir tema på eit seinare møte.

## Samansetjing i analyse vs. leksikalisering

Se [Bz 2296](http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=2296)

Spørsmålet er om vi vil ha som mål å alltid ha ein representasjon
av samansetjingar som viser den interne strukturen til ordet,
eller om vi ikkje vil ha det.

```
maŋisboahtti	maŋisboahtti+N+NomAg+Sg+Nom
iešdovdu	iešdovdu+N+Sg+Nom
adoptiivaváhnen	adoptiivaváhnen+N+Sg+Nom
```

Se [Bz 2280](http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=2280) om egne fortsettelsesleksikoner som ikke gir sammensetning pga speller reasons

Filer av interesse:

* [corpcmp_notcmpanalysis](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/morphology/incoming/corpcmp_notcmpanalysis)
* [lexccmp_notcmpanalysis](https://gtsvn.uit.no/langtech/trunk/langs/sme/src/morphology/incoming/lexccmp_notcmpanalysis)

Mogleg strategi (til vurdering)

* Vi vil vere i stand til å analysere desse orda
* Problematiske ord for stavekontroll gjev vi tagg så dei ikkje blir med i speller
* Viss ord er problematiske å analysere dynamisk i alle samanhengar kan vi leksikalisere den grammatiske analysen

###  TILTAK

1. Opne opp stiar for samansetjingar som i dag er sperra (men merke for `Use/-Spell` ) (**Duommá**)
1. Vurdere ulemper ved dette for korpusanalyse (**Lene, Trond**)
1. Leksikalisere detaljert analyse der det er aktuelt
1. Begynne å lage oversikt over sammensetningstyper og tagger på den nye Cmp-sida (**Lene**)

## Referat og neste møte

Trond sjekkar inn referat etter lunsj

Neste samansetjingsmøte: **11.1. kl. 10.00**

Saker til neste møte:

* Full analyse av samansetjingar
    - Vi vurderer kva vi gjer med den delen av dei 4% som står att etter at
   Duommá har opna for meir dynamisk samansetjing, og etter at Lene/Trond
   har sett på samansetjingsmaterialet (4%) på nytt

Saker til seinare møte

* Samansetjingar med substantiv vs. adjektiv
    - Jf. bug [2303](http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=2303).
* Andre lingvistiske saker
* Harmonisering språk til språk
* Skilje mellom kortformer i lånord og kortformer i samiske ord
