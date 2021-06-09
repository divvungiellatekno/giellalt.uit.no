# Lingvistmøte i Divvun

Saker:
* yaml-testing i ny infra
* svenske ord i samisk: x, c og ord på -tion
* smj-normeringsmøtet i morgon
* Bugzilla

# yaml-testing i ny infra

For at testdata skal bli brukt, må fila slutta på `*.yaml`. I tillegg så må filnamnet ha transducernamnet i seg:

analyser-gt-norm.hfst => adj_gt-norm.yaml

Yaml-testinga visar at det er forskjell på Xerox og Hfst.

```
./configure --with-hfst
```

Det krevst nyaste hfst (3.3.14)

```
./configure --without-xerox
```

**Å Gjera:**
* lag fleire yaml-testar
* lag eller bygg ut referansekorpuset
* lag yaml-testar for alle ordklasser, samansette ord og produktiv derivasjon
* lag både normative og deskriptive testar

# svenske ord i samisk: x, c og ord på -tion

Det er mange dobbeltlemma i SMJ-leksikonet: alle "svenske" former skal submerkast, og få eit korrekt lemma.
Det "normala" är ju att byta ut såna här bokstäver.

Korhon:
* eksábma m examen eksáminánnda nd examinand eksáminásjåvnnå vn examination
* sosiála social sosiálalasj sosiálalattj- social
* åhpadusinstitusjåvnnå vn undervisningsinstitution
* evolutionissma+Dial/-NOR:evolutioni FANATISM ; 
* kautionissta+CmpN/SgN+CmpN/SgG+CmpN/PlG:kautioni TURIST ;

**Å gjera:**
* byta ut x, c og ti med ks, s og sj i lemma, Sub-tagg på slike stammar

# smj-normeringsmøtet i morgon

Adjektiv
* formell
* aspektual
* sosial
* verbal

Normeringa av endingane:
* ælla
* ella
* álla
* ála

Korleis er desse klassane normerte i SMA og SME?

## SME
* aspektuála	aspektuála+A+Sg+Nom
* formála	formála+A+Sg+Nom
* individuála	individuála+A+Sg+Nom
* generealla:genereal'la BOREALA ;
* kommersiealla
* nominealla
* territoriealla/territoriála
* substansiealla
* seremoniealla
* prosessuealla
* profešunealla
* konstitušunealla
* kontroversiealla
* materiealla
* visuála
* Pekka:generella!!!! konstitutionála!!!!

## SMA
* formelle	formelle+A+Sg+Nom
* formelle	formelle+A+Attr
* nominelle	nominelle+A+Sg+Nom
* nominelle	nominelle+A+Attr
* substansielle	substansijelle+A+Sg+Nom
* substansielle	substansijelle+A+Attr
* kommersielle	kommersijelle+A+Sg+Nom
* kommersielle	kommersijelle+A+Attr
* materielle	materijelle+A+Sg+Nom
* materielle	materijelle+A+Attr
* verbaale	verbaale+A+Sg+Nom
* verbaale	verbaale+A+Attr
* individuelle	individuelle+A+Sg+Nom
* individuelle 	individuelle+A+Attr
* visuelle	visuelle+A+Sg+Nom
* visuelle	visuelle+A+Attr
* sosijaale	sosijaale+A+Sg+Nom
* sosijaale	sosijaale+A+Attr
* digitaale	digitaale+A+Sg+Nom
* digitaale	digitaale+A+Attr
* profesjonelle	profesjonelle+A+Sg+Nom
* profesjonelle	profesjonelle+A+Attr

# Bugzilla

[1404](http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=1404) - båadtsah,
feejjene, læhkoladtje og rudtjege

```
båadtsah
båadtsah	båadtsah+A+Pl+Nom  <=== Fjern dette lemmaet
båadtsah	båadtsah+A+Attr    <=== Fjern dette lemmaet
båadtsah	båadtsoes+A+Attr
båadtsah	båadtsoes+A+Pl+Nom
båadtsah	båedtsedh+V+TV+Ind+Prs+Uml+Sg2

feejjene
feejjene	feejje+N+Sg+Gen+PxSg1
feejjene	feejjen+A+Sg+Nom  <=== rett opp lemma

læhkoladtje
læhkoladtje	læhkoladtje	+?

rudtjege
rudtjege	rudtje+N+Sg+Nom+Foc/ge
rudtjege	rudtjege+A+Sg+Nom
rudtjege	rudtjege+A+Attr
```

**Å gjera:**
Lag yaml-testar på desse adjektiva.
