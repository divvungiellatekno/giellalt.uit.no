# Arbeidsflyt, Github og Bugzilla

Saker:
- korleis fungerer kvardagen for kvar og ein?
- kva er bra og dårleg med Bugzilla?
- Github Issues som alternativ til Bugzilla

# Korleis fungerer kvardagen for kvar og ein?

Alle får ca 2 minutt til å leggja fram det som (ikkje) funkar med:
- svn (git)
- melda feil
- kommentera feilmeldingar
- kommunisera i Zulip
- fylgja automatisk bygging i Zulip

Etter at alle har sagt sitt, lagar vi ein syntese av alle meldingane, og legg den til grunn for å forbetra ting.

## Børre

- kvardagen fungerer bra
- bugzilla er vanskeleg å bla i
- github issues enklare, ein plass for alle feil
- svn funkar
- melda feil funkar fint
- kommentarar funkar fint

Men: alle e-postar frå github ser like ut, vanskeleg å sjå kva som er kva, og kven som har andsvar for ei feilmelding

## Chiara

- både Bz og GH funkar bra
- Bz er bra når det gjeld å sjå sine eigne feil (dei ein har andsvar for)
- saknar diff-e-post
- Zulip funkar ikkje så bra, folk skriv ofte på feil plass
- har dempa mange kanalar, og ser ikkje kva som skjer (men må gjera det for ikkje å få tusen meldingar)
- kan få diff på andre måtar, men e-post funkar bra

## Duommá

- allt är bra
- har bara använt github nångång, men den är nog bra

## Inga

- har ikkje brukt Bugzilla etter at ho kom tilbake frå perm, berre Github
- synest det funkar bra med Github
- funkar bra med uformell diskusjon i Zulip, meir formelle ting til Github
- synest dte funkar bra med lang-sme/develop i Zulip
- for mykje i Zulip - har dempa ein del kanalar

## Lene

- arbeider med mange språk og mange prosjekt
- jobbar ikkje full tid, har mykje anna
- bra med Bugzilla:
	- van med han
	- alle bugzilla-meldingar som gjelder meg, kjem i eiga e-postmappe
	- lett å finne oversikter over bugger på sak, og også eldre bugger som er lukket, som referanse for nye ting som gjelder samme sak
- Zulip:
	- veldig uoversiktleg fordi jeg følger flere kanaler og det blir flere hundre meldinger
	- vanskeleg å få tak i folk, det er nok flere som har mista oversikta
	- mindre info i innsjekkingsmeldingane i Zulip enn i svn-e-post: navn på fil
	- saknar svn-e-post med diff, det er viktig for vedlikehold av felles daglig arbeid
	- har mista oversikta over det daglege arbeidet
	- Det er lett i vanvare å skrive i feil kanal, spesielt for dem som ikke er der hele tida

## Linda

- svn funkar bra
- får trekonfliktar som ho ikkje fekk tidlegare
- bruker Bugzilla (eller direkte melding)
- vanskeleg å finna rett kanal i Zulip
- foretrekker kommunikasjon med få personer framfor større kanaler
- bruk av krøllalfa er bra
- vanskeleg å vita kva som er rett kategori i Bugzilla
- likar Bugzilla
- byggjemeldingane i Zulip er mest støy
- vil ikkje mista historia (tidlegare løyste feil) om vi flyttar frå Bugzilla til Github
- likar innsjekkings-e-postar

## Sara Marja

- lite erfaring med Bugzilla
- har ikkje lært seg så mykje om Github enno
- bra med Github: ein kan redigera koden direkte i Github!
- Zulip:
	- rotete
	- stressande
	- uoversiktleg
	- har full historie - bra!
- skulle gjerne hatt informasjon og opplæring i Zulip m.m. i starten

## Siri

- lite erfaring med Bugzillaå
- svn-e-post er bra!
- synest Zulip er heilt greid

## Trond

### Bz
- Negativt med Bz:
	- Bugzilla er separat frå svn, og oppfølgjinga går i rykk og napp (svært lite Bz etter 15. mai fordi det er mange andre ting å gjere)
	- Det har eit avskrekkande grensesnitt
-Positivt med Bz:
	- Det avgrensande grensesnittet er fullt av nyttige funksjonar, og vi har lært det
	- Bz har ein struktur på buggane, ein struktur på rapporteringa, og gode filter for å vise
	- Det er mogleg å melde språkuavhengige feil på ein måte som ikkje er heilt opplagt i git.
	- Bz er laga for store buggmengdar og fungerer for dei. Viss vi skal bruke Github Issues bør vi halde talet på opne buggar nede

### Utfordring: Migrering til Issues og klassifisering
- Fordelar med migrering til git Issues
	- Alt blir på ein stad, og feilmeldingene blir betre integrert i gitsystemet
	- Grensesnittet er betre, og terskelen lågare
- Ulemper med Github Issues
	- Det blir ein stor jobb å klassifisere og formattere 
	- Teksten blir __søkbar på Google__. Så her er det ein skilnad mellom Bz og Github Issues 
	- I verste fall blir det for ustrukturert

###Zulip
- Eg har alle straumane for alle språka, og det er svært nyttig.
- Status-meldingane i Zulip og i Github er svært positive (*lang-xxx/checks* og *lang-xxx/develop*)
	- Trykk på develop, og på nummeret (b9a6615). Det som manglar er filnamnet, men diffen er __mykje__ betre enn i svn.
	- Det er ikkje alltid eg ser meldingar, nei..

###Erfaringar med GitHub:
Eg bruker git, ikkje svn. Det har vore ein stor overgang og ei bratt læringskurve.
Det er mykje positivt med Git, men det meste av det positive er ikkje avhengig av å bruke git og ikkje svn. 

__Vi bruker alle Github__, sjølv om nokon av oss sjekkar inn i svn, andre i git. Nettsida for dei ulike språka er rett og slett ein nyttig innfallsvinkel, som vi bør bruke meir..

## Tommi

- har brukt både Bugzilla og Github issues
- kan bruka begge
- alle andre prosjekt bruker Github issues, lett å finna det andre jobbar med
- det same med git vs svn
- har delvis gløymt korleis ein bruker Bugzilla og svn
- Zulip har for mange meldingar

# Kva er bra og dårleg med Bugzilla?

Dvs kva er det viktig å ta med oss om/når vi flyttar til GitHub Issues

# Github Issues som alternativ til Bugzilla

Diskusjon om fordelar og ulemper.

Lene, Linda, Trond: vi bør ikkje ha eit feilmeldingssystem der diskusjonane blir søkbare med Google.


# Oppsummering

## Allmenn diskusjon

Det meste går bra

## Zulip

Bruk av grupper og krøllalfa for å få oppmerksomhet

## Bz vs. Github Issues
Den største saka: Personvern.
Svar på det kan vere eit av to (evt. tre, les nedover: 
- Diskusjonane er opne, og blir flytta til privat repositorium
    - Fordel: Det aller meste i Github Issues kan faktisk vere opent
    - Ulempe: Problemet er å vite kva som kan burde ha vorte flytta til private repositorium
- I og med at det er lett å misforstå evt. omvendt: Ha diskusjonane lukka 
	- Ein annan mogleg kanal: 
		- Ein mogleg lukka kanal: Zulip
		- Eit separat og lukka github-repositorium for buggar. Ulempe: Det er separert frå lang-abc
		- Ein skugge-repositorium for kvart språkrepositorium: lang-sme har då lang-smex der x-en står for feil
		- Som i dag men der Issues ikkje er søkbar = privat repo
		- Andre alternativ??
		- Vi held fram med Bz
- Dei som vil kan lage anonyme github-brukarkontoar, for å få ein privat 
- Jf. møtereferata: Vi ryddar i referata før vi publiserer dei, og veit at dei er 

Bør ta openheitsdiskusjon med høgare instansar på UiT, knytt til arbeidsmiljø og personalandsvar.


innsjekkingsmelding i Zulip:
- kan vi få filnamna med automatisk?
- svn-e-post for alle språk?
