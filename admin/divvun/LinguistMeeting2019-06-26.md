# Graammatikkontrollmøte 26.6.2019

saker:

VI MÅ VITA AT VI KLARAR Å FANGA OPP ALLE FEIL SOM STAVEKONTROLLEN FANGA TIDLEGARE!

Dvs vi må testa med same materiale, både stavekontroll og gramcheck-stavekontroll, og sjå at vi finn (minst) like mange feil, og at det er dei same feila vi finn.

Etter det kan vi sjå på andre ting.

# convert2xml

* funkar ikkje med correct-no-gs - bruk --goldstandard, så blir ting lagt i rett mappe(tre)

# ccat

* må gje heile setningar/avsnitt utan å leggja til blankteikn før komma, punktum, osb
** ekstra mellomrom blir lagt til når det kjem ein sluttagg (t.d. for ein feil) rett før teiknet
** dvs at alle skrivefeil+teiknsetting automatisk gjev dobbelt feil pga ekstra mellomrom
* ingen ¶ på slutten av kvart avsnitt, heller ei tom line (styrt med parameter?) - det er fjerna i testbenken, men burde òg kunna fjernast direkte med ccat

# gramcheck.py:

* må kunna ta som argument om det er evaluering (=goldstandard) eller utvikling (=correct-no-gs)
* statistikk over identifiserte feil:
** total mengde feil
** kor mange feil for kvar feiltype (typo er det mest interessante no, for å jamføra med stavekontrolltestinga)
* precision/recall
* utvikling eller evaluering (sjå over)
* både lukka og ope korpus

# Anna

* vi må ha 20% testmateriale for sma og smj òg
