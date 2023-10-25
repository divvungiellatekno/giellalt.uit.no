# 30-6-2021 - samarbeid Divvun & Giellatekno om programmering, teknisk drift

Til stades: Børre, Chiara, Sjur, Trond

Saker:

- Bakgrunn
- Kva kan vi samarbeida om?
- Ordbøker
- Korpus
- Serverdrift og -oppsett
- Anna?

## Bakgrunn

Chiara orienterte. Børre har tenkt i liknande baner.

## Kva kan vi samarbeida om?

Diskusjon.

## Ordbøker

Jf tidlegare møte og avtale for juli.

## Korpus

- flytta all korpuskoden til Github:
    - CorpusTools
    - våre eigne endringar av Korp
- Språklabben sine [Korp-repoar i Github](https://github.com/spraakbanken?q=korp&type=&language=&sort=)
    - vår Korp er alt ein klone av Gøteborg sitt github-repo

Diskusjon:
- Børre: ville vera naturleg at alt etter CorpusTools (fram til Korp) òg blir integrert i CorpusTools (="Børre sin pipeline").
- Chiara: har mange python-skript etter CorpusTools (+ eitt xslt-skript)
    - kor ligg desse skripta? Nokre i maskina til Chiara, dei fleste i `$GTHOME/apps/korp/` i svn
    - vil gjerne sjekka inn "rein" kode, og så blir ting liggjande
- Trond: vi kunne gjera som i Gøteborg  og Helsingfors: eitt grensesnitt med mange språk, heller enn tre grensesnitt (som no) med færre språk pr side.

Forslag:
- Chiara flyttar all Korp-prosesseringskode til CorpusTools
- CorpusTools flyttar til GitHub - men kor? i `github.com/giellatekno/`

## Serverdrift og -oppsett

- Børre: Docker
- Chiara: vi har ingen sys-admin, og IT-avdelinga hjelper oss ikkje. Og "vi" er berre ein.
- Sjur: for å få eit enklare liv bør vi bruka Docker. Børre bør setja seg inn i det etter kvart.

## Anna?

Konkret arbeid framover:
- ordbøker i juli
- Chiara og Børre har mandat til å utvikla koden slik dei synest er mest formålstjenlig
- alle nye nettenester skal gå via api-giellalt.uit.no (blir endra til: api.giellalt.org)
