# Arbeid framover for Tommi

På gang:
- dokumentasjon & github (markdown)
- ML i lag med Linda
- TTS-server

Nytt:
- tts-prosjektet for smj
- stavekontroll for LibreOffice

# Fyrsteprioritet: stavekontroll for LibreOffice
- endringar i API for LO 7? Koden vår fungerer i alle fall ikkje
- divvunspell istf hfst-ospell+voikko
- vi bør fjerna avhengigheita til Voikko, vi treng han ikkje lenger
- Oppdatera CI/CD slik at LO-komponenten blir installert og ser alle installerte stavekontrollar

# TTS for smj

- trebandsproblemet:

Vi vil kunna analysera eit ord, og samtidig ta vare på representasjonen i møtet mellom twolc/lexc. Pr i dag forsvinn denne ved compose&intersect. Informasjonen er viktig t.d. for å kunna handtera skilnader i uttale mellom G2 og G3 der denne skilnaden ikkje blir uttrykt i ortografien (det er same problem i sme). Informasjonen finst i lexc, og ved å laga ein kvasitrebands-fst har vi den informasjonen vi treng for den vidare prosesseringa.

Forslag til pseudokode for `hfst-pmatch` som illustrerer kva vi vil ha (detaljane kan sjølvsagt bli endra):

```
define ThreeTape(X) [Lookup(Xl) .o.  LookUp(Xu)];

echo test | up ThreeTape:

"<test>"
"test" N Analyse <tape1:testx1>
```

hfst-ospell (analysemodus) som inspirasjon :) - den analyserande stavekontrollen er i praksis akkurat det vi vil ha:
- feilskrive ord inn = band (tape) 1
- retteforslag = band 2
- analyse for retteforslaga = band 3

Sjå òg hfst-ospell-varianten brukt i stavekontrollen: `divvun-cgspell` (del av https://github.com/divvun/libdivvun)

# dokumentasjon, github & markdown

- vi er meir eller mindre klare for å flytta til MarkDown
- Sjur gjer det meste i januar, med litt hjelp frå Tommi (og Børre?)

# TTS-server

No:
- kan senda tekst inn og få wav-fil tilbake

Manglar:
- web-api

Forslag basert på eksisterande API-ar:
- `/{function}/{languageCode}`
- `/tts/smj/`
- `/tts/smj/plaintext/ - ?`
- `/tts/smj/html/ - ?`
