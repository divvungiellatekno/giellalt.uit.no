Møte om MWE 20.3.2018

#  Feilskrivne fleirordsuttrykk (manglande mellomrom)

Korleis skal vi handtera (feilskrivingar av) fleirordsuttrykk, og særleg dei som
ikkje er ekte fleirordsuttrykk, men der vi ynskjer analyse av kvart enkelt ord?

Utgangspunkt: analysen og leksikonoppføringa av
`viđa jagi` vs `*viđajagi` vs `viđa` + `jagi`

Fyrst;
```
viđajagi+Err/Lex:viđajagi adv ;
```

Deretter:
```
viđa% jagi+Err/Orth:viđajagi adv ;
viđa% jagi:viđa% jagi adv ;
```

Problemet med den siste over er at vi då får *berre* adv-analysen av
`viđa jagi`, istf analysen av kvart enkeltord.

Løysinga er å koda slike feilskrivne fleirordsuttrykk slik:
```
< {viđa} "@P.Pmatch.Backtrack@" { jagi}> adv-time ;
viđa% jagi+Err/MissingSpace:viđa∑#jagi adv-time ;
```

Tilsvarande for sma:
`daen biejjien` (korrekt) vs `daenbiejjien` (feil). Dette kan fangast opp på
denne måten for òg å få opp korrekt analyse av enkeltorda når uttrykket er
skrive som to separate ord:

```
< {daen} "@P.Pmatch.Backtrack@"       { biejjien}> adv ;
   daen% biejjen+Err/MissingSpace:daen∑#biejjien adv ;
```

# Korrekt måte å tagge leksikalsierte feilskrevne MWE uttrykk på

Frå `sme/root.lexc`:

* **@P.Pmatch.Backtrack@**:  Used on single-token analyses; tell hfst-tokenise/pmatch to backtrack by reanalysing the substrings before and after this point in the form (to find combinations of shorter analyses that would otherwise be missed)

Eksisterande bruk av det symbolet:

```
< {Guovdageainnu} "@P.Pmatch.Backtrack@" { suohka} n:"n9" "+MWE":0 > LONDON-org ;
gii@P.Pmatch.Backtrack@% nu+MWE+Pron+Indef+Sg+Nom:gii@P.Pmatch.Backtrack@% nu # ;
```

# MWE-taggen

* **+MWE**:  MultiWord Expression, blir brukt av gamal (perl-basert) preprocess og i
MT til å analysera fleirordsuttrykk som eitt token. Dvs at andre leksikaliserte
fleirordsuttrykk *utan* denne taggen blir *ikkje* analyserte som
fleirordsuttrykk. Med ny tokenisering (basert på hfst-tokenise) vil *alle*
leksikaliserte fleirordsuttrykk bli analyserte som det, uavhengig av
`+MWE`-taggen.

```
viđa% jagi+MWE:viđa% jagi adv ;
```

Eksempel på +MWE for MT:
```
Sámegiela% ja% sámi% girjjálašvuođa% mastergrádaoahppu+MWE+CmpNP/None:Sáme#giela% ja% sámi% girjjálašvuođa% master#gráda#oahppu MARJA-U-obj ;
```

Fra Gïelegaaltije: Propernoun
```
Peedagogihke-psykologihke% viehkie+MWE:Peedagogihke-psykologihke%  viehk N_IE; ! «Collection:Dååhkesjahteme_skole» «Education:pedagogisk-psykologisk tjeneste»
```

# LIA-materiale

Det blir no lagt inn med `+Err/Lex`:

```
meieri+Err/Lex+Sem/Org:meieri STAHTA ;  !LIA
medleamma+Err/Lex+Sem/Hum:medleam'ma GOAHTI-A ;  !LIA
øyeblihkka+Err/Lex+Sem/Time:øyeblihkka GOAHTI-A ; !LIA
teve+Err/Lex+Sem/Dummytag:teve STAHTA ;  !LIA

nittensyvogtredve+Num+Sg+Nom+Err/Lex:nittensyvogtredve K ; !LIA
tredve+Num+Sg+Nom+Err/Lex:tredve K ; !LIA
syvogtredve+Num+Sg+Nom+Err/Lex:syvogtredve K ; !LIA
førti+Num+Sg+Nom+Err/Lex:førti K ; !LIA
```

Det er ei ok løysing inntil vidare.
