# Lingvistmøte

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* Rutinar kring ny infra
* Referansekorpus-
* twol-testing
* lemma-testing (no i sma, snart i smj)

# Rutinar kring ny infra

Ideell arbeidsgang:
1. rediger
1. make check
1. tilbake til 1 til alt er ok
1. sjekk inn

Testdata skal vera direkte i koden (jf twolc-fila) - Sjur lagar tilsvarande rutinar for lexc.

## Almenne rutinar

* bugzilla - Inga og Maja har default-andsvaret for kvart sitt språk, men kan senda andsvaret vidare om dei vil (med stutt grunngjeving).

# Referansekorpus

Vi vil ha eit referansekorpus for kvart språk. Det skal brukast til å sjekka at at analysene held seg stabile trass i endringar i koden. Har vi eitt for nordsamisk? Ja, her: `$GTBIG/gt/sme/corp/testkorpus.txt`.

Innhald i ref-korpuset bør vera:
* heile setningar
* gjerne setnignar med feil
    - ortografiske feil
    - morfosyntaktiske feil
    - syntakiske feil
    - => mål: vi vil sikra oss at feila blir analyserte/ikkje analyserte på ein konsistent måte, slik at vi ikkje får tilfeldig/random/arbitrær variasjon i handteringa av feil
* morfologi:
    - alle bøyingsformer
    - alle stammetypar
    - mykje (produktiv) derivasjon
    - mange ulike typar samansetjingar
    - eksempelord finn de i: $GTHOME/gt/sme/testing/speller-testbed-sme.txt
* syntaks:
    - lange setningar
    - topikaliserte setnignar
    - innskotne leddsetningar
    - andre uvanlege (men grammatiske!) ordstillingar
* fonotaks: all variasjon i ...
    - stadieveksling
    - omlyd
    - vokalreduksjon
    - andre morfofonologiske prosessar
* kommentarar kan leggjast inn med # som fyrste teikn på lina. Kommentaren kjem først, på lina over setninga kommentaren gjeld. Det kan vera fleire liner med kommentarar etter kvarandre.

Mål med data i referansekorpuset: Vi vil ha størst mogleg variasjon og breidde i fonotaks, morfologi og syntaks, slik at vi testar alle delar av dei grammatiske modellane våre.

Data skal liggja her:
```
$GTHOME/newinfra/langs/$GTLANG/test/data/ref-korpus.txt
```

# twol-testing

Det finst ferdige testpar i twol-filene:

```
### €# dåeried%>%^DISIMPem
### €0 dåer0ed00em

### $# dåeried%>%^DISIMPem
### $0 dåeried00em
```

`make check` vil veldig snart testa desse para, og dermed heile tida gje oss tilbakemelding om alt er ok i twol-reglane.

# lemma-testing

No i sma, snart i smj - i dag?

* lemma skal vera felles for alle variantar av stammen!
* når ein sorterer, varsku alle fyrst slik at alle kan sjekka inn eigne endringar!

# LexC-kodingsstandard

Her er nokre kodingsideal for LexC-koden vår:
* éi lexc-oppføring pr leksem pr stamme
* færrast mogleg fortsettingsleksikon
* i bøyingsleksikona: skriv ut eksempel på korleis paradigmet skal sjå ut
* bruk mellomrom og innrykk i fleng for å gjera koden oversiktleg og lettlesen
* bruk kommentarar så mykje som mogleg for å klargjera kva som skjer i koden
* kommentarane skal skrivast med ein "nybyrjar i LexC" for auge - ein slik person skalu kunna lesa kommentarane og skjøna kva som skjer i koden.

Vi innfører "code reviews" - kodesjekk - av kvarandre, for å auka sjansane for å finna feil, og for å hjelpa kvarandre med å skriva ein meir vedlikehaldsvenleg kode.

# Oppsummering

Vi definerer kva analysene skal vera fyrst, og jobbar oss fram til at vi får det.
