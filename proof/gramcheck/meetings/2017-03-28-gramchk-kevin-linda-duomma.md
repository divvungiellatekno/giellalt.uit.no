#  variablar/templat for feilmeldingar

Du kan no skriva

```
<error id="syn-blah-not-meh">
 <header>
  <title xml:lang="se">«$1» ja «$2» leaba bla .</title>
```

i errors.xml og ha

```
ADD (&syn-blah-not-meh) TARGET ("kake") IF (*);
ADDRELATION ($2) (&blah) TO (1 ("meh" Pcle)) ;
```

i cg3, så blir $2 til formen av "meh" og $1 blir til formen av det ordet som hadde &syn-blah-not-meh, slik at feilmeldinga blir td. "«kake» ja «meh» leaba bla".

t.d.
```
  <error id="syn-not-dego">
    <header>
      <title xml:lang="en">there should not be "$1" if "$2" is essive</title>
      <title xml:lang="se">ii galgga leat "$1" jus "$2" lea essiiva</title>
      <references> <ref n=""/></references>
    </header>
    <body>
      <description xml:lang="en">there should not be "dego"</description>
      <description xml:lang="se">ii galgga leat "dego"</description>
    <examples>
      <ex xml:lang="se">SNF doaibmá dál juo {dego} resursaguovddážin.</ex>
    </examples>
    </body>
  </error>

  ADDRELATION ($2) (&syn-not-dego) TO (1 Ess) ;
```

#  Feilgruppering

```
"<dego>"
         "dego" CS <W:0> @CNP MAP:7695:r10 &syn-not-dego #5->5 ID:5  R:RIGHT:6 ADD:9590:syn-not-dego  ADDRELATION(RIGHT):9600:syn-not-dego-TO-syn-dego-nom
syn-not-dego
        "dego" CS <W:0> @CNP MAP:7695:r10 &DELETE #5->5 ID:5 R:RIGHT:6 COPY:9594:syn-not-dego
DELETE
* **"de" Adv Qst <W:0> REMOVE:5794**: r1076
* **"dego" CS <W:0> @CVP MAP:7695:r10 REMOVE:7830**: r1451
* **"go" Pcle Qst <W**: 0> "<go>"
* **"de" Adv <W:0> "<de>" REMOVE:2072**: longest-match
:
"<resursaguovddážin>"
         "resursaguovddáš" N Sem/Plc Ess <W:0> @COMP-CS< MAP:7583:r432  &syn-dego-nom #6->6 ID:6 ADD:9597:syn-dego-ess
syn-dego-nom
         "resursaguovddáš" N Sem/Plc Ess Err/Orth <W:0> @COMP-CS<  MAP:7583:r432 &syn-dego-nom #6->6 ID:6 ADD:9597:syn-dego-ess
syn-dego-nom
         "resursaguovddáš" N Sem/Plc <W:0> @COMP-CS< MAP:7583:r432 Nom  Sg &syn-dego-nom &SUGGEST #6->6 ID:6 COPY:9598:syn-dego-ess
resursaguovddáš+N+Nom+Sg        ?
         "resursaguovddáš" N Sem/Plc Err/Orth <W:0> @COMP-CS<  MAP:7583:r432 Nom Sg &syn-dego-nom &SUGGEST #6->6 ID:6  COPY:9598:syn-dego-ess
resursaguovddáš+N+Err/Orth+Nom+Sg       ?
```

```
ADD:syn-not-dego (&syn-not-dego) TARGET ("dego") IF (*1 Ess BARRIER GRAMCHK-NPNH LINK NOT 0 Sem/Wthr OR ESSIVE-TIME-N LINK NEGATE -1 QMARK) (NEGATE *1 (Actio Ess) BARRIER GRAMCHK-NPNH LINK *-2 ("orrut") BARRIER GRAMCHK-S-BOUNDARY)(NEGATE *0 DEGO-ESS-V BARRIER V OR GRAMCHK-S-BOUNDARY);

ADD:syn-not-dego-part2 (&syn-not-dego-part2) TARGET (Ess) IF (-1 &syn-not-dego);
COPY:syn-not-dego (&DELETE) EXCEPT (&syn-not-dego) TARGET ("dego" &syn-not-dego) ;

ADD:syn-dego-nom (&syn-dego-nom) TARGET (Ess) IF (-1 &syn-not-dego);
COPY:syn-dego-nom (Nom Sg &SUGGEST) EXCEPT (Ess) TARGET (Ess &syn-dego-nom) ;

ADDRELATION (RIGHT) (&syn-not-dego) TO (1 &syn-dego-nom)

```

```
"<dego>"
    "dego" CS @CVP &syn-not-dego ID:1 R:RIGHT:2
    "dego" CS @CVP &syn-not-dego &DELETE ID:1 R:RIGHT:2
:
"<lávvomuorran>"
    "lávvomuorra" N Sem/Dummytag Ess @COMP-CS< &syn-dego-nom ID:2
    "lávvomuorra" N Sem/Dummytag @COMP-CS< Nom Sg &syn-dego-nom &SUGGEST ID:2
```

pga. R:RIGHT:2 så er desse to orda ein feilgruppe, og i staden for at dego får eitt forslag og lávvomuorran eitt forslag, så får «dego lávvumuorran» ulike forslag «lávvomuorran» vs «dego lávvomuorra…»

* hvis vi har mer enn en feiltag på samme ord så må vi ha med feiltaggan med på SUGGEST for å vite ka forslaget hører til
    - altså ikkje lenger COPY (Nom &SUGGEST) EXCEPT (Ess &feiltagg), men berre COPY (NOM &SUGGEST) EXCEPT (Ess)
* viss ord skal grupperast i same «feilgruppe», legg på ein relasjon på ordet til lengst til venstre som peiker på ordet lengst til høgre
* relasjonen skal helst gå fra det første ordet til det som følger etter enn omvendt

Vi vil altså generere 2 alternative forslag, der det må komme fram at de er alternative. I tillegg er det det ene
ordet som forandres i forslag nr.1, og det andre ordet i forslag nr. 2.

vi treng en konkret feil som kan løses på to forskjellige måter eller flere
og der man må forandre på flere ord(former) for å rette på feilen
leagus ovdamearka?
kommer ikke påå nåt nu, mer enn "áidna", og den var d jo ikke lov til :/
kanskje vi ser i regelfila etter part2 regler

den er enkel og grei:
mon álggán bargagoahtit
forslag1: - bargagoađán
forslag2: álggán bargat

Det kan òg vera at me vil foreslå endring i begge ord, men «gruppert» slik at me får

input:      forslagsalternativ:
ord1 ord2 →  (ord1 ord3)
                      (ord4 ord5)
men me vil *ikkje* foreslå «ord1 ord5» eller «ord4 ord3».

T.d.

«liker og været» → «liker å være» vs «liker òg vêret», men ikkje «liker og været» eller «liker å vêret» osb.

Så forslaga som høyrer i hop må vera relaterte. Relasjonar går frå reading til cohort (ikkje reading til reading), så me bør ha same feiltagg på det som høyrer i hop, i tillegg til ein relasjon som seier kva streka skal dekka.

##  gammal epostutveksling
SUGGEST1 SUGGEST2
========= =========
dego DELETE CORRECT
lávvomuorran Ess CORRECT Nom

dego lávvomuorran ->
1. - lávvomuorran
2. dego lávvomuorra

Tenkte å kanskje bruke syn-not-dego-part1 + syn-not-dego-part2 for SUGGEST1 og syn-not-dego2-part1 +
syn-not-dego2-part2 for SUGGEST2 for å relatere begge to.
Ka må vi ta hensyn til når vi genererer forslag Kevin?

Ja, me må nok ha nokre endringar i korleis me markerer feil/forslag, for
å handtera det å ha ulike feiltypar på same ord.

Det me får no, etter gc.cg3, er:

  "<dego>"
          "dego" CS <W:0> @CNP &syn-not-dego
          "dego" CS <W:0> @CNP &DELETE

  "<lávvomuorran>"
          "lávvomuorra" N Sem/Dummytag Ess <W:0> @COMP-CS< &syn-not-dego-part2
  "<.>"

Eg trur i det minste me bør bruka relasjonar når forslaget gjeld fleire
ord – elles er det ingenting i taggen som seier at denne -part2-en gjeld
akkurat ordet som står 1 posisjon til venstre (og ikkje t.d. eit ord som
var ein heilt annan stad i setninga og hadde same feiltagg).

Det kan jo òg tenkast at me vil ha fleire &SUGGEST-readings med ulike
feiltypar; men slik me har det no, står jo &SUGGEST-lesinga for seg
sjølv, og då går det ikkje an å sjå kva feiltagg &SUGGEST-lesinga høyrer
til:

  "<lávvomuorran>"
          "lávvomuorra" N Sem/Dummytag Ess <W:0> @COMP-CS< &syn-not-dego-part2
          "lávvomuorra" N Sem/Dummytag Ess <W:0> @COMP-CS< &syn-dego-nom
          "lávvomuorra" N Sem/Dummytag Nom <W:0> @COMP-CS< &SUGGEST
  "<.>"

Her er eit alternativ som eg trur representer den nødvendige
informasjonen:

  "<dego>"
          "dego" CS <W:0> @CNP ID:11

  "<lávvomuorran>"
          "lávvomuorra" N Sem/Dummytag Ess <W:0> @COMP-CS< &syn-not-dego R:DELETE1:11
          "lávvomuorra" N Sem/Dummytag Nom <W:0> @COMP-CS< &syn-dego-nom &SUGGEST
  "<.>"

Her blir «lávvomuorran» det (einaste) ordet som ber feiltaggane; og éi
lesing på feiltagg-ordet inneheld informasjonen som trengst for å
generera forslaget. &SUGGEST-lesinga må då ha feiltaggen på seg, sidan
det er ein annan feiltype.
* sjå forslaget over; relasjonar går frå reading til cohort, ikkje reading til reading, så det er nok betre å berre bruka relasjonar til å seia kor langt streka skal gå, og så gruppera forslag som har same feiltagg.

Eg kom på ein relatert situasjon: Vil me nokon gong ha &SUGGEST på same
feiltype (same lange strek) som strekk seg over minst to ulike ord? Me
kan då bruka ein R:RIGHT/R:LEFT på det ordet som er lengst vekk som skal
inkluderast i understrekinga som éin og same feil:

  "<grønt>"
          "grøn" A Pst Sg Ind Neut
          "grøn" A Pst Sg Ind Masc &SUGGEST &så-veldig-feil-masc R:RIGHT:42
          "grøn" A Pst Sg Def &SUGGEST &så-veldig-feil-def

  "<osten>"
          "ost" N Masc Sg Def ID:42
          "ost" N Masc Sg Ind &SUGGEST &så-veldig-feil-masc
  "<.>"

(forslaget «grøn ost» er då eitt forslag med berre ein strek over
begge orda)

##  ADDRELATION, ADDRELATIONS
```
      [wordform] ADDRELATION <name> <target> [contextual_tests]
          TO|FROM <contextual_target> [contextual_tests] ;
      [wordform] ADDRELATIONS <name> <name> <target> [contextual_tests]
          TO|FROM <contextual_target> [contextual_tests] ;


      ADDRELATION creates a one-way named relation from the current cohort to the found cohort.       The name must be an alphanumeric string with no whitespace.
      ADDRELATION (name) targetset (-1* ("someword"))
        TO (1* (@candidate)) (2 SomeSet) ;


      ADDRELATIONS creates two one-way named relation; one from the current cohort to the found cohort,       and one the other way. The names can be the same if so desired.
      ADDRELATIONS (name) (name) targetset (-1* ("someword"))
        TO (1* (@candidate)) (2 SomeSet) ;


```

##  SETRELATION, SETRELATIONS
```
      [wordform] SETRELATION <name> <target> [contextual_tests]
          TO|FROM <contextual_target> [contextual_tests] ;
      [wordform] SETRELATIONS <name> <name> <target> [contextual_tests]
          TO|FROM <contextual_target> [contextual_tests] ;


      SETRELATION removes all previous relations with the name,       then creates a one-way named relation from the current cohort to the found cohort.       The name must be an alphanumeric string with no whitespace.
      SETRELATION (name) targetset (-1* ("someword"))
        TO (1* (@candidate)) (2 SomeSet) ;


      SETRELATIONS removes all previous relations in the respective cohorts with the respective names,       then creates two one-way named relation; one from the current cohort to the found cohort,       and one the other way. The names can be the same if so desired.
      SETRELATIONS (name) (name) targetset (-1* ("someword"))
        TO (1* (@candidate)) (2 SomeSet) ;


```
