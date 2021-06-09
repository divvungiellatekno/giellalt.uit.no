Lingvistmøte

Saker:
* duplikat i smi-leksikonet
* Inga: ord av Salami-typen
* da o-names to each language? Rambo9, or maybe tværtom?
* Nordplus-arbeid for Maja og Thomas

# duplikat i smi-leksikonet

Kommando for å finna duplikat:

```
cat smi-propernouns.lexc | tail +13 | sort | uniq -d | less
```

Nokre døme på dette er :

```
Skogheim:Skog^heim9 HEIM-plc ;
Skogheim:Skog^heim9 HEIM-sur ;

Tanzania ACCRA-LOAN-plc ;
Tanzania ACCRA-plc ;

Joppe ACCRA-plc ;
Joppe BETFAGE-plc ;
Joppe ACCRA-sur ;
```

## plc vs sur
"plc" (stadnamn) kan alltid brukast som slektsnamn ("sur") (men ikkje omvendt).
Difor leksikaliserer vi berre plc i slike par, og ikkje sur. Det vil ta vekk ein
del duplikat.

I smj har ikkje plc hatt fleirtalsbøying (mens sur-namn har hatt det), men det
går vi bort frå, og let alle plc-namn (og implisitt sur-namn) frå no av ha
fleirtalsbøying.

## LOAN eller ikkje?

LOAN er ikkje-samiske namn som kan bli brukt i ein samisk tekst (og som typisk
har ei samisk alternativ form), **men som vi ikkje vil ha i bøygde former av**,
som t.d. Kautokeino (skal berre aksepterast i grunnform). I dømet Tanzania er det ein feil, og ACCRA-LOAN-oppføringa skal slettast.

LOAN = berre nominativ eintal i normativ bruk (alle andre former er Sub-merka).

## ACCRA vs BETFAGE

BETFAGE er spesifikk for lulesamisk, og er identisk med ACCRA for dei andre
samiske språka. BETFAGE skal brukast ved e-finale ACCRA-ord.

I sme og sma kan BETFAGE peika direkte til ACCRA, og alt skal fungera som det har gjort tidlegare. Då får vi berre ei oppføring i smi-leksikonet:

```
Joppe BETFAGE-plc ;
```

## Finsk -mäki: PIPPI eller ACCRA?

```
+--------------+------------+-------------+
|  Siste stav.  | trykksterk | trykksvak   |
+--------------+------------+-------------+
|  final X+i/j  | DUBAI (V+j)| PIPPI (C+i) |
+--------------+------------+-------------+
|  andre fin. V | NYSTØ*     | ACCRA       |
+--------------+------------+-------------+
```
* Også i som ikke har lang vokal foran seg slik som i DUBAI.

For finske namn på -i lagar vi eit eige leksikon MÄKI, som peikar til PIPPI i
smj, og til ACCRA i sma og sme. Dette gjeld namn som sluttar på -mäki, -järvi,
-kivi, osb.

# Inga: ord av Salami-typen

323 namn frå smj og 122 namn frå sma som skal over i smi og der leksikonet er uklårt:

```
Unkuri ACCRA-sur ;
Urumchi ACCRA-plc ;
Ussuri ACCRA-plc ;
Vakkari ACCRA-sur ;
Vakkuri ACCRA-sur ;
Valeri ACCRA-mal ;
Valtari ACCRA-sur ;
Varanasi ACCRA-plc ;
Vasankari ACCRA-sur ;
Verneri ACCRA-mal ;
Vespucci ACCRA-org ;
Viikari ACCRA-sur ;
Viiperi ACCRA-sur ;
Villani ACCRA-sur ;
Vimpari ACCRA-sur ;
Vinnari ACCRA-sur ;
Viskari ACCRA-sur ;

Ervasti:Ervasti VNAME_ODD-sur ;
```

Problemet er at vi ikkje utan vidare eintydig kan plassera trykket, og dermed stavingsstrukturen, som bestemmer leksikonet / bøyinga:

```
cv-cv-^cv
cv^-cv-cv
```

ACCRA i sma blir berre brukt for likestava namn, mens det i sme blir brukt for
ulikestava òg.

Fleire døme:
```
Ervasti PIPPI-sur ; - for smj
Ervasti ACRRA-sur ; - for sma
Vimpari NYSTØ-sur ; 
Gemini ACCRA-mal ;
Caspari ACCRA-sur ;
```

Desse kan kanskje gå som MÄKI, og då vil skiljet mellom sma og smj.

Barjona ACCRA-sur ;

# da o-names to each language?

dtex. Rambo9.

My first thought was to put them in language-specific file, but it is better to
put them in smi-file and make rule for south-sami as well that o9:o

Sjur agree.

Det er mange (norske) o-namn i smj-leksikonet, dei bør flyttast i lag med sme.
Thomas gjer det.

# Nordplus-arbeid for Maja og Thomas

Dei er med på møtet i dag.
