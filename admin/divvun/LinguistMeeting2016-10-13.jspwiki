Møte om samansetjingar i språka våre

* samansetjingar og leksikonet FirstComponent - kva skal vi ha der, og kvifor?
* taggar for kortformer (-joh- for johka, -kultur- for kultuvra,
  sma: aamhtese-aamhtes,tjengkere-tjengker- 
  (Hasselbrink:ellision av siste vokal= ca. 2000 noun som peker til N_ODD, 2 )
  også kultur for kultuvre, )
* samansetjingsrestriksjonar: taggar vs leksikqon
  (+CmpNP/* vs FirstComponent & MiddleNouns) q- Xerox-kompatibilitet
    - skal vi ha same restriksjonar i norm-analysatoren som i stavekontrollen?
* kva er rett samansetjingsform? Attr, kort, SgNom, SgGen, PlNom, PlGen?
  Korleis skal det spesifiserast i leksikonet? sma: PLGen også i sma? - 
* Hyph-tagger
* feilanalyse (Err/SpaceCmp)
* lingvistiske stammer i compounding.lexc: LEXICON Prefixes, gir sammensetning
  uten Cmp tagg
    - flytte til stems?
    - hva skal leksikonet inneholde? bør være samme i alle språk

Her er alle dei opne Bz-meldingane eg har funne som handlar om samansetjingar:
* Bug 2153 - Cmp#+Der/lágan
* Bug 2154 - Cmp bør ha konsistente tagger
* Bug 1599 - cmp-form from generated cmps
* Bug 2213 - sammensetning av enstavelses navn fungerer ikke likt
* Bug 2099 - Proper compounds
* Bug 1490 - First part of Ani+Ani/Anipart-compound should be akk/gen
* Bug 2159 - Behandling av klitika og underlesninger i CG (om HFST)

Kategoriar:
* tagg-spørsmål
    - kompat. (sjå eige punkt)
    - tagg for kortform
    - hyph-taggar

* tekniske tema
    - hfst vs xerox
    - preprocess vs ap-preprocess (=hfst-proc)
    - mwe-disamb + mwe-split

* kompatibilitet mellom språk

* leksikonstruktur
    - FirstComponent
    - MiddleNouns og tilsvarande
    - Prefixes

* analyse
    - feilanalyse
    - kva er rett sms-tagging/form for kvart språk?

# Tekniske tema
##  hfst vs xerox

xfst vs. hfst
Normativ analysator (analyser-gt-norm.*) tillet meir enn stavekontrollen 
(tools/spellcheckers/fstbased/desktop/analyser-desktopspeller-gt-norm.hfst)

stavekontrollen har to typar avgrensingar:
* form: `+CmpN/*` - SgGen, SgNom, osb
* posisjon `+CmpNP/*` - First, Last, Prefix, None, Only, ...

Dei normative analsyatorane avgrensar med leksikon og +Err-taggar.

Både form- og posisjonstaggane blir konvertert til flaggdiakritika. Dei finst
berre på oversida. For å få dei på begge sidene bruker vi opersjonen
*dobbeltsidig-tag*, slik at eit flagg på ei side blir overført også til den
andre sida.

Denne operasjonen krasjar på Xerox.
Samtidig er Xerox raskast.

### Hastigheit

Denne hfst-konfigurasjonen er den raskaste, i snitt ca 2,5 gonger Xerox:
```
$ ./configure --with-hfst --without-xfst --enable-reversed-intersect --enable-alignment --with-backend-format=foma
```

### Normativitet

Alle -norm-fst-ar bortsett frå med Xerox skal ha same oppførsel som stavekontrollane, 
dvs at +CmpN-taggane blir teke omsyn til.
Dette betyr at Hfst og Xerox-fst-ane ikkje lenger er like, fordi Hfst vil bli
meir restriktiv enn Xerox.

**Sjur** legg inn endringane som trengst.

Vi vil ha møte for å diskutera normativitet for samansetjingar:
* torsdag 20.10. kl 10.00
    - hvem sier hva om sma-sammensetninger
    - korpus
    - oversikt

## mwe-disamb + mwe-split

```
Dán illu boddui lei son čiŋadan sámi gávttiin , ja dasa lassin lei son ivdnehahttán vuovttaid alit fiskadin , nugo juo Álttá ivnnit leat .

"<illu boddui>"
        "illuboddu" N Sem/Time Sg Ill Err/SpaceCmp <W:0> @ADVL> MAP:16752 &msyn-compound #2->2 ADD:8933:compound
msyn-compound
        "illuboddu" N Sem/Time Sg Ill <W:0> @ADVL> MAP:16752 &SUGGEST #2->2 COPY:8935:compound
illuboddu+N+Sg+Ill      illuboddui
* **       "boddu" N Sem/Time Sg Ill <W**: 0> "<boddui>"
* **               "illu" N Sem/Perc-emo Sg Nom <W**: 0> "<illu>"
: 
```

Analyse for samansetjingsfeil bør vi køyre gjennom heile korpuset, for dels å sjå
slike feil, sjå om vi kan få betre syntaktiske analyser, og få betre grunnlag for
grammatikkontrollarbeidet. Vi kjører først parallelt med xfst-analyse, og for å
sammenlikne resultatet og evt. finne ting som må rettes opp.

## preprocess vs ap-preprocess (=hfst-proc)

* Hos oss (grammatikkontroll): hfst-tokenize (eit supersett av xfst-formalismen)
* I Apertium: hfst-proc 

Sjur har meir sans for gramktrl-klitikonhandsaming enn det som blir gjort i
Apertium, men ut over det veit vi for lite om skilnadene.

Plan framover:
hfst-tokenize på beina hos oss: Først i grammatikkontrollen, og deretter i
korpusanalyse. Deretter kan vi evt. gå attende til MT og sjå om vi har noko
betre å tilby.

1. Få Kevin til å få hfst-oppdateringane inn i hfst-github
1. Oppdatere hfst lokalt hos oss
1. Setje opp pipeline og analysere korpus
