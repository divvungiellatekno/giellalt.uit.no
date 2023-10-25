# Lingvistmøte i Divvun

Saker:
* gjennomgang av -ella-leksikonet i smj
* gjennomgang av yaml-testinga, eksempel frå sma
* [The snjierrá bug](http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=1436)
* Bugzilla
* IJVE-bug i sma?

# gjennomgang av -ella-leksikonet i smj

Vi gjekk i gjennom, og omstrukturerte. Jf. svn-logg og innsjekking r62892.

# Bugzilla

Lukk buggar når dei er fiksa!

# Gjennomgang av yaml-testinga, eksempel frå sma

Alle har: `yaml tests enabled: no`, så vi hoppar over det no. Sjur installerer det som trengst i Tromsø neste veke.

# The snjierrá-bug

[http://giellatekno.uit.no/bugzilla/show_bug.cgi?id=1436]

The bad and the ugly suggestion:

```
snjierrá: SNJIERRÁ ;

LEČICON SNJIERRÁ
:snjierrá MUORRA ;
:sjnjierrá MUORRA ;

snjiltjas: SNJILTJAS ;

LEČICON SNJILTJAS
:snjiltjas SJÆVNNJAT ;
:sjnjiltjas SJÆVNNJAT ;
```

The good suggestion:
Use a twol rule :) - Done! Bug solved.

# IJVE-bug i sma?

Det var ïjve i lemma, men ijve i stammen, dermed kræsja lemmatesten. No er alle lemma endra til norm-form, og buggen er fiksa.
