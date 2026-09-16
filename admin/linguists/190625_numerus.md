# Møte om felles numerusfil 25.6.2019

Til stades: Lene, Maja, Sjur, Trond


Mål: Felles fil for arabiske tal og romartal

```
$GTHOME/giella-shared/smi/src/morphology/stems/numerals.lexc
$GTHOME/giella-shared/all_langs/src/morphology/stems/arabic_roman_digits.lexc
$GTHOME/langs/$LANG/src/morphology/affixes/numerals.lexc
```

hfst: (27 12) -åringar (feil) vs. xfst 27 12-åringar (korrekt)

```sh
echo Jearranskovi vástádusain boahtá ovdan ahte 27 12-jahkásačča ja 25 9-jahkásačča \
hálle sámegiela ovdalgo sii vulge skuvlii. |\
hfst-tokenize --giella-cg --weight-classes=1 \
~/main/langs/sme/tools/tokenisers/tokeniser-disamb-gt-desc.pmhfst |\
vislcg3 -g ~/main/langs/sme/src/syntax/disambiguator.cg3
```

Resultat:
```
"<Jearranskovi>"
	"jearranskovvi" N Sem/Txt Sg Gen <W:0.0> <sme>
: 
"<vástádusain>"
	"vástádus" N Sem/Prod-ling Pl Loc <W:0.0> <sme>
: 
"<boahtá>"
	"boahtit" V IV Ind Prs Sg3 <W:0.0> <sme> @+FMAINV
: 
"<ovdan>"
	"ovdan" Adv <W:0.0> <sme>
: 
"<ahte>"
	"ahte" CS <W:0.0> <sme> @CVP
: 
"<27 12-jahkásačča>"
	"jahkásaš" A Sg Gen <W:10.0> <sme>
		"27 12" Num Cmp/Hyph Cmp <W:10.0>
: 
"<ja>"
	"ja" CC <W:0.0> <sme> @CNP
: 
"<25 9-jahkásačča>"
	"jahkásaš" A Sg Gen <W:10.0> <sme>
		"25 9" Num Cmp/Hyph Cmp <W:10.0>
: 
```



```
"<Jearranskovi>"
	"jearranskovvi" N Sem/Txt Sg Gen <sme>
"<vástádusain>"
	"vástádus" N Sem/Prod-ling Pl Loc <sme>
"<boahtá>"
	"boahtit" V IV Ind Prs Sg3 <sme> @+FMAINV
"<ovdan>"
	"ovdan" Adv <sme>
"<ahte>"
	"ahte" CS <sme> @CVP
"<27>"
	"27" Num Arab Sg Gen <sme>
	"27" Num Arab Sg Nom <sme>
"<12-jahkásačča>"
	"12-#jahkásaš" A Sg Gen <sme>
"<ja>"
	"ja" CC <sme> @CVP
"<25>"
	"25" Num Arab Sg Nom <sme>
"<9-jahkásačča>"
	"9-#jahkásaš" A Sg Gen <sme>
```


Diskusjon om ulike analyser

```sh
$ echo Hornberger 1989: 289 | hfst-tokenise -g grammarcheckers/tokeniser-gramcheck-gt-desc.pmhfst 
```
Resultat:
```
"<Hornberger>"
	"Hornberger" N Prop Sem/Sur Attr <W:0.0>
	"Hornberger" N Prop Sem/Sur Sg Acc <W:0.0>
	"Hornberger" N Prop Sem/Sur Sg Gen Allegro <W:0.0>
	"Hornberger" N Prop Sem/Sur Sg Nom <W:0.0>
: 
"<1989>"
	"1989" Num Arab Sg Acc <W:0.0>
	"1989" Num Arab Sg Gen <W:0.0>
	"1989" Num Arab Sg Ill Attr <W:0.0>
	"1989" Num Arab Sg Loc Attr <W:0.0>
	"1989" Num Arab Sg Nom <W:0.0>
	"1989" Num Sem/Year Sg Acc <W:0.0>
	"1989" Num Sem/Year Sg Gen <W:0.0>
	"1989" Num Sem/Year Sg Ill Attr <W:0.0>
	"1989" Num Sem/Year Sg Loc Attr <W:0.0>
	"1989" Num Sem/Year Sg Nom <W:0.0>
"<:>"
	":" CLB <W:0.0>
: 
"<289>"
	"289" Num Arab Sg Acc <W:0.0>
	"289" Num Arab Sg Gen <W:0.0>
	"289" Num Arab Sg Ill Attr <W:0.0>
	"289" Num Arab Sg Loc Attr <W:0.0>
	"289" Num Arab Sg Nom <W:0.0>
:\n
```


