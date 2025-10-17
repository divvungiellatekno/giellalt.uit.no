# Møte om innpassing av samiske namn 

Deltagere: Lene, Maja, Trond, Helena, Flammie, Børre

Dato: 17.10.2025

Det har vore to møte om dette tidlegare, [26.9](2023-09-26-shared-lexc.html) og [8.12.](2023-12-08-shared-lexc.html) 2023.

Problem: Namn i samiske område blir brukt i andre samiske språk. 

## Overordna problemstillingar

Det er ulike problem å ta stilling til:

- Lingvistisk: Skal ordet `bliynam` tatt inn uendra, bli tilpassa eller bli oversatt? 
- Lingvistisk: Skal endringa gjelde heile ordet eller berre sisteleddet?

- Praktisk: skal endringa bli gjort via skript, dynamisk, for kvar kompilering, eller skal det blir gjort ein gong for alle, slik at det ikkje er skripta overføring mellom dei ulike språka for kvar gong

## Lingvistisk

Prinsipp: smj-navn i sme-løpende tekst skal ha rød strek - sitat skal være sitat  - smj skal være feil i sme, og omvendt. Kvart samiske språk må få dei egennavna dei treng: - i sme-text, skal det være mulig å snakke om Tysfjord, dermed må det heitle *-vuotna*, ikkje *-vuodna*, for at det skal kunne bli böygd i ulike kasus.

Uendra lån til andre samiske språk (`-vuodna`, `-jávvrie`) vil øydelegge språka, det er dermed utelukka. 

Å endre berre sisteleddet vil gje oss lulesamisk Iešjávvre, også med å endre berre den siste av to š-ar: Niitoš**jogaš** => Niitoš**jågåsj** men det kan vi (ssv?) leve med. 

Å endre begge ledd (Nijttosjjågåsj???) er eit anna alternativ (viss det blir gjort riktig!)


## Praktisk

### a. overføre namn ein gong

Fordel: 
- vi har full kontroll
- det er gjennomsiktig
- Det er mogleg å gjere det gradvis: Ta inn namn frå andre samiske språk i det eigne samiske språket **etter kvart som dei dukkar opp**, evt. **område for område**, heller enn å konvertere alle

Ulempe:
- nye namn må bli lagt til ein gong for kvart språk, og ikkje berre ein gong

Dette må bli gjort halvmanuelt, med skripting og tilpassing (` grep streng sme | tilpass |  >> smj` , osb.

### b. overføre dynamisk

Det inneber at sm?-propernoun.lexc-filene i lang-sm? må bli tilpassa:

- Merke alle navn som har parallelle navn på alle smx- eks: Norga, Nøørje, Vuodna - PARA-tag 

Fordel:
- Vi har berre ei liste med namn for kvart samiske språk, ikkje fleire
- Vi kan ombestemme oss ved å endre scriptet

Ulempe:
- Feilsöking må bli gjort i fire filer: originalfil, scriptfil, lokal namnefil, derivert spleisefil
- Heile prosessen er mindre transparent, og vi risikerer at namn blir lagt til på to stader


## Drøfting

- ulike samtaler 

    - NRK - geavaheadji

    Garresjohke - (sma: folkeetymologi, "Hjemmeluft") 
    Karasjohke

    - hvordan skal vi behandle leksikonene våre? 

    - Lingvistisk; heivehit

    - automatisk tilpassing: både manuelt og automatisk: 

    - Hvordan skal man behandle f.eks plural-navn. - Vuovdega - Vuovdiigga - Vuovdega?  


Lene tar kontakt med Sametinget om hvordan de/har tanker om hvordan man tilpasser ulike samiske språks egennavn i ulike samiske språks løpende text. 


Mulige løsninger: 

Linda og Flammie: dependens-analyser går ikke opp p.g.a at nordsamiske egennavn ikke får analyse  i sørsamisk løpende tekst, sme-egennavn får ikke analyse i sma-analysator - må vite hvordan bøye disse:
  - klart: loekte, vaerie, johke, etc.
  - andre er uklare

Eksempel fra Helena: 
- Virddi/Virdi 
- sørsamisk/umesamisk (maja finner konkrete eksempler) 
   
Lenes poeng: Vi ødelegger morfologien til hverandres språk
- Aja skal egentlig bøyes `adjagii`, `adjagas`, men pga. lulesamisk `Aja` blir til `ajas`, `ajai` 
- Divtasvuodna/-vuotna 


## Generere av ordformer

Begge scripta nedanfor sjekkar: `source_file=src/fst/morphology/generated_files/smi-sma-propernouns.lexc`

stå i `lang-xxx` og skriv `sh devtools/generate-prop-wordforms.sh`

Du kan også opne skriptet og regulere kor mange ord du vil ha for kvart contlex, og kor mange contlex du vil ha. Hugs å slette html-fila etterpå, git liker ikkje at html-filer ligg og sleng i `lang-xxx`.

## Generere alle former for **eitt namn**

```sh
sh devtools/prop_minip.sh Stuorrajohkagohppi
```


# Konklusjon

Vi kjem attende til denne saka i eit nytt møte.


