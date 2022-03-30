Lingvistmøte smj & sme om tagger og adverber

Til stede: Inga, Sjur, Linda, Lene, Trond

#  Tagger

##  +Use/-Spell

Denne taggen er i bruk i noen språk:

```
+Use/-Spell       !!≈ * **@CODE@** Orthographically correct, typically perifer words, excluded in speller because they cause trouble for frequent words (fra sme root)

lang-sme lan000$ cut -d '!' -f1  src/fst/stems/* |grep 'Use/-Spell' |wc -l     33
lang-sme lan000$ cut -d '!' -f1  src/fst/affixes/* |grep 'Use/-Spell' |wc -l   70
lang-smj lan000$ cut -d '!' -f1  src/fst/stems/* |grep 'Use/-Spell' |wc -l     85
lang-smj lan000$ cut -d '!' -f1  src/fst/affixes/* |grep 'Use/-Spell' |wc -l   28

lang-sma lan000$ cut -d '!' -f1  src/fst/stems/* |grep 'Use/-Spell' |wc -l      0
lang-sma lan000$ cut -d '!' -f1  src/fst/affixes/* |grep 'Use/-Spell' |wc -l    3

lang-sms lan000$ cut -d '!' -f1  src/fst/stems/* |grep 'Use/-Spell' |wc -l      0
lang-sms lan000$ cut -d '!' -f1  src/fst/affixes/* |grep 'Use/-Spell' |wc -l   14
lang-smn:                   0
 ```

Linjene med denne taggen blir ikke med i normativ HFST. Vi diskuterte bruken.

TILTAK:

* **Inga** ser på bruken i smj, **Lene** ser på og samler dokumentasjon i et felles dokument som **Inga** oppretter. De fjerner tagger som ikke har funksjon lenger, dvs at vi har andre løsninger. 
* Deretter skal vi diskutere denne taggen på nytt.
[Dokumentasjonsdokument](https://giellalt.github.io/lang/smi/minusspelltag.html)

##  +G3  
Denne taggen blei inført for å skille mellom homonymi i sme, mellom likestavelsesstammer som som vuorru og vuor'ru, og deretter utvida til også ord som ikke har homonymer, hvor det ikke skilles i skriftspråk mellom G2 og G3. Tilsvarende +G7 for dem som har G3 uten stadieveksling. I smj er den brukt på alle ord med slike geminater, uansett stamme. Dette var med tanke på TTS. Det blir ikke bruk for taggen for TTS, og derfor kan den fjernes, og beholdes kun for ord som trenger den for å skille mellom homonymer i Sg Nom.

#  Adverb

Det har etterhvert blitt leksikalisert mange ord i adverbfila som kanskje ikke burde være der.

Iflg. Sammallahti 2007 er adverb bl.a. ord som ikke har lenger har fullt substantivparadigme. Vi bør derfor fjerne ord som har omtrent samme betydning som substantivet, f.eks. `ruovttus`, som i PS ordbok ikke er oppslagsord, mens ruoktot er det. Dette må følges opp i CG3-filer, dict og MT-filer.

TILTAK:
* **Inga** og **Lene** fjerner adverb som hører til et fullt substantivparadigme og som har omtrent samme betydning som substantivet (for sme kan vi bruke PS ordbok som referanse)


