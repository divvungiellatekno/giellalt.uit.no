# Møte om neste versjon av InDesign-verktya

Saksliste
* status for Hunspell-konverteringa
* oppgåver for å laga automatisk orddeling

# Hunspell-konverteringa

Noverande system:
* støttar seg på PLX-kodane for samansetjingsreguleringa
* bruker PLX-transducer + morfemgrensemerke

Ny Hunspell-versjon:
* ingen samansetjingar
* bør basera seg heilt på ei rein ordliste med morfemgrenser, ingen PLX-kodar
* noverande PLX-konvertering er heilt transducer-basert (kanskje med unnatak av sifferdelen)
* vi treng berre ordliste med morfemgrense, ingen andre ting

Døme på inndeling i ulike Hunspell-leksikon:
```
viessu
viesu
viesu>ide
viesu>iguin
sdfaf>asdfaf>asfdasdf>adsfasdf>dafaf>in
sdfaf>asdfaf>asfdasdf>adsfasdf>dafaf>n
sdfaf>asdfaf>asfdasdf>adsfasdf>dafaf>iguin
sdfaf>asdfaf>asfdasdf>adsfasdf>dafaf>iguingo
```

Algoritme:
* Del ved fyrste og siste morfemgrense, ignorer grense framfor klitika
 (=dei går til 0 allereie i transduceren).

**OPPGÅVER:**
* oppdater make-fila til å ta med morfemgrense ved stavekontrollkompilering for PLX og Hunspell - **gjort**
* morfem-grense til 0 før den ekte PLX-prosesseringa - **gjort**
* skriv ut stavekontrolltransduser som ordliste før Hunspell-prosessering - **gjort**

# Automatisk orddeling

* laga orddelingstransduser utan abbr, acro, siffer og hard bindestrek - **gjort**
* skriv ut ordliste med alle orddelingspunkt, og ordgrense for samansette ord - **gjort**
* kompilera OPatGen, fiksa buggar - **gjort**
* integrera OPatGen i byggjesystema våre - **gjort** med `patgen`
* postprosessera for OOo - **gjort** med `patgen`

Sjå lenker [på eiga side](../NyeVerktyForInDesignCS55.html).

# Installering

Installeringa er ganske enkel:
* kopier filene til ei mappe definert av Adobe
* legg til språkkodar i ei plist-fil

Den største utfordringa blir å leggja til språkkodane i plist-fila. På Mac-en finst det eit program `/usr/libexec/PlistBuddy` som kan brukast til å manipulera plist-filer direkte.

For Windows finst det ingen slike kommandolineprogram som ein kan lita på finst installert, men i og med at plist-filer er xml-filer, kan ein bruka ein [xml-plugg til NSIS](http://nsis.sourceforge.net/XML_plug-in) for å manipulera den råe xml-en, og på det viset gjera det som må gjerast.
