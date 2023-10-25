Samisk SMS?
===========

Samisk ungdom etterlyser de samiske bokstavene på mobiltelefonen.

\- Vi krever at det skjer noe snart. Vi begynner å miste språket vårt.
Det sier leder Kare-Elle Partapuoli i ungdomsutvalget til Norske Samers
Riksforbund.

Statssekretær i Moderniserings-departementet Eirik Lae Solberg sier at
de nå oppfordrer mobiltelefonselskapene å sette inn samisk i
mobiltelefonene.

Kva som skal til
================

Tekniske føresetnader
---------------------

Dei tekniske føresetnadene for å få samisk SMS er allereie til stades.

Alle mobiltelefonar opererer med Unicode som intern kodingsstandard for
bokstavar. Det vil seie at det allereie finst reserverte talkodar ikkje
berre for nordsamisk, men for skolte- og kildesamisk, urnordiske runer,
egyptiske hieroglyfar, inuktitut-stavingsskrift, og cherokee (jf.
http://www.unicode.org/charts/). Ein annan ting er så om dei har
bokstavar til dei. Nokia har t.d. relativt smale språkval for kvar
telefon, slik at viss du kjøper ein telefon i Noreg vil du ha andre
språkfunksjonar enn om du kjøper ein telefon i Finland, Tyskland eller
Kina. Andre produsentar (eg har prøvd ein Siemens A55) puttar flest
mogleg språk inn i same telefon, eg har sjølv skrive på russisk på ein
slik telefon, og sendt meldinga til ein Nokia, som kunne lese russisk,
men ikkje skrive det.

For å skrive samisk må to ting vere oppfylt. Først må dei samiske
bokstavane vere med i inntastingsfunksjonen, slik at du kan skrive š
viss du trykker på tast nummer 7, á og č på 2, đ på 3, ŋ på 6, ŧ på 8,
og ž på 9. Når dette er på plass er det berre å skrive, på den sakte
måten. Viss du får tak i ein Siemens kan du allereie skrive dei fleste
bokstavane (hmm, eg ringte Siemens-eigaren, og ho fekk ikkje til å
skrive inn č, š, ž heller, så det trengst litt næreare gransking her),
får du tak i ein Nokia som er laga for kroatisk, kan du skrive alle
andre samiske bokstavar enn t og ŋ allereie i dag (at du kan det er eg
overtydd om, eg trur til og med eg har sett det).

Den andre tingen du vil ha oppfylt er å kunne skrive effektivt, i
"/=abc-modus", og ikkje berre i "abc-modus", for å seie det slik, eller
med ordboksfunksjonen påslått. Det som ligg bak denne modusen er den
såkalla T9-teknologien, jf. http://www.t9.com/. (T9 har tydelegvis
monopol på denne teknologien, dei har alle telefonprodusentane som
kundar, sjølv om teknologien er enkel nok). Ideen bak er at kvar ordform
får ein talkode, slik: ideen = 43336 bak = 225 er = 37, at = 28, osb.
Men kvar talkode kan vere ulike ord, t.d. er 28 = at, av, åt, bu, au,
cu, bv, æt, bt. Når vi trykker på \*-tasten blar vi oss gjennom desse
framlegga. Dei kjem sjølvsagt ikkje i tilfeldig rekkjefølgje, men i
frekvensrekkjefølgje, med dei vanlegaste orda først.

For å lage ei samisk T9-løysing, trengst det altså ei liste over samiske
ordformer, ordna etter frekvens. Deretter har folka i T9.com ferdige
algoritmer for å lage ein T9-funksjon. Desse algoritmene er ikkje
kompliserte, det å lage dei tilsvarer omtrent ein passande
semesteroppgåve på eit treårsstudium i programmering (litt vel vanskeleg
for meg, men lett nok for ein programmerar). Problemet er altså meir
politisk. No er det slik at mobiltelefonar blir selde med programvare
ferdigmontert. Det er berre tilfeldig at vi ikkje kan kjøpe programvare
og telefon kvar for seg, slik vi gjer det med (andre) datamaskiner. Med
eit slikt system kunne vi ha kjøpt den telefonmodellen vi ville ha, og
deretter berre installere den samiske T9-teknologien som entusiastiske
open-kjeldekode-hackarar hadde laga. No er det som kjent ikkje slik, og
dermed inneber eit samisk sms-prosjekt forhandlingar med
mobiltelefonprodusentane. Sannsynlegvis vil det vere lettare viss vi kan
seie til dei at "utviklingskostnadene er allereie ordna", dvs. det kan
vere ein ide å diskutere med T9.com først.
