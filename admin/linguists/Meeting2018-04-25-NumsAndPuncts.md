Møte om teiknsetjingsteikn og tal i lexc 25.4.2018

Til stades: Lene, Sjur, Trond

Vi vil ha:

Tal:

* `giella-shared/all_langs/src/morphology/stems/arabic_roman_digits.lexc`
* peiker til standardiserte affiks-leksikon som finst i alle språk
    - `langs/$LANG/src/morphology/affixes/arabic_roman_digits.lexc`

Teiknsetjing:

* `punctuation.lexc` i `giella-shared/all_langs/src/morphology/stems`
* perlscript for '7 i `langs/sme/scripts/punctuation.pl`

Konsekvensar:

* Vi må inkludere giella-shared-filene i alle `$LANG/src/morphology/Makefile.am`
* Vi må inkludere perlscriptet for sme

Vi tar teiknsetjing først, og ser korleis det går.
