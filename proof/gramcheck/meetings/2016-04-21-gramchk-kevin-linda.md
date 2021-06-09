Grammar Checker meeting 22.04.2016

Present:
* Linda
* Kevin

Tema:
* web demo: http://gtweb.uit.no/gc/
* grammarchecker developer test
* håndtering av flerordsuttrykk

# web demo

* Correct regel men ikkje forslag - melde ifra til Kevin
* Gi Kevin gode testeksempler 

# grammarchecker developer test

* legge til statistikk om kosjn feiltagger fins i testkorpuset + frekvens

# håndtering av flerordsuttrykk

* legge til terskel: frekvens, leksikalisering, morfofonologi
* eksempler:
    - skuvla busse -- veldig sannsynlig at det er en feil, eller 50%/50%
    - skuvla busses -- noe sannsynlig at det er en feil
    - bárdni busse - veldig usannsynlig at det er en feil
* Err/SpaceCmp
* Når kan nominativ nominativ sekvensen (N Nom) (N Nom) (N Nom) (N Anycase) eller være korrekt
    - Mun lean oahpan ollu sánit odne: bárdni skuvla busse ...
    - Leago bárdni busses?
    - Bárdni olmmoš lea.
    - fylkkagieldda ja stáhta orgána mas lea bálvalanviidodahkan olles gielda dahje oassi gielddas
    - Guolásteapmi biebmanrusttegiid lahka

Numerical Matches in CG:

* <W>65>
* <W:10> - utgangspunkt vekt 0, 10 er tyngre, altså mindre sannsynlig
* SELECT (N) IF (-1 (<W<65>));
* skuvlabusse <F:300> frequency
* skuvla busse <F:5> frequency

# Kommandoer

* disambiguerer flerordsuttrykk:\\
  `echo dalle go |hfst-tokenise --giella-cg $GTHOME/langs/sme/tools/preprocess/tokeniser-disamb-gt-desc.pmhfst | vislcg3 -g $GTHOME/langs/sme/tools/preprocess/mwe-dis.cg3`
* siste deler flerordsuttrykk opp i egne kohorter:\\
 `echo dalle go |hfst-tokenise --giella-cg $GTHOME/langs/sme/tools/preprocess/tokeniser-disamb-gt-desc.pmhfst | vislcg3 -g $GTHOME/langs/sme/tools/preprocess/mwe-dis.cg3 | cg-mwesplit`
* `echo Leago skuvla busses? |hfst-tokenise --giella-cg $GTHOME/langs/sme/tools/preprocess/tokeniser-disamb-gt-desc.pmhfst`
* bruk av &SUGGEST-programmet: prøver å generere former (i pipeline etter grammatikkontroll):\\
 `divvun-suggest generator-gt-norm.hfstol errors.xml | divvun-suggest $GTHOME/langs/sme/src/generator-gt-norm.hfstol $GTHOME/langs/sme/tools/grammarcheckers/errors.xml`

# Todo

* lage statistikk på sammensetninger som kan brukes for CG-regler
CG-tag
