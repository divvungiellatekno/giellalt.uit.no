Ling-møte om samansetjingar, og særleg kløyvde

Til stades: Duommá, Elena, Lene, Maja, Sjur

Sak: Korleis skal vi tagga *Kommunal-* i
*Kommunal- og moderniseringsdepartementet*?

Slik det ser ut no:

```
usmeNorm
oahppo-
oahppo-	oahppu+N+Cmp/SgNom+Cmp/SplitR+Cmp
oahppo-	oahppu+N+Cmp/SgNom+Cmp/SplitR
```

Det er ikkje bra. For å kunna handtera alle samansetjingsformer under eitt, så
endrar vi alle språk slik at dei alltid bruker taggen `+Cmp` ved alle
samansetjingar, inklusive stranda fyrsteledd i kløyvde samansetjingar.

Vi såg òg kort på samansetjingar med sitatform i fyrstelekken, dvs utan
vokalreduksjon av stammevokal (i nordsamisk):

```
$ echo oahppu- | lookup -q src/analyser-gt-norm.xfst 
oahppu-	oahppu-	+?
```

Men:
```
$ echo oahppu-sátni | lookup -q src/analyser-gt-norm.xfst 
oahppu-sátni	oahppu	+N+Sg+Nom+Cmp/Cit+Cmp/Hyph+Cmp#sátni+N+Sg+Nom
oahppu-sátni	oahppu	+N+Cmp/SgNom+Cmp/Hyph+Cmp#sátni+N+Sg+Nom
oahppu-sátni	oahppat	+V+TV+Imprt+Du1+Cmp/Cit+Cmp/Hyph+Cmp#sátni+N+Sg+Nom
```

Her er den andre analysen feil og skal fjernast, medan taggen `+Cmp/Hyph` i
den fyrste analysen er overflødig - alle `+Cmp/Cit` blir alltid skrivne med
bindestrek!
