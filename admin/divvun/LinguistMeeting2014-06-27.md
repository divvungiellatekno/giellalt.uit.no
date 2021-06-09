Lingvist-møte 27.6.2014

* Til stades: Inga, Maja, Sjur

Saker:
* overgangen til neste smj-lingvist
* nye taggar

# overgangen til neste smj-lingvist

Stillinga lyst ut 26.6., søknadsfrist 27.7., oppstart 11.8. Vi satsar på å få
til ei veke i lag i Tromsø 11-15.8. (men det er avhengig av kor mange søkjarar
vi får om vi er klare til å starta då).

# nye taggar

Inga vil ha nye taggar: taggar for leksikaliserte derivasjonar, diminutivar og
andre. Diminutivane i smj har no eigne fortsetjingsleksikon, og det er enkelt å
leggja til taggar.

Moglege fordelar:
* info i korpuset (ein ser at ein derivasjon er ein derivasjon sjølv om han er
  leksikalisert)

Andre taggar:
* Dial/Sub
    - Vi har:
    - Inga vil ha dei med i normative fst-ar, men samtidig tagga slik at vi veit at 
   dei er marginale dialektformer
    - `+Dial/` merker av dialektformer, vi kunne ha `+DialN/` for å merka av
   former som øbryt med norma?
* Err/Sub - for å merka alt som ligg utanfor norma (=Sub)
* Use/LexSub - ein tagg med blanda semantikk (som må ryddast opp i) - unngå
  helst denne

Døme på dialektvariantar:
* abessiv: både gahperahtá og gahperahti
* pronomen: munje munji mune, suv suvva 
    - i sma:   munnjien, munnjan (den siste er Sub-a)

Forslag: vi legg ikkje på nye taggar, men dokumenterer variasjonen i pronomen
i lexc som kommentardokumentasjon.

Bruken av Dial-taggar:

```
Dial/-NOR
Dial/-SW

visionerra
visjonerra

akklamasjåvnnå+Dial/-SW:ak^klama INSTITUTION "acclamation N" ; 
akklamasjåvnnå+Dial/-NOR:ac^klama INSTITUTION ;  
illusjonissma+Dial/-SW:illusjoni FANATISM ; ! 
illusjonissma+Dial/-NOR:illutioni FANATISM ; 
```

Korleis tagga desse slik at svenskane får både *acklamasjon* og
*akklamasjon*?
Ved å tagga *acklamasjon* med `+Dial/SW` og la resten stå umerka. Ord som
bør drøfast med Giellagálldo kan merkast med ein kommentar `!GG` på slutten
av lina.
