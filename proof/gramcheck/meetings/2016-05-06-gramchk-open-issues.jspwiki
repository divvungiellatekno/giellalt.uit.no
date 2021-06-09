* generating capital letter "davvi"
* giving more than one suggestions consisting of several parts
* suggestions for compound errors (merging two cohorts)
* how to do hyphenrules without #
* lexicalize compound error compounds which are not in the lexicon? (compound-correct-noun-noun-constructions.txt)

```
Davvi-
Davvi-	davvi+N+Cmp/SgNom+Err/Orth+Cmp/SplitR
Davvi-	davvi+N+Cmp/SgNom+Err/Orth+Cmp/SplitR
Davvi-	davvi+N+Cmp/SgNom+Cmp/SplitR
Davvi-	davvi+N+Cmp/SgNom+Cmp/SplitR
Davvi-	davvi+N+Cmp/SgNom+Cmp/SplitR

davvi-
davvi-	davvi+N+Cmp/SgNom+Err/Orth+Cmp/SplitR
davvi-	davvi+N+Cmp/SgNom+Err/Orth+Cmp/SplitR
davvi-	davvi+N+Cmp/SgNom+Cmp/SplitR
davvi-	davvi+N+Cmp/SgNom+Cmp/SplitR
davvi-	davvi+N+Cmp/SgNom+Cmp/SplitR
```	

```
	## Eará ortnegatge vuoruhuvvojit , nugo fievrridandoarjja visot dehálaš buvttademiide eanadoalus , ja dat mearkkašit ollu davvi Norgga fylkkaide .
	davvi Norgga should be Davvi-Norgga, but how should it be generated if both davvi- and Davvi- get the same analysis??
```	

```
ADD:double-inchoative (&syn-double-inchoative) TARGET ("álgit") IF (*1 (VV TV Der/InchL) BARRIER GRAMCHK-S-BOUNDARY OR VFIN);
	## Go leimme mihtidan nu máŋga rusttega ahte álggiime ollet lohppi, álgen mun 	ballagoahtit.
ADD:double-inchoative-part2 (&syn-double-inchoative-part2) TARGET (VV TV Der/InchL) IF (*-1 &syn-double-inchoative BARRIER GRAMCHK-S-BOUNDARY);

COPY:double-inchoative-part2 (&SUGGEST) EXCEPT (Der/InchL &syn-double-inchoative-part2) TARGET (&syn-double-inchoative-part2) ;

	# two ways of fixing
	# álgen mun ballat
	# mun ballagohten
	# HOW TO DISPLAY BOTH WAYS?
```	

```
	ADD:compound (&msyn-compound) TARGET (Actio Sg Nom) IF (1 CNOUN) ;
#COPY:msyn-compound ( &SUGGEST) EXCEPT ( &msyn-compound) TARGET ( &msyn-compound) ;
    ## bargan vuohki
    #$ ČÁLUS:HÅKON ISAK VARS GOVAT: ISAK NILS SIRI
    #$ Dá leage ođđaseamos bivdu Guovdageainnus.
    #$ Áiggid čađa rievddai servvodat bivdoservvodagas otna ruhttaservvodahkki.
    # FRAN: how can those two be put together? (maybe ask Tino: merging two cohorts)
```

```
ADD:hyphen (&msyn-addhyphen) TARGET CNOUN IF (0 N LINK 0 Gen OR (Sg Nom) LINK 1 CC LINK NOT 0 (@CVP) LINK 1 N + COMPOUND) (NEGATE -1C (&msyn-compound))(NEGATE 0 UNLIKELY-COMPOUNDS-1PART LINK 1 CC LINK 1 UNLIKELY-COMPOUNDS-2PART)(NEGATE 0 Gen LINK 3 Po)(NEGATE 0 $$ALL-LEMMA LINK 2 $$ALL-LEMMA )(NEGATE 0 $$WORD LINK 2 $$WORD OR (".*$$WORD"r)) ;

COPY:hyphen (Cmp/SgNom Cmp/SplitR &SUGGEST) EXCEPT (Nom &msyn-addhyphen) TARGET (N &msyn-addhyphen) ;
	## Guovdageainnus ja Diehtosiiddas leat maiddai eará guovddáš sámi ásahusat, nu go Sámedikki oahpahus-, giella ja kulturossodat, Sámi árkiiva, Gáldu- Álgoálbmotvuoigatvuođaid gelbbolašvuođaguovddáš ja Riikkaidgaskasaš boazodoalloguovddáš.
```
