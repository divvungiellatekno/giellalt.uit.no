Møte om samansetjingar - del 2

Normativitet for samansetjingar:
* hvem sier hva om sma-sammensetninger
* korpus
* oversikt

Sjekka inn fra korpus analysert 11.10.2016:
Finnes i sma/src/morphology/incoming/
* smaCmpfrekv.txt (sortert etter frekvens)
* smaCmpsorted.txt (sortert alfabetisk)
* smaCmpsortedNormalised.txt (sortert alfabetisk, endra ï>i og ø>ö)
* smaCmpsorted_downcase.txt (sortert alfabetisk, endra ï>i og ø>ö, endra stor bokstav til liten)
* smaCmptaggfrekv (Cmp taggfrekv, ikke Split)
* sma_missing_frekv.txt (ord som ikke har fått analyse, sortert etter frekvens)

+Cmp/Sh - tagger kortform når det finnes to muligheter, kortform og ikke
* **šaddanbeaiskuvla**:       šaddanbeaivi+N+Cmp/Sh+Cmp#skuvla+N+Sg+Nom
* **šaddanbeaiveskuvla**:         šaddanbeaivi+N+Cmp/SgNom+Cmp#skuvla+N+Sg+Nom
* **kulturskuvla**:   kultuvra+N+Cmp/SgNom+Cmp#skuvla+N+Sg+Nom

Type (man teller bare forskjellige ord):
| 34438 | Cmp/SgNom <= her er også Der/NomAct, dvs at forleddet er et verb
|  3978 | Cmp/Attr
|  1401 | Cmp/SgGen
|   886 | Cmp/PlGen dvs. liten variasjon

Token (man teller alle ordene/forekomstene):
| 134140 | Cmp/SgNom <= her er også Der/NomAct, dvs at forleddet er et verb
|  13217 | Cmp/Attr
|  10640 | Cmp/Hyph
|   8402 | Cmp/SgGen
|   6028 | Cmp/PlGen dvs. liten variasjon
|   3426 | Cmp/SplitR

Hapaxfrekvens (lista er laget av ord som bare finnes en gang i korpuset):
| 37314 | Cmp/SgNom
|  4788 | Cmp/Hyph
|  3177 | Cmp/Attr
|  1415 | Cmp/PlGen
|  1414 | Cmp/SgGen
|   592 | Cmp/SplitR

Formfrekvens:
|  +N+Cmp/SgNom | 110827
|  +N+Cmp/SgGen |   7028
|  +N+Cmp/PlGen |   5585

Dvs. 11,3% av samansetjingane har eit genitivforledd

* +CmpNP/None: vil ikke kunne inngå i sammensetning, som for máŋggas
‘mange (om mennesker)’
* +CmpNP/Last: kan bare være etterledd, som for <i>gaskka</i>  ‘ildstål’. Som forledd vil ordene bli leksikalisert, Dette for å unngå uønskede sammensetninger med gaskka istedenfor gaska og slik dekke over skrivefeil
* som ordretteprogrammet ikke bør finne igjen, f.eks. gaskkavahkku pro gaskavahkku ‘onsdag’­
* +CmpNP/First: kan bare være forledd 4-čiegahas

# CpmNP-taggar

Frå `sma/*/root.exc`:

This entry / word should be in the following position(s):
|  Tag         | Meaning                                                            |Exmpl.| Explanation
| --- | --- | --- | ---
|  +CmpNP/All  | … in all positions,  default, this tag does not have to be written |   -
|  +CmpNP/First| … only be first part in a compound or alone                        | huvva |  to prevent dáhpáhuvva
|  +CmpNP/Pref | … only  first part in a compound, NEVER alone                      | eahpe-| eahpeipmil = a no god
|  +CmpNP/Last | … only be last part in a compound or alone                         | ráigi+N+CmpNP/Last+Sem/Route+Sg+Gen+Allegro:rái K ;
|  +CmpNP/Suff | … only  last part in a compound, NEVER alone                       |  lohka+CmpNP/Suff+Sem/Dummytag:loh'ka GOAHTI-A ;
|  +CmpNP/None | … does not take part in compounds                                  |  váhku+CmpNP/None+Sem/Dummytag:váh'ku GOAHTI-U ;  | because it resembles vahkku
|  +CmpNP/Only | … only be part of a compound, i.e. can never be used alone, but can appear in any position

Pref:
```
adverbs.lexc:vulos+Adv+CmpNP/Pref+CmpN/SgN+Sem/Dummytag+Err/Orth:vulos Rreal ;
sme-propernouns.lexc:Ohcejohka+N+Prop+CmpNP/Pref+Sem/Plc+Err/Orth+Sem/Dummytag:ohce#joh Rreal ;
sme-propernouns.lexc:Guovdageaidnu+N+Prop+CmpNP/Pref+CmpN/SgN+Err/HyphSub+Sem/Dummytag:Guovdageain Rnoun ;
sme-propernouns.lexc:Kárášjohka+N+Prop+CmpNP/Pref+CmpN/SgN+Err/HyphSub+Sem/Dummytag:Kárášjoh9 Rnoun ;
sme-propernouns.lexc:Kárášjohka+N+Prop+CmpNP/Pref+CmpN/SgN+Err/HyphSub+Sem/Dummytag:Kárášjot Rreal ;
sme-propernouns.lexc:Ohcejohka+N+Prop+CmpNP/Pref+CmpN/SgN+Err/HyphSub+Sem/Dummytag:Ohcejoh9 Rreal ; ! Cannot stand alone
sme-propernouns.lexc:Ohcejohka+N+Prop+CmpNP/Pref+CmpN/SgN+Err/HyphSub+Sem/Dummytag:Ohcejot Rnoun ; ! Can stand alone
sme-propernouns.lexc:Skáidejávri+Prop+N+CmpNP/Pref+CmpN/SgN+Err/HyphSub+Sem/Dummytag:Skáidejár Rreal ;
```

First :sma
```
SpellNoSugg i abbreviations:  152 sma, 152 sme, 156 smj, 152 smn, 172 sms
abbreviations.lexc:ö+Use/SpellNoSugg+CmpNP/First:ö ab-nodot-noun; !
abbreviations.lexc:č+Use/SpellNoSugg+CmpNP/First:č ab-nodot-noun; !
abbreviations.lexc:š+Use/SpellNoSugg+CmpNP/First:š ab-nodot-noun; !
adjectives.lexc:eahpedásset+CmpNP/First+Sem/Hum:eahpe#dásse7d JOHTIL ;
adjectives.lexc:eahpedoaibmi+CmpNP/First+Sem/Hum:eahpe#doaibmi LEXATTR ;
adjectives.lexc:eahpesávahahtti+CmpNP/First+Sem/Hum:eahpe#sávaha HAHTTI ;
nouns.lexc:A-vitamiidna+CmpNP/First+Sem/Substnc:A-vitam ADRENALIN ;
nouns.lexc:mánáid-TV-kanála+CmpNP/First+Sem/Plc-abstr:mánáid9-TV-kanál SOSIAL ;
nouns.lexc:nuorta-finnmárkulaš+CmpN/SgN+CmpN/SgG+CmpN/PlG+CmpNP/First+Sem/Hum:nuorta-finnmárkulažž JOHTOLAT ;
```

Last:
```
adjectives.lexc:IT-guoskevaš+CmpNP/Last+Sem/Dummytag:IT-guoskev AHKASAS ; gööktesh
nouns.lexc:advokáhta% guovttis+CmpNP/Last+OLang/UND+Sem/Hum:advokáhta% guo GUOVTTIS ;
nouns.lexc:advokáhta% guovttos+CmpNP/Last+OLang/UND+Sem/Hum:advokáhta% gu GUOVTTU ;
nouns.lexc:feastit+V+TV+Der2+Der/NomAg+CmpN/SgN+CmpN/SgG+CmpN/PlG+CmpNP/Last+Sem/Hum:feasti¤ ACTORLEX ;
nouns.lexc:jahkelohki+CmpNP/Last+CmpN/SgNomLeft+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:jahke#loh'ki GOAHTI-I ;
```

Suff::sma
```
adjectives.lexc:lágan+CmpN/SgNomLeft+CmpN/SgGenLeft+CmpN/PlGenLeft+CmpNP/Suff+Sem/Hum: LAGAN;  ! XXX Look at syntactic analysis...
adjectives.lexc:lágaš+CmpN/SgNomLeft+CmpN/SgGenLeft+CmpN/PlGenLeft+CmpNP/Suff+Sem/Hum: LAGAS;  ! XXX Look at syntactic analysis...
nouns.lexc:lohka+CmpNP/Suff+Sem/Dummytag:loh'ka GOAHTI-A ;
```

None:
```
abbreviations.lexc:r+CmpNP/None:r ab-dot-IVprfprc; !Lene: None er ukjent
acronyms.lexc:as+CmpNP/None:as ACRO ; !A/S
acronyms.lexc:oy+CmpNP/None:oy ACRO ; !A/S
adjectives.lexc:ollu+CmpNP/None+Sem/Dummytag:ol'lu BOREALA ;
adjectives.lexc:olu+CmpNP/None+Sem/Dummytag:olu BOREALA ;
adjectives.lexc:veara+CmpNP/None+A+Ess+Sem/Dummytag:veara%>n K ;
adjectives.lexc:veara+CmpNP/None+A+Sg+Gen+Sem/Dummytag:veara K ;
adjectives.lexc:veara+CmpNP/None+A+Sg+Nom+Sem/Dummytag:veara K ;
nouns.lexc:Abimelek% guovttis+CmpNP/None+Sem/Hum:Abimelek% guo GUOVTTIS ;
nouns.lexc:Abimelek% guovttos+CmpNP/None+Sem/Hum:Abimelek% gu GUOVTTU ;
nouns.lexc:gaigŋirbealis+CmpNP/None+Err/Orth+Sem/Dummytag:gaigŋer#bealis LASIS ;
nouns.lexc:gaigŋirbealis+CmpNP/None+Sem/Dummytag:gaigŋir#bealis LASIS ;
```

Only:
```
nouns.lexc:bealle+CmpN/SgNomLeft+CmpN/SgGenLeft+CmpN/PlGenLeft+CmpNP/Only+Sem/Part:beall BEALLE ;
```

# CmpN/Left-taggar
```
 grep CmpN/.*Left ../sme/src/morphology/stems/nouns.lexc |grep 'CmpN/SgNomLeft+CmpN/SgGenLeft+CmpN/PlGenLeft'|wc -l
    1291
```

Desse har krav til færre enn tre former på forledd:
Ikkje SgGen:
```
gaska+CmpN/SgN+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Feat-measr_Plc:gas'ka GOAHTI-A ;
earru+CmpN/SgN+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Feat:earru ALBMI ;
earuhus+CmpN/SgN+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Dummytag:earuhuss JOHTOLAT ;
erohus+CmpN/SgN+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Feat:erohuss JOHTOLAT ;
guorra+CmpNP/Last+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Dummytag:guorra GOAHTI-A ;
divuhus+CmpN/SgN+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Dummytag:divuhuss JOHTOLAT ;
goazahus+CmpN/SgN+CmpN/SgNomLeft+CmpN/PlGenLeft+Sem/Dummytag:goazahuss JOHTOLAT ;
```

Ikkje SgNom:
```
kulturduohki+v1+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+OLang/NOB+Sem/Feat:kultur#duoh'ki DUOHKI ;
kulturduohki+v2+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Feat:kulttor#duoh'ki DUOHKI ;
oahpahusduohki+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Feat:oahpahus#duoh'ki DUOHKI ;
bálda+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Plc:bál'da GOAHTI-A ;
geavat+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:geavad GAHPIR ;
hálddahangeavat+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:hálddahan#geavad GAHPIR ;
hálddašangeavat+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:hálddašan#geavad GAHPIR ;
sisheagga+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:sis#heagga GOAHTI-A ;
váiveheagga+CmpN/SgN+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:váive#heagga GOAHTI-A ;
```

Ikkje PlGen:
```
oahpponeavvoovddideaddji+CmpN/SgN+CmpN/SgG+CmpN/PlG+CmpN/SgNomLeft+CmpN/SgGenLeft+Sem/Dummytag:oahppo#neavvo#ovddideaddji¤ ACTORLONGSHORT ;
```

Ulik form = ulik tyding:
```
geahči --> uksageahči vs uvssageahči
vuolli ---> seaŋgavuolli vs seaŋggavuolli
ahki ---->  skuvlaahki vs skuvllaahki
```

* uksageahči= enden på dörren
* uvssageahči = enden av rummet der dörren er
* seaŋgavuolli = senga si underside (del av senga)
* skuvlaahki = skoleålder
* skuvllaahki = skolens ålder

*uksa, skuvla:  vanligtvis bara sgnom

[/lang/common/CompoundTags.html]

# What kind of words gets Gen Cmp?

Adjectives denoting:

* People

Nouns denoting:

* Living creatures, people, animals etc    tex: lottejuolgi (first part GenSg)

* Growths

* Organisations (like Gielda, Guovlu, Riika, Goahti, Dállu etc)

* Topografy (like Johka, Mearra, but not Várri, Jávri)

* People-groups (like Sápmi, Duiska etc)

* Weather and state of the ground etc (like Dálki, Siivu, Čáhci, Dulvi, Muohta etc)

* Time (Áigi, Idja, Beaivi etc)

* and nouns on -vuohta and -upmi (like ráhkisvuohta and buktojupmi)

* plural nouns

# Left compound-tagging

Case of first part is dependent of second part:

# What kind of words get +Left compound-tags?

Some very few specific words where the meaning of the compound alters with the case of the first part (for example Ahki, Dilli, Heahti, Duohki, Vuolli, Geahči.

* **Skuvlaahki vs. Skuvllaahki**:  school-age vs. age of school,
* **Stohpodilli vs. Stobudilli**:  housing situation vs. situation in the house
* **Uksageahči vs. Uvssageahči**:  end of the door vs. end of the room where the door is)

In North Sami: Deverbal nouns like actios and actors stemming from transitive verbs (for example Sálbmalávlun vs. Sálmmalávlun, Sarvabivdi vs. Sarvvabivdi)

[/lang/sme/root-morphology.html]

```
+CmpN/SgNomLeft Singular Nominative
+CmpN/SgGenLeft Singular Genitive
+CmpN/PlGenLeft Plural Genitive
```

SMJ- eksempel:
```
åvddånbuktem+CmpN/SgN+CmpN/DefSgGen+CmpN/DefPlGen+CmpN/SgNomLeft+CmpN/SgGenLeft+CmpN/PlGenLeft+Sem/Dummytag:åvddån#buktem VSBST-ODD
```

Kor mange forledd er det i korpus?
```
2463 SgNom
 386 SgGen
 844 PlGen
```
