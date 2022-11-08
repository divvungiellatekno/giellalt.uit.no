# Møte 8.11.22

Til stades: Børre Gaup, Trond Tynnøl, Trond Trosterud, Anders Lorentsen, Sjur Moshagen

Anders er programmerar i Giellatekno ut året i 100 % stilling. Kva fornuftig kan han gjera på den tida?

## Moglege oppgåver

Nettsidene til giellatekno bør over på noko anna enn Forrest, for det vert ikkje støtta lenger. Vi har tidlegare flytta ein del dokumentasjon over på GitHub Pages (Jekyll) der ein skriv sidene i markdown, det er eit alternativ. Ein bør framleis kunna parametrisere dei sidene som har oversikt over verktøy for ulike språk, og lokalisere desse på ulike grensesnittsspråk.

Ein må òg sjå smi.cgi og andre program (idate, iclock, inum) i samband med det (gtweb.uit.no/cgi-bin/smi/smi.cgi). Desse er over 20 år gamle, fungerer ikkje bra på mobiltelefon og treng sårt ei erstatning. Ein kan nytte seg av ein [API](https://divvun.github.io/divvun-api/) The Techno Creatives har laga som kan brukast til å analysere og lemmatisere, og laga ein ny front-end.

Eit tredje punkt er å få oppdatert analysatorane som smi.cgi brukar automatisk ved å bruke Tino Didriksen sine nightly-pakkar i staden for å skulle gjera det manuelt.

## smi.cgi i dag

tekstanalyse 1 = ordanalyse
tekstanalyse 2 = disambiguering
tekstanalyse 3 = dependens
orddeling
lydskrift

ordformgenerering
paradigmegenerering

x 50 språk x 5 brukargrensesnittspråk

## Konklusjon

Vi landa på å utsetja Forrest-migreringa fordi det fort kan ta lengre tid enn vi veit vi har Anders. Vi, dvs. Anders, byrjar med å laga eit alternativ til smi.cgi. Børre og Trond Tynnøl kjem gjerne med innspel.

Gangen framover

- Flytte main/gt/script over til GitHub.com/giellatekno (Børre) og låse svn
- Bytte ut cgi-bin / perl med nytt-og-fint (django, flask, javascript, ...)
- Bytte ut gtweb /opt/smi med /tino og operasjonalisere testregime
- linke til det nye fine i forrest
- vente med å bytte ut forrest
