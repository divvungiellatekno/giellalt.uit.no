Møte om klitika 29.10.2019

Til stades: Lene, Linda, Sara (i starten), Thomas, Trond, Sjur

# Tema: Analyse av partiklar og klitika

Ord med tvetydig eller problematisk fokuspartikkelanalyse:

* dálkadat (feilskriving)
* dálkkádat (korrekt)
* čohkkáhan

```
"<dálka>"
        "dálka" N Sem/Dummytag Sg Nom <W:0.0> @HNOUN MAP:22636:hnounNom
* **"dálkat" V IV PrsPrc <W:0.0> REMOVE:3963**: PrsPrc
"<dat>"
        "dat" Pcle <W:0.0> @PCLE MAP:21642:r16
```

Ny analyse, berre `hfst-tokenise`:

```
echo "Son čohkkáhan dáppe." | hfst-tokenise -g tokeniser-gramcheck-gt-desc.pmhfst
"<Son>"
	"son" Pcle <W:0.0>
	"son" Pron Pers Sg3 Nom <W:0.0>
:
"<čohkkáhan>"
	"čohkkáhit" V TV Actio Gen <W:0.0>
	"čohkkáhit" V TV Actio Nom <W:0.0>
	"čohkkáhit" V TV Ind Prt ConNeg <W:0.0>
	"čohkkáhit" V TV PrfPrc <W:0.0>
	"čohkkát" Ex/V IV Der/h V Actio Gen <W:0.0>
	"čohkkát" Ex/V IV Der/h V Actio Nom <W:0.0>
	"čohkkát" Ex/V IV Der/h V Ind Prs Sg1 <W:0.0>
	"čohkkát" Ex/V IV Der/h V Ind Prt ConNeg <W:0.0>
	"čohkkát" Ex/V IV Der/h V PrfPrc <W:0.0>
	"#" Foc/han <W:0.0> "<han>"
		"čohkkát" V IV Imprt Sg2 <W:0.0> "<čohkká>"
	"#" Foc/han <W:0.0> "<han>"
		"čohkkát" V IV Ind Prs ConNeg <W:0.0> "<čohkká>"
	"#" Foc/han <W:0.0> "<han>"
		"čohkkát" V IV Ind Prs Sg3 <W:0.0> "<čohkká>"
	"#" Foc/han <W:0.0> "<han>"
		"čohkkát" V IV VGen <W:0.0> "<čohkká>"
:
"<dáppe>"
	"dáppe" Adv Sem/Plc <W:0.0>
"<.>"
	"." CLB <W:0.0>
:\n
```

Ny analyse etter `cg-mwesplit`, klitisert:

```
$ echo "Son čohkkáhan dáppe." | hfst-tokenise -g tokeniser-gramcheck-gt-desc.pmhfst | vislcg3 -t -g mwe-dis.cg3 | cg-mwesplit
"<Son>"
	"son" Pcle <W:0.0>
	"son" Pron Pers Sg3 Nom <W:0.0>
:
"<čohkká>"
	"čohkkát" V IV Ind Prs Sg3 <W:0.0> SELECT:2146
"<han>"
	"#" Foc/han <W:0.0>
* **	"čohkkáhit" V TV Actio Gen <W:0.0> SELECT**: 2146
* **	"čohkkáhit" V TV Actio Nom <W:0.0> SELECT**: 2146
* **	"čohkkáhit" V TV Ind Prt ConNeg <W:0.0> SELECT**: 2146
* **	"čohkkáhit" V TV PrfPrc <W:0.0> SELECT**: 2146
* **	"čohkkát" Ex/V IV Der/h V Actio Gen <W:0.0> SELECT**: 2146
* **	"čohkkát" Ex/V IV Der/h V Actio Nom <W:0.0> SELECT**: 2146
* **	"čohkkát" Ex/V IV Der/h V Ind Prs Sg1 <W:0.0> SELECT**: 2146
* **	"čohkkát" Ex/V IV Der/h V Ind Prt ConNeg <W:0.0> SELECT**: 2146
* **	"čohkkát" Ex/V IV Der/h V PrfPrc <W:0.0> SELECT**: 2146
* **	"#" Foc/han <W**: 0.0> "<han>"
* **		"čohkkát" V IV Imprt Sg2 <W:0.0> "<čohkká>" SELECT**: 2146
* **	"#" Foc/han <W**: 0.0> "<han>"
* **		"čohkkát" V IV Ind Prs ConNeg <W:0.0> "<čohkká>" SELECT**: 2146
* **	"#" Foc/han <W**: 0.0> "<han>"
* **		"čohkkát" V IV VGen <W:0.0> "<čohkká>" SELECT**: 2146
:
"<dáppe>"
	"dáppe" Adv Sem/Plc <W:0.0>
"<.>"
	"." CLB <W:0.0>
:\n
```

Ny analyse etter `cg-mwesplit`, ikkje klitisert:

```
$ echo "Son čohkká han dáppe." | hfst-tokenise -g tokeniser-gramcheck-gt-desc.pmhfst | vislcg3 -t -g mwe-dis.cg3 | cg-mwesplit
"<Son>"
	"son" Pcle <W:0.0>
	"son" Pron Pers Sg3 Nom <W:0.0>
:
"<čohkká>"
	"čohkkát" V IV Ind Prs Sg3 <W:0.0> SELECT:2146
"< han>"
	" " Foc/han <W:0.0>
* **	" " Foc/han <W**: 0.0> "< han>"
* **		"čohkkát" V IV Imprt Sg2 <W:0.0> "<čohkká>" SELECT**: 2146
* **	" " Foc/han <W**: 0.0> "< han>"
* **		"čohkkát" V IV Ind Prs ConNeg <W:0.0> "<čohkká>" SELECT**: 2146
* **	" " Foc/han <W**: 0.0> "< han>"
* **		"čohkkát" V IV VGen <W:0.0> "<čohkká>" SELECT**: 2146
:
"<dáppe>"
	"dáppe" Adv Sem/Plc <W:0.0>
"<.>"
	"." CLB <W:0.0>
:\n
```

Gamal analyse:

```
$ echo "Son čohkká han dáppe." | preprocess | hfst-lookup -q ../../src/analyser-disamb-gt-desc.hfst| cut -f1-2 | lookup2cg
"<Son>"
	"son" Pcle
	"son" Pron Pers Sg3 Nom
"<čohkká>"
	"čohkkát" V IV Ind Prs Sg3
	"čohkkát" V IV VGen
	"čohkkát" V IV Ind Prs ConNeg
	"čohkkát" V IV Imprt Sg2
	"čohkkát" V IV Imprt ConNeg
"<han>"
	"han" Pcle
"<dáppe>"
	"dáppe" Adv Sem/Plc
"<.>"
	"." CLB
```

Spørsmål:

* Kva skal vera lemma? "han" osb.
* Kva skal vera taggen?

Svar:
* Viss vi ser "leahan" som er samansetjing (som biila i láibebiila) blir "han"
  lemma

Jf. analysen av desse to — *láibebiila* og *čohkkáhan*:

```
usme:
láibebiila	láibi+N+Cmp/SgNom+Cmp#biila+N+Sg+Nom

echo "láibebiila" | hfst-tokenise -g tokeniser-gramcheck-gt-desc.pmhfst
"<láibebiila>"
	"biila" N Sem/Veh Sg Nom <W:10.0>
		"láibi" N Sem/Food Cmp/SgNom Cmp <W:10.0>

usme:
čohkkáhan	čohkkát+V+IV+Ind+Prs+Sg3+Foc/han

hfst-tokenise:
	"han" Pcle <W:0.0> "<han>"
		"čohkkát" V IV Imprt Sg2 <W:0.0> "<čohkká>"
```

For usme-analysen kunne vi i staden ha:
```
čohkkát+V+IV+Ind+Prs+Sg3#han+Pcle+Foc
```

Her ser vi korleis *biila* og *han* blir lemma i hfst-tokenise, og indirekte
korleis det kunne ha vorte det for *čohkkahan*.

# Partiklar vs. adverb

Nickel/Sammallahti s. 205: «Modalpartikler»

* enklitiske partikler
* partikler som selvstendige ord
* (setningsadverb)

Partikler:

* Dei som blir skrive i lag med verten på finsk side:
    - Pcle <pol>  etter ordet det står til: -ge (pos/neg, = kin/kAAn)
    - Pcle <foc> på andreplass i setninga: alle andre enklitiske
    - Pcle <qst> go
* Dei som ikkje blir skrive i lag med verten på finsk side (og ikkje må stå
  på andreplass (?))

```
---------------------------------------
Pcle:
2. posisjon eller fokus/polaritet: Pcle
leago  +Pcle+Qst <cl> evt: +Pcle+Qst+Clt
lea go +Pcle+Qst

leage  +Pcle+Pol <cl>
lea ge +Pcle+Pol
leago  +Pcle+Qst <cl>
lea go +Pcle+Qst
leaba  +Pcle+Foc <cl>
lea ba +Pcle+Foc
-------------------------------------
Ikkje 2. posisjon eller fokus: Adverb
aitto Pcle <== Adv Cls Sem/xxx?
odne Adv

manne+Adv+Subqst

dáppe+Adv+Sem/Plc
dalle+Adv+Sem/Time
čččč+Adv+Sem/Plc_Time  ?
-------------------------------------

husmedis
mihkkege
mihkkege	mihkke+Pron+Indef+Sg+Nom+Foc/Neg-ge	0,000000
mihkkege	mihkke+Pron+Indef+Sg+Nom+Foc/Pos-ge	0,000000

Pron Pers
N NomAg
```

# LIA-materialet

Legge inn LIA-etntrŧyer i fil/filer?

```
grep LIA src/morphology/stems/* |wc -l
    2175
```

Begrunnelse: Dette gir mulighet for å kompilere en egen HFST for LIA-analyse, og
vi risikerer ikke at ordene gir for mange analyser i andre sammenhenger

# Korleis referere til underlesingar i vislcg3

```
REMOVE:longest-match SUB:1 ("<.*>"r)(NEGATE 0 Err/Lex);

SELECT V + Sg3 (0 Foc/han LINK -1 Pers + Sg3 + Nom) ;
```

Dette er måten å referere til underlesingar på:

```
	# SUBREADINGS:
	# ------------
	bil            0, -3
	   kake        1, -2
	       oste    2, -1
#	oste#kake#bil
#	0 = bil
#	0/0 = bil
#	0/1 = kake
#	0/2 = oste
#	0/-1 = oste
#	0/-2 = kake
#	0/-3 = bil
1.   Til venstre for "/": posisjon i setninga
1.   Til högre for "/": posisjon i stakken, rekna ovafrå (positiv) eller nedanfrå (negativ
```
