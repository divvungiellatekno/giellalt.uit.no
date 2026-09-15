---
 theme: default
 title: Samisk språkteknologi og språklege data
 info: NB-presentasjon 15.9.2026, Tromsø
 class: text-left
 transition: fade
 mdc: true
---

<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Mono:wght@400;500&family=Manrope:wght@400;500;600;700;800&display=swap');

:root {
  --ink: #182225;
  --muted: #627174;
  --paper: #f5f2eb;
  --cream: #fffdf8;
  --red: #d9533f;
  --red-dark: #9f302c;
  --teal: #1f7772;
  --yellow: #e6bb56;
  --line: #d9d4c9;
}
.slidev-layout {
  background: var(--paper);
  color: var(--ink);
  font-family: 'Manrope', 'Avenir Next', sans-serif;
  padding: 3.4rem 4.6rem;
}
.slidev-layout h1, .slidev-layout h2, .slidev-layout h3 { font-weight: 800; letter-spacing: 0; }
.slidev-layout h1 { font-size: 3.3rem; line-height: 1.04; }
.slidev-layout h2 { font-size: 2.35rem; line-height: 1.08; margin-bottom: 1rem; }
.slidev-layout p, .slidev-layout li { color: var(--muted); }
.slidev-layout strong { color: var(--ink); }
.small { font-size: .78rem; color: var(--muted); }
.mono { font-family: 'DM Mono', monospace; }
.grid2 { display: grid; grid-template-columns: 1fr 1fr; gap: 3rem; align-items: center; }
.grid3 { display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; }
.rule { border-top: 2px solid var(--ink); margin: 1.2rem 0; }
.card { background: var(--cream); border: 1px solid var(--line); padding: 1.15rem; min-height: 8.4rem; }
.card h3 { font-size: 1.05rem; margin: 0 0 .5rem; }
.card p { font-size: .82rem; line-height: 1.45; margin: 0; }
.pill { display: inline-block; border: 1px solid var(--ink); border-radius: 99px; padding: .25rem .6rem; font-size: .72rem; margin: .2rem .15rem 0 0; }
.quote { font-size: 1.65rem; line-height: 1.25; font-weight: 700; color: var(--ink); border-left: 5px solid var(--red); padding-left: 1.1rem; }
.note { font-size: .68rem; color: var(--muted); }
svg { max-width: 100%; }
</style>

## Samisk språkteknologi og språklege data

Møte med Nasjonalbiblioteket 15.9.2026

> hva er deres oppdrag, hvilke behov har dere, hva slags modeller jobber dere med (enten det er utvikling eller bruk), hvilke språk jobber dere med, hva er deres ønsker for samarbeid.

----

## Samfunnsoppdrag

Frå tildelingsbrevet:

> ### 1. Divvuns oppgaver
> Bevilgningen skal benyttes slik at Divvun kan tilby moderne språkteknologiske løsninger for det samiske samfunnet, og dermed bidra til at samisk språk skal kunne overleve som bruksspråk innenfor flest mulige samfunnsområder.

Tolkinga vår, ut frå budsjett og tilgjengelege ressursar:

1. Nord-, lule- og sørsamisk
1. Andre samiske språk
1. Andre urfolks- og minoritetsspråk

Det vi lagar

- alle slags verktøy og tenester, frå tastatur til talegjenkjenning
- fleire tenester tilgjengeleg over nettbaserte API-ar, som andre kan byggja vidare på

---

## "Vi" = Divvun

- 3 lingvistar og morsmålstalarar (nord-, lule-, sørsamisk)
- 1 ekspert på grammatisk og semantisk analyse, grammatikkontroll
- 1 ekspert på taleteknologi (TTS + ASR)
- 1 fst-ekspert, programmerar
- 1 programmerar
- 1 gruppeleiar

I tillegg: Giellatekno og senter for samisk leksikografi

----

## Oversikt over språk og verktøy (Divvun & Giellatekno)

| Verktøy | Nordsamisk | Lulesamisk | Sørsamisk | Enaresamisk | Skoltesamisk |
| ------- |:----------:|:----------:|:---------:|:-----------:|:------------:|
| Datamaskintastatur (4 OS)| ✅ | ✅ |   ✅    |     ✅      |      ✅      |
| Mobiltastatur      (2 OS)| ✅ | ✅ |   ✅    |     ✅      |      ✅      |
| Stavekontroll      | ✅ |   ✅   |     ✅    |     ✅      |      ✅      |
| Grammatikkontroll  | ✅ |   ✅   |     ✅    |     ✅      |      ⚠️      |
| Orddeling          | ✅ |   ✅   |     ✅    |     ✅      |      🚫      |
| Tekstanalyse m. dep| ✅ |   ✅   |     ✅    |     ✅      |      ✅      |

---

## Oversikt over språk og verktøy (Divvun & Giellatekno) (framh.)

| Verktøy | Nordsamisk | Lulesamisk | Sørsamisk | Enaresamisk | Skoltesamisk |
| ------- |:----------:|:----------:|:---------:|:-----------:|:------------:|
| TTS-tekstpros.     | ✅ |   ✅   |     ✅    |     🚫      |      🚫      |
| E-ordbok, terminologi|✅|   ✅   |     ✅    |     ✅      |      ✅      |
| Maskinomsetjing (H)| ✅ |   ✅   |     ✅    |     ✅      |      🚫      |
| Språklæring        | ✅ |   🚫   |     ✅    |     ✅      |      🚫      |
| Talesyntese (ML)   | ✅ |   ✅   |     ✅    |     🚫      |      🚫      |
| ASR-eksperiment (ML)|✅ |   ✅   |     🚫    |     🚫      |      🚫      |

---

## Nettbaserte tenester

Dvs tilgjengeleg med nett-API.

| Verktøy | Nordsamisk | Lulesamisk | Sørsamisk | Enaresamisk | Skoltesamisk |
| ------- |:----------:|:----------:|:---------:|:-----------:|:------------:|
| Korpus			  |✅|   ✅    |    ✅     |     ✅      |      ✅      |
| Stavekontroll		  |✅|   ✅    |    ✅     |     ✅      |      ✅      |
| Grammatikkontroll	  |✅|   ✅    |    ✅     |     ✅      |      ⚠️      |
| TTS				  |✅|   ✅    |    ✅     |     🚫      |      🚫      |
| Ordboksinnhald/term.|✅|   ✅    |    ✅     |     ✅      |      ✅      |
| Maskinomsetjing	  |✅|   ✅    |    ✅     |     ✅      |      🚫      |

Vi vil tilby ASR òg så snart ASR-en er god nok.

---

## Data er alltid ein flaskehals

Vi treng rådata, både tekst og tale:

- Tale: ASR (og seinare: dialogsystem)
- Tekst:
	- forbetra dekningsgrad og dermed alle verktøy
	- betre korpus til samfunnet (gje tilbake til samfunnet det forskarar tidlegare har samla inn, og det samfunnet har produsert)
	- for å testa alle verktøy mot
	- fleirspråklege/parallelle tekstar ekstra verdefulle

---

## To slags modellar

### ML-modellar

- TTS: vi byggjer sjølve
- ASR: i samarbeid med NB og Aalto
- generative tekstmodellar?

### Kunnskapsbaserte modellar

- Morfologisk og syntaktisk analyse og generering. Grunnlag for all tekstprosessering.

### Framtida er hybrid?

- jo mindre ressursar, jo meir kunnskapsbaserte modellar treng ein
- betre ML-modellar dersom ein kombinerer med kunnskapsbaserte modellar

---
layout: two-cols-header
---

## Språk vi arbeider med

::left::

- alle samiske språk
- urfolks- og minoritetsspråk:
	- i Norden
	- Canada
	- Uralske språk i Russland (når det blir mogleg igjen)
	- andre land og språk (sjå kart)
- ca 160 språk i infrastrukturen vår

::right::

![Kart over alle språk](images/kart-alle-sprak.png)

---

## Divvun + Giellatekno + NB

Tekst:
- vi treng all tekst vi kan få (jf over)
- vi kan gjera NB-tekst rikare gjennom analyse
	- for Korp
	- for framtidig modelltrening
- NB kan gje samisk tekst tilbake til det samiske samfunnet gjennom Korp, utan å bryta opphavsrettslover (berre ei setning som kontekst)

Tale:
- ASR-trening treng all samisk tale som finst
- NB er arkiv-instans for NRK
- NB har no ei kompensasjonsordning for nyheitsmateriale
- TTS-trening på NB sine maskiner (eller Sigma2 via NB-samarbeid)
- Vi (dvs Katri) har svært gode TTS-kunnskapar, til nytte for NB

---

## Konkret samarbeid

- samarbeidsavtale som gjer datadeling lettare
- tilgang til NB sine maskiner (jf førre punkt)
- forsking knytt til hybride metodar for ASR, OCR, generative språkmodellar for språk med lite data
- nyheitsmateriale er allereie dekt av frikjøpet til regjeringa, lat oss starta med det:
	- tale: ca 1500 timar med Ođđasat sidan starten i 2001
	- tekst: historisk materiale frå forgjengarane til Ávvir (frå 2008): Min Áigi (frå 1993) og Áššu (òg frå 1993)

---
layout: center
---

## Det viktigaste først

Samarbeid, ikkje konkurranse


Giitu! Takk!

