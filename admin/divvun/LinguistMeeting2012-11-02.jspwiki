# Lingvistmøte

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* Derivasjon eller leksikalisering?
* fixa feil i testresultata for lemmatesting
    - *ishockeyhistovrije* - R vs standard
    - *orre*
    - *stoere*

# Derivasjon eller leksikalisering?

Ja takk!

Men: for stavekontrollen kan det vera bra å slå av visse derivasjonar, og heller leksikalisera, for å få ein mindre stavekontroll.

# Fixa feil i testresultata for lemmatesting

## historie-

ishockeyhistovrije - isolert form
ishockeyhistorije/-a - i samansetjingar?

```
ishockeyhistovrije + gærja = ??? ishockeyhistovrijegærja

ishockeyhistoriagærja - sub
ishockeyhistoriegærja - standard
ishockeyhistovrijegærja - standard + lemma
```

## orre + stoere (bug 1463)

[http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=1463]

orre
stoere

stems-adj:
```
stoere: STOERE ; !LA
```

affiks-adj:
```
LEXICON STOERE  ! This is hopeless, stoerebe-stoeremes bør subbes, men hvorfpor går det ikke?
        :stoerr e_E_EVENNOCOMP ;
+Err/Sub:stoer  e_E_EVEN ;
+Err/Sub:stuerre EVENCOMPONLY ;
+Err/Sub:stoerre EVENCOMPONLY ;
                 STOERE_COMP ;

LEXICON STOERE_COMP
         :stuerie EVENCOMPONLY ;
 +Err/Sub:stuerie EVENSUPONLY ;
         :stööre  MES ;
         :stuerie DIMCOMP ;  
```

**GJERELISTE:**
* rett opp alle hist tilsvarande (**MLK**)
* skriv om og slå saman leksikona STOERE, NOERE, ORRE til eitt (**alle**)
    - på neste møte :)
    - bygg ut yaml-tester for noere og stoere, attr.pred+comp+kasus

# Andre feil

## SMA

```
        - ERROR: Sublexicon is mentioned but not defined. (ah_AH_AN_ODD) ***
        - Warning:  Sublexicons defined but not used:
      ATTR_ODD
```
