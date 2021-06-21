# Møte om feiloppmerking i korpus, 21.6.2021

Til stede:Inga, Linda, Thomas, Sjur

Korleis kan ein skilja på foreign (∞) og leksikalsk (€) feil?

## {wrong}∞{error classification}
∞ = framand tekst
- der man ikkje har noen forslag
- når vi ikkje ønsker et forslag, f.eks. når det er sitat
- originalteksten kan bli ståande eller bli fjerna, alt etter behov

## {ord}€{foreign|}
€ = leksikalske feil:
- når man bruker norske ord med samiske bøyninger

## Problematiske tilfelle å passe på
- et sitat?
- navn som kan bestå av flere ord - f.eks. Feelings-álbuma.
- har vi ordan i leksikon, og blir dem merka som feil eller 
- vi må være konsekvent i feiloppmerking og leksikon

Inga er veldig fornøyd med systemet hun bruker for SMJ.

konsekvenser:
snakke med Børre om at det fungerer - test

Viktig for:
- grammatikkontroll(testing)
- TTS
- generell korpusprosessering

## Lulesamiske eksempler

{% raw %}
### ∞
- `{Wihoo}∞{sla}!`
- `IRF= {Institutet för Rymdfysik}∞{swe}. -- burde legges inn i navndatabasen`
- `Divtasvuona suohkan - {Tysfjord kommune}∞{nor} `
- `ja uddni gæhttjalijma duokkár {Space Ball’av}∞{eng}.`
- `gåvvå váldedum: {weheartit.com}∞{url}`
- `Dan namma lij "{sjöhus}∞{swe}",`
- `rumáj ittjij dåbddu} nåv "{ready}∞{eng}" {gilppostit}€{infl,inf-sup|gilputjit}.`
- `{Åh}∞{sla}`
- `{Puss}∞{swe}`
- `{Shit}∞{eng} man {kult}∞{nor}!`
- `Valla dijstagá lij máj "{fettisdagen}∞{swe}"`
- `Dánna hæhttup javllat {Sir, Mr, Miss}∞{eng} jali {Mrs}∞{eng}.`
- `{Buörrie urra jáhpie}∞{foreign}`
- `Lågå aj: {Avviser plankritikk}∞{nor}`
- `{Åjllastit}∞{ume}, mij la suohtastallat {ubmesámegiellaj}${conc,bm-bbm,fin,0-m|ubbmemsámegiellaj}`

### €
- `Dán bále lidjiv {utbildningin}€{foreign,swe|åhpadusán}.`
- `{skate}€{foreign,eng|salostam} `
- `{{Sjáddiv}${vowc,á-a|Sjaddiv}}¥{redun|} {inspirert}€{foreign,swe|Måvtåstuvviv} `
- `Vuostasj bále {muv}€{w,pers-refl|ietjam} iellemin gå iv diede majt dahkat gå tjaktja boahtá.`
- `{museumin}€{foreign,swe|dávvervuorkán}.`
- `{{ræjssut}${loan,vowc,æ-ie;vowlat,u-i|riejssit}}€{w|manádit} `
- `valla dåbdåv ahte iv {riek}€{adv-pcle|rat} ájn sidá studerigoahtet.`
- `Mån lav nav {nievrre}€{w|lájkke} sjaddam dánna tjállet!`
- `Gå mujna ij la {vil}€{w|desti} sámegiella skåvlån`
- `{Soajttá}€{w|Márjju} ij huoman sjatta.`

### Kommandoar for å konvertera korpustekst til xml, og deretter trekkja ut med 'foreign'
For å konvertera originaltekst til xml:
```sh
$ convert2xml --goldstandard orig/smj/ficti/other_files/dan-le-danna-infonuorra.correct.txt.xsl 
```

For å konvertera éi korpusfil til tekst:
```sh
ccat -l smj -a -withforeign -c goldstandard/converted/smj/ficti/other_files/dan-le-danna-infonuorra.correct.txt.xml
ccat -a -withforeign goldstandard/converted/smj/news/NRK/2012 | see
ccat -a -withforeign goldstandard/converted/smj/news/NRK/2012 | gsed 's/¶/\n/g'
```

For å konvertera mange korpusfiler til tekst:
```sh
for f in $(find ./goldstandard/converted/smj -name '*.correct.*' ) ; do \
    bname=$(basename $f); ccat -a -withforeign $f | gsed 's/¶/\n/g' > tts/$bname; \
    done
```

## Nordsamisk

```
ihtu+N+Err/Lex+Sem/Dummytag:ihºtu GOAHTI-U ;
sámi% statistihkka% fágaseminára+N+MWE+CmpNP/First+Err/Lex+Sem/Event:sámi% statistihkka% fágaseminára GOAHTI-A ; !tja

servicekantuvra+Err/Lex:service# KANTUR_N ;
sykehuonaš+N+Sem/Build+Err/Lex+Use/LIA:syke^huotna DAIVVAS ;
hovedsivva+N+Sem/Semcon+Err/Lex+Use/LIA:hoved^sivva GOAHTI-A ; !LIA
plasthálla+N+Err/Lex+G3+Sem/Build:plast9#hálºla GOAHTI-A ;

fleaska+N+Sem/Food+Err/Lex+Use/LIA:fleasºka GOAHTI-A ; !LIA
slakteriija+N+Err/Lex+Sem/Org:slakteri IIJA ;
slakteriija+N+Err/Lex+Sem/Org:šlakteri IIJA ;
```

noen ord legger vi til til det samiske leksikonet:`
- `lapp``
- `finn`

## Kommenterte/problematiske døme

```
{Gruppa}€{foreign|} Pamyua ja Phillip Blanchett.
Kittis šattai CD-artista go almmustahtii Dovddut ({Feelings}€{foreign|}) -álbuma.
--- Feelings -- namn

Sii leat juo {álggurájes}${noun,notcmp|álggu rájes}, jagis 1989, čuojahan punk, {hard}€{foreign|} {rock}${noun,mix|rohka} ja árbevirolaš navajomusihka seaguhusa.

{Revontultentie}€{foreign|} lea riikkaidgaskasaš johtalusfávli, ja ruovdegeaidnojohtalusa {ovddidanvuloš}£{noun,attr,gensg,nomsg,case|ovddidanvuloža} oktavuohtan leat evttohuvvon riikkaidgaskasaččat mearkkašahtti Jäämerenrata ja turismma dárbbuid doarju ruovdegeaidnooktavuohta Levii.
--- Revontultentie -- namn

Jovnna Ovllá oaččui {Norsk Kulturarvs ærespris}€{foreign|} 2012, Norgga Kulturárbbi {gudnibálkašumi}${noun,mix|gudnebálkkašumi} dá {moatti vahku áigge}£{po,pph,nomsg,gensg,case|moatti vahku áigi}.
--- Norsk Kulturarvs ærespris --- namn

#{Publisert}€{foreign|} 14.11.2012 10:59. {Oppdatert}€{foreign|} 14.11.2012 11:02.
Mii leat vásihan ahte leat áidna sámi NGO (eaktodáhtolaš organisašuvdna) guhte čállá gulaskuddancealkámuša almmolaš eiseválddiide Norggas dain áššiin mat gusket sámenissoniid dillái ja sohkabealdásseárvui, nu go NOU 2011:18 – {Struktur for likestilling}€{foreign|} ({‘}‰{cit|”}Dásseárvui vuogádat{’}‰{cit|”}).
--- Struktur for likestilling --- namn

Duogáš Son lea oahppan sosiálaekonoma, ja bargan ovdal {Norges}€{foreign|} {Rederiforbund:as}${prop,suf|Rederiforbundas} ja {Norges}€{foreign|} {Industriforbund:as}${prop,suf|Industriforbundas}.
--- burde blitt merka opp som ett ord: {Norges Rederiforbund:as}${prop,suf|Norges Rederiforbundas} 


Enodaga gielddas ledje jagi 2010 loahpas 187, Gihttelis 11, {Muonios}∞{prop,foreign|Muonás} 5 ja Kolaris 2 sámegielaga.
--- jag hadde merkt opp Muonio som skrivefel (dollar) i yaml och errorthat før å få Muonás som førslag i gramkontrollen

{piera.balto@nrk.no}∞{url}

— Lehpet go meannudan {"}‰{cit|”}{mearrasámeáksuvnna}${noun,mix|mearrasámeakšuvnna}{"}‰{cit|”} {Nordkappa}∞{prop,foreign|Davvikáhpa} sámiid searvvis?

Loahpas de {arvvá}${verb,conc|arvá} {til og med}∞{adv,foreign|vel}.

{#Publisert}∞{nob} 22.11.2012 16:01. {Oppdatert}∞{nob} 22.11.2012 16:21.
```
{% endraw %}
