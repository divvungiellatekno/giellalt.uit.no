Originalnotatar fins [her](http://piratepad.net/uR17JyFClJ).

Opne tema:
* korleis representera fleirtydig segmentering
* korleis kløyva ordform når kohort skal delast i to (etter at fleirtydig segmentering har vorte gjort eintydig)

Jf [http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=2162]

Bakgrunn: Vi bruker perl-script
* preprocess
* lookup2cg (som omformer formatet for vislcg3 og rydder lingvistisk: fjerner analyse med # når det er analyse uten #)

Vi kan ikkje ha perl-skript i korkje grammatikkontrollen eller i
maskinomsetjinga. Per i dag bruker MT-prosessen andre rutinar, som gjer at
MT-disambigueringa gjev andre (og som regel dårlegare) resultat enn det vi får i
Giella-infraen. Arbeidet med grammatikkontrollen nyttar inntil vidare den gamle
løysinga, som kan gje feil datagrunnlag og difor feil reglar i høve til dei
analysene vi kjem til å få når perl-skripta er borte.

Døme:

```
echo skuvlabusse | usmedis
skuvlabusse        skuvla+N+Sem/Edu_Org+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Acc
skuvlabusse        skuvla+N+Sem/Edu_Org+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Nom
skuvlabusse        skuvla+N+Sem/Edu_Org+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Gen+Allegro
skuvlabusse        skuvla+N+Sem/Edu_Org+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Gen
skuvlabusse        skuvla+N+Sem/Edu_Org+Err/Orth+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Acc
skuvlabusse        skuvla+N+Sem/Edu_Org+Err/Orth+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Nom
skuvlabusse        skuvla+N+Sem/Edu_Org+Err/Orth+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Gen+Allegro
skuvlabusse        skuvla+N+Sem/Edu_Org+Err/Orth+Cmp/SgNom+Cmp#busse+N+G3+Sem/Ctain-clth_Veh+Sg+Gen
skuvlabusse        skuvlabusse+N+G3+Sem/Veh+Sg+Acc
skuvlabusse        skuvlabusse+N+G3+Sem/Veh+Sg+Nom
skuvlabusse        skuvlabusse+N+G3+Sem/Veh+Sg+Gen+Allegro
skuvlabusse        skuvlabusse+N+G3+Sem/Veh+Sg+Gen

echo skuvlabusse | usmedis | lookup2cg
"<skuvlabusse>"
         "skuvlabusse" N G3 Sem/Veh Sg Gen
         "skuvlabusse" N G3 Sem/Veh Sg Nom
         "skuvlabusse" N G3 Sem/Veh Sg Gen Allegro
         "skuvlabusse" N G3 Sem/Veh Sg Acc
```

Grammatikkontrollen kan ikke være avhengig av perl

Ved derivasjon: ordklassetagger ved før Der/.. fordobles ved
analyser-disamb-gt-desc. og analyser-mt-apertium-desc (tidligere fikk disse
`*` i lookup2cg):

```
borragoahtit        borrat+VV+TV+Der/InchL+V+Inf
sme$ echo 'borragoahtit' | usmedis | lookup2cg
"<borragoahtit>"
         "borrat" V* TV Der/InchL V Ind Prs Pl1
         "borrat" V* TV Der/InchL V Inf
```


Preprosess: problem er flertydighet ved MWE. Eks:

```
* Mii bođiimet 3. beaivve.
Mii
bođiimet
3.
beaivve
.

* Geahča kapihttala 3.
Geahča
kapihttala
3
.
```

Særskriving - døme frå norsk:
```
    folk gjer alt slags [allslags] rare ting:

    Etter som [ettersom]      vi alle er forskjille

    Folk kan ha ulike vaner og leve måter [levemåter]

    eller andre hjemme lekser [hjemmelekser]

    generell PC bruk [PC-bruk]

    hørte ingen ting [ingenting, men tvetydig]

    bruke en borre maskin [borremaskin]

    brukes til lys armatur [lysarmatur]

    tok begge ledningene unden i fra [undenifra?]

    som enpol og topol bryter [enpols- og topolsbryter]

    å være med et gjeng kan og så [også] på virke [påvirke] kebabnorske
```

Fleire døme:
```
"<vass vegen>"
  "vatnveg"
  "veg"
    "vatn"
  "veg"
    "vasse"

"<vass vegen>"
  "vatnveg"

"<vass>"
  "vatn"

"<vegen>"
  "veg"

"<3.parts vegen>"
  "veg" N
    "part" N
      "." PUNCT
        "3" Num
  "partsveg" Cmp/Err
      "3." Adj
  "partsveg" Cmp/Err
      "." PUNCT
        "3" Num
```

Døme frå SME:
```
sme$ echo beavdebiigá | usme
beavdebiigá        beavdi+N+Cmp/SgNom+Cmp#biigá+N+Sg+Nom
beavdebiigá        beavdebiigá+N+Sg+Nom

"<beavde biigá>"
```

Forslag til prosessering:

INPUT:

* `Ta 3. Også`

Etter hfst-tokenise:
```
"<Ta>"
        "ta" Verb Inf "<Ta>"
        "ta" Verb Imp "<Ta>"
"<3.>"
        "3" Num "<3>"
                "." PUNCT "<.>"
        "3." Adj Ord "<3.>"
"<Også>"
        "også" Adv "<Også>"
```

Etter mwe-disambiguering:
```
"<Ta>"
        "ta" Verb Inf "<Ta>"
        "ta" Verb Imp "<Ta>"
"<3.>"
        "3" Num "<3>"
                "." PUNCT "<.>"
"<Også>"
        "også" Adv "<Også>"
```

Etter formatfiksing:
```
"<Ta>"
        "ta" Verb Inf
        "ta" Verb Imp
"<3.>"
        "3" Num
"<.>"
        "." PUNCT
"<Også>"
        "også" Adv
```

Etter (vanleg) disambiguering:
```
"<Ta>"
        "ta" Verb Imp
"<3.>"
        "3" Num
"<.>"
        "." PUNCT
"<Også>"
        "også" Adv
```

SME-døme:
```
echo munhan | usme
munhan        mun+Pron+Pers+Sg1+Nom+Foc/han

echo 'mun han' | preprocess | usme
mun        mun+Pron+Pers+Sg1+Nom
han        han+Pcle
```

Input: `leaba` vs `lea ba`

Noverande prosessering:
```
echo 'leaba' | preprocess | usme | lookup2cg
"<leaba>"
         "leat" V IV Ind Prs Du3
         "leat" V IV Ind Prs Sg3 Foc/ba

echo 'lea ba' | preprocess | usme | lookup2cg
"<lea>"
         "leat" V IV Ind Prs Sg3
"<ba>"
         "ba" Pcle
```

Ny prosessering:

Etter hfst-tokenise:
```
"<leaba>"
  "ba" Pcle
    "leat" V IV Ind Prs Sg3
  "leat" V IV Ind Prs Du3
```

Etter mwe-disambiguering:
```
"<leaba>"
  "ba" Pcle
    "leat" V IV Ind Prs Sg3
; "leat" V IV Ind Prs Du3
```

→ kor deler me opp leaba (kva er form til første kohort, kva er form til andre)?
→ ordformskløyving ved kohortkløyving

Sjur sine forslag til framgangsmåte:
* senda ordform gjennom fst som finn grenser (ordform -> ord#form). Problem: fleirtydige grenser
* generera ordform med grenser ut frå analysen vi har kome fram til. Problem: overgenerering, fleirtydig generering

```
"<lea>"
  "leat" V IV Ind Prs Sg3
"<ba>"
  "ba" Pcle
```

(Dette siste blir input til vanleg disambiguering, og er altså *identisk* med
«lea ba»-analysen kor me har mellomrom.)

Fleire døme:
```
~$ echo skuvlabeavdeliidni | usme | lookup2cg
"<skuvlabeavdeliidni>"
         "skuvlabeavde#liidni" N Sg Nom
         "skuvla#beavdeliidni" N Sg Nom
         "skuvla#beavde#liidni" N Sg Nom

 Define morphology @bin"analyser-disamb-gt-desc.hfst" ;
  Define blank           Whitespace | Punct ;
  Define morphoword       morphology                   LC([blank | #]) RC([blank ]( # ));
  Define morphowords      morphology % :%# morphology LC([blank | #]) RC([blank ]( # ));
  Define token [ morphoword ]( morphowords ) EndTag(token);
regex token ;

<vaikko> <mii> bođiimet =
sjølom     vi  kom
doppe lei <vaikko mii> =
der   var   hva som helst

vaikko mii

<lei vaikko> mii

morphology % :%# morphology    intersection    morphology
<vaikko>    < >  <mii>                         <vaikko mii>

<lei vaikko>                                  *<lei vaikko>

vaikko% mii+Pron+Indef+Sg+Nom:vaikko% mij K-son ;

$ echo vaikko mii | ~/src/hfst/tools/src/hfst-tokenize --cg  -kawu: kbu-tokeniser.pmhfst
"<vaikko mii>"
         "mii" Pron Indef Sg Nom
                "vaikko" CS <W:0>
         "mii" Pron Interr Sg Nom
                "vaikko" CS <W:0>
         "mun" Pron Pers Pl1 Nom
                "vaikko" CS <W:0>
         "mii" Pron Rel Sg Nom
                "vaikko" CS <W:0>
         "mii" Pron Indef Sg Nom
                "vaikko" Adv Sem/Time <W:0>
         "mii" Pron Interr Sg Nom
                "vaikko" Adv Sem/Time <W:0>
         "mun" Pron Pers Pl1 Nom
                "vaikko" Adv Sem/Time <W:0>
         "mii" Pron Rel Sg Nom
                "vaikko" Adv Sem/Time <W:0>
        "vaikko mii" Pron Indef Sg Nom <W:0>
:\n

sme$ echo 'vaikko mii' | preprocess | usme | lookup2cg
"<vaikko>"
         "vaikko" Adv
         "vaikko" CS
"<mii>"
         "mii" Pron Indef Sg Nom
         "mii" Pron Interr Sg Nom
         "mun" Pron Pers Pl1 Nom
         "mii" Pron Rel Sg Nom
"<vaikko mii>"
        "vaikko mii" Pron Indef Sg Nom
```

Dvs, nytt oppsett blir:
```
tekst inn | hfst-tokenize | mwe-disamb | cohort-reorg | disamb...
```

Jf med gamalt oppsett er det noko i stil med:
```
hfst-tokenize + mwe-disamb = preprocess + analyse + "lookup2cg"
```

Neste steg:
1. Sjur legg inn særskrivingsanalyse i lexc, men fjernar dei frå alle fst-ar bortsett frå disamb.hfst
1. Kevin lagar ein fyrste mwe-disamb
1. Kevin og Sjur testar ut ulike måtar å finna ordformsgrenser på ved kohortkløyving
1. Kevin lagar cohort-reorg
1. evaluering
