# Lingvistmøte 17.4.2013

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* propernoun-konvertering og -tilpassing

# Propernoun-konvertering og -tilpassing

Det er tre oppgåver:
* avklara lingvistikken
* tilpassa/oppdatera konverteringsskriptet
* sjekka at alle leksikon er (korrekt) definerte

# Avklara lingvistikken

Diskusjonen heldt fram frå førre møtet:

```
PIPPI - odd i lulesamisk (jij) og sørsamisk, viser til ACCRA i nordsamisk. Tostav
ACCRA - består som det er
DUBAI -
BERGLI som viser til ACCRA i i sme og sma.

Bergli
vi har NYSTØ før ord namn Bergli

Bergli kan man uttala Berglis eller Berglias

væljer vi Berglias, då får vi samma problem i Nord (som i Sør och Lule) i illativ,
Berglijii (før Bergliii går inte), och ska vi då skriva Berglijas eller Berglias i lokativ?

Dubaias

Hyundai NYSTØ-obj ;
Bjerkeli:Bjerke^li NYSTØ-sur ;
Bjerkli:Bjerk^li ACCRA-sur ;

Dubaias Pippijis
Dubaiaj Pippijij

Dubai    - Dubaiesne? - Dubajesne (?) sjekk opp!
Pippi    - Pippijasse - ODD - Pippijasse
Bergli   - Berglijesne   - li - lijesne
Avaldsli - Avaldslijesne - lijesne

Dubaijii
```

## Vokalfinale namn i SMI

Vi har desse leksikona for slike ord:

* `PIPPI`  - i-finale namn, final i trykksvak  ije
* `DUBAI`  - i-finale (j-final i uttalen, typisk etter lang vokal) namn, siste staving trykksterk
* `NYSTØ`  - andre vokalfinale namn, trykksterk sistestaving, -a i acc/gen: Nystøa
* `ACCRA`  - andre vokalfinale namn, trykksvak sistestaving

Dvs, klassifiseringa kan oppsummerast i denne tabellen:
```
+--------------+------------+-------------+
|  Siste stav.  | trykksterk | trykksvak   |
+--------------+------------+-------------+
|  final X+i/j  | DUBAI (V+j)| PIPPI (C+i) |
+--------------+------------+-------------+
|  andre fin. V | NYSTØ*     | ACCRA       |
+--------------+------------+-------------+

* Også i som ikke har lang vokal foran seg slik som i DUBAI.
```

Alle smi-namn ligg i:

```
$GTHOME/gtcore/templates/smi/src/morphology/stems/smi-propernouns.lexc
```

SMI-namn i SMA:
```
Bakkeli
Faremo:Fare^mo9 NYSTØ-sur ;

Faremo:Faremo ONAME-sur ;(sma) = NYSTØ
Bakkeli = NYSTØ
```

från "Čállinrávvagat":
```
			Ovttaidl.	máŋggaidl.		ovttaidl.	máŋggaidl.
			ACCRA						LONDON
	nom.	Kari		Karit			Astrid		Astridat
	gen.	Kari 		Kariid			Astrida 	Astridiid
	akk.	Kari		Kariid			Astrida		Astridiid
	ill. 	Karii		Kariide			Astridii	Astridiide
	lok.	Karis		Kariin			Astridis	Astridiin
	kom.	Kariin		Kariiguin		Astridiin	Astridiiguin
	ess		Karin		Karin			Astridin	Astridin
```

9 Kari – sihke ol. nominatiiva, genitiiva ja akkusatiiva ovttaládje go das lea vokálaloahppa (JMF Bergli). 10 Astrid – ol. genitiivii ja akkusatiivii sáhttá lasihit –a go das lea konsonántaloahppa.

Bøyinga av Dubai i sme og smeNorm:
```
dsme
0%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>100%
Dubai+N+Prop+Plc+Sg+Ill
Dubai+N+Prop+Plc+Sg+Ill	Dubai-ii
Dubai+N+Prop+Plc+Sg+Ill	Dubai-i
Dubai+N+Prop+Plc+Sg+Ill	Dubaijii
Dubai+N+Prop+Plc+Sg+Ill	Duba:iii
Dubai+N+Prop+Plc+Sg+Ill	Duba:ii
Dubai+N+Prop+Plc+Sg+Ill	Dubaiii
Dubai+N+Prop+Plc+Sg+Ill	Dubaii
Dubai+N+Prop+Plc+Sg+Ill	Dubaiai
Dubai+N+Prop+Plc+Sg+Ill	Dubai-ii
Dubai+N+Prop+Plc+Sg+Ill	Dubai-ai
Dubai+N+Prop+Plc+Sg+Ill	Dubai-j
Dubai+N+Prop+Plc+Sg+Ill	Dubai'ii
Dubai+N+Prop+Plc+Sg+Ill	Dubai'ai
Dubai+N+Prop+Plc+Sg+Ill	Dubai'j
Dubai+N+Prop+Plc+Sg+Ill	Dubai:ii
Dubai+N+Prop+Plc+Sg+Ill	Dubai:ai
Dubai+N+Prop+Plc+Sg+Ill	Dubai:j

Ingas-MacBook-Pro-2:~ Inga$ dsmeNorm
0%>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>100%
Dubai+N+Prop+Plc+Sg+Ill
Dubai+N+Prop+Plc+Sg+Ill	Dubaijii
```
