# Stoda no

* to ulike leksikonnemningsstrategiar
* inndelinga av adjektiva?
* Normativity issue - møte mandag 25/05 -      
    - to-stava adjektiv til normeringsnemnda (SGM)
    - systemet er ikkje det same som Bergsland sitt
* Tekniske ting
    - Vi har 112 dublett-entryar, nokre x3.
    - Vi har langt fleire doble lemma

# Adjektivklassifisering

Inndeling etter tre hovudkriterium:
* positivbøyinga
* komparering
* derivasjonsstamme

```
###  NORMATIVITY ISSUE
### syllable system 1
### ATTR=PRED = V/V= e(1), ie,
### ,           S/S = ie,
  hth
  hts
###            oeh/oeh = oe-stamme
###            ah/ah = a-stamme
###            an/an  = a-stamme
###                   =e(1)-stamme

### System2
### Attr= 0, Pred= s
###  e(1) 
###  e(2)   !raajne-raajnes (2)

### system3
### Attr= s, pred= 0
###  ie
### ( e(1)  - geehpes - giehpies - giehpie
           raejnies- raejnie (3)

### system 4= omlyd
### attr =/= pred   staeries -> staaran
###                 sæjngoeh-sæjngan
### ie -> a
### oe -> a

###  leevles, löövles = e(3) - lievlies- lievlie -> lievliedidh 
###  lïevles  -stamme e(1) - (system 2= attr=0, pred=s)
### lyövles  -stamme e(2) -(system 2= attr=0, pred=s ) 

skaajmes:skaajme GIJMIES ;

###   --question--
###  ??   frååpmes:frååpme NULL-S-EVEN ; =  attr=0, pred=s= EVEN, 
###  ??   fraapmas:fraapma NULL-S-EVEN ;
###  ??   geamhpes:geamhp RAAJNES ;
###  ??   gïemhpes:gïemhp E-ES-EVEN ; = lïene attr= lïenes pred=2 

###  ??   njoektjes:njoektj NJOEKTSES ;
###  ??   sajkes:sajk NJOEKTSES ; sajkebe/sajkemes
###  ??   friskes:frisk NJOEKTSES ;
###  ??   seejnes:seejn NJOEKTSES ;
###  ??   mïevres:mïevr NJOEKTSES ;
###  ??   njoektses:njoekts NJOEKTSES ;

LEXICON NJOEKTSES
 :e  ATTR-S ;! Attr=s, Pred= Ø, Comp= EVEN(ebe, emes), case/substantiv= EVEN 
     NJOEKTSEScase ;
+A+Pred:e FINAL1 ;
+A:e  EVENCOMP ;

frååpme attr- frååpmes pred. 
1=attr  = pred - alle st.? ie, a, u, e (alle e?) e(3) 
2=attr=Ø, pred=s  - e1, e2 (KB: berre e2) ebe/emes

 
3=attr=s, pred=Ø  - ie, e (1,2,3)?  ebe/emes  
kor er det ie? giehpies A4 +A+Attr:giehpies/+A+Pred:giehpie

attr     /  pred   = advl     = cmp                / superl
snaehpies/ snaehpie= snaebpie = snaebpebe          / snaebpemes            =S3 AAAA/5 
raajne/raajnes                = raajnebe           / raajnemes             =S2 DDDD/5 
raejnies/raejnie              = raajnebe           / raajnemes             =S3 AADD/5 
skeabtjoeh/skeabtjan          = skeabtjahkåbpoe    / skeabtjahkommes       =S4 CBBB/4 
skïebtje/skïemtjes            = skïebtjebe         / skïebtjemes           =S2 DDDD/4 

skåalloeh  4  -> skoelle 2
skeabtjoeh 4 -> skïebtje 2

System1-døme:
sneehpes/sneehpes =           = sneehpebe          / sneehpemes     =S1 FFFF/4?,5?
sneehpes/sneehpes =           = snaehpebe          / sneehpemes     =S1 FFAF/5
rööpses/rööpses   =           = ruepsebe           / rööpsemes      =S1 FFAF/7
söökes/söökes     =           = suekebe            / söökemes       =S1 FFAF/7
viehkies/viehkies : *veehkes

kor er det e3? geehpes  F4 +A+Attr:geehpes/+A+Pred:geehpes
viehkies -> veehkes??

4 OMLYD = - ie, oe (attr) -> a (pred) 

LEXICON ES_E-ES_E-ODD ! as ES-ES_E-ODD, but with ATTR-0 =avledning
       ATTR-0 ;
       ES-ES_E-ODD ;

       
LEXICON ES-ES_E-ODD
:e     ATTR-S;
:e     PRED-S;
:e     PRED-0;
+A:    ODDCOMP ; 

bïjveles+A+Pred:bïjvele ; ! bïjvedh IV-      e(1)-stamme
bïjveles:bïjvel ES-ES_E-ODD ; ! bïjvedh IV-      e(1)-stamme

lohkijes NULL-NULL-ODD ; !Attr=pred       inesiiv:lohkijisnie
lohkije NULL-NULL-ODD ; !Attr=pred        inessiv:lohkijisnie

leksikalisert = står i adj-fila
morfologisk = står i sma-lex

lohkije LOHKIJE ;

LEXICON 

lohkije = attr og pred av lohkije
lohkijes = attr og pred av lohkije
lohkijåbpoe = cmp av lohkije

 +V+PrsPrc:%>ije        FINAL1 ;
 +V+PrsPrc:%>ijes        FINAL1 ;

 +V+Der/A+A:%>ije        LOHKIJE ;

LEXICON LOHKIJE
   NULL-NULL-ODD ;
:s NULL-NULL-ODD ;
###  +A ADJCOMP ; utan komparering???

    1  2  3  4   5    6   7
A - i  e  u  ie  ae  åe  ue  +    ie                    í
B - æ  a  å  ea  aa  åa  ua  +    a                     á
C - æ  a  å  ea  aa  åa  åa  +    oe                    ú
D - ï  a  o  ïe  aa  åa  oe  +    e1 (eller i) mørk     a
E - y  o  o  yö  åå  åå (åå) +    e2 mørk               u
F - i  i  u  ee  ee  öö  öö  +    e3 (eller i) lys      i

ATTR OG PRED HAR RAD X
KOMPARATIV   HAR RAD Y 

Klassifisering maja-72

System 1:
stammetype: ie, a, u, e, (alle e?)
 a: 
 p: 
 c:
 s: 

System 2:
stammetype: e1, e2
 a: 
 p: 
 c: 
 s: 

System 3:
attr=A/pred=F
 a: 
 p: 
 c: 
 s: 

System 4:
attr=A/pred=B, attr=C/pred=B
attr
 a: 
 p: 
 c: 
 s: 

attr: C  A  
pred: E  B  

pos: 
cmp: F

Klassifisering stamme:
ie: S1, S4
a:  S1, 
oe: S4, 
e1: s2
e2: s2
e3: s1 a=-s/p=-s

KB:
ATTR     -   PRED
tjeehpe s- tjååhpehke
rööpeses - rååpsehke

MLK:
ATTR     - pred     -  AVLEIING (adj > adj)
tjeehpes - tjeehpes -  tjååhpehke -aktig - 
rööpeses - rööpses  -  rååpsehke

Det finst døme på at begge adjektiva blir brukt både attr og pred.

```
