# Lingvistmøte

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* samansette ord: kva slags reglar gjeld? mánnágárdde, mánájgárdde
* twolregler for adjektiver ies (attr) og vokal (pred)? se bug 1463 
* liste over verb, sub og adj - en oppdatert liste alá Tronds lister på ...sma/etc. 
* sjekk opp f.eks 'tjidtj'-aahka.
* låneord på -e i SMJ: uttalt -e: premie, serie; stum -e: skype, megabyte

# samansette ord

kva slags reglar gjeld? Døme: *mánnágárdde, mánájgárdde*.
Korleis lagar ein YAML-testar for slike ord?

* kva kan laga samansetjingar med kva?
* normativitet: heilt fritt vs meir avgrensa
* kva slags taggar blir brukt for samansette ord?

## kva kan laga samansetjingar med kva?

Alt blir regulert i R*-leksikona.

## normativitet: heilt fritt vs meir avgrensa

For dei fleste orda blir alle dei tre fylgjande kasus-numerus-kombinasjonane aksepterte av analysatoren (dvs. deskriptivt):

* Sg Nom
* Sg Gen
* Pl Gen

Men i normative samanhengar (som t.d. stavekontrollen) avgrensar vi samansetjingane med taggar på formen `+CmpN/*`:

* +CmpN/SgN
* +CmpN/SgG
* +CmpN/PlG

Default for nord- og lulesamisk er +CmpN/SgN, for sørsamisk er default +CmpN/SgN *og* +CmpN/SgG.

Døme på korleis normativ samansetjing blir koda i LexC:
```
advokáhtta+CmpN/SgN+CmpN/SgG+CmpN/PlG:advok ADVOKAT ; ! lager compounds i SgNom, SgGen, PlGen: advokáhttavirgge advokáhtajuolgge advokáhtajsiebrre

adværbba:adv ADVERB ; !lager bara i SgNom: adværbbahábme  *adverbahábme  *adverbajhábme
```

## kva slags taggar blir brukt for samansette ord?

```
$ usmj
advokáhttavirgge
advokáhttavirgge	advokáhtta+N+SgNomCmp+Cmp#virgge+N+Sg+Nom

$ dsmj
advokáhtta+N+SgNomCmp+Cmp#virgge+N+Sg+Nom
advokáhtta+N+SgNomCmp+Cmp#virgge+N+Sg+Nom	advokáhttavirgge
advokáhtta+N+SgNomCmp+Cmp#virgge+N+Sg+Nom	advokatvirgge
```

# twolregler for adjektiver

ies (attr) og vokal (pred)? se bug 1463

Dersom det er få adjektiv, blir kanskje twolc for mykje kanon for sporvane. Er det fleire adjektiv, blir det meir relevant å sjå på tonivåreglane.

**Oppgåve:**
* ta fram meir data - kor mange adjektiv har omlyd? (**Maja**)
* omlyd i vekslinga mellom attr og pred (**Maja**)
* omlyd i kompareringa (**Maja**)

# liste over verb, substantiv og adjektiv

- en oppdatert liste alá Tronds lister på ...sma/etc.

Dvs: tabellar med alle lemma + nøkkelformer og nokre derivasjonar.

**Oppgåve:**
* bygg inn skripta for å generera slike tabellar i ny infra  (**Sjur**)

# låneord på -e i SMJ

* uttalt -e: premie, serie - Gen:premie, premiav, premiaj/premijij, premias premijis, premiijn
* stum -e: skype, megabyte skypev, skypaj, skypes, skypijn

Sámásta s276
* stum -e : grape>græjppa  safe>sæjffa

premije? men då blir trycket på -"ije"?

bakteri (Sámásta)

Jf med Sámásta 2, side 83 og frametter.
