What is needed for a new Hunspell release:

* bug-free(!) Hunspell conversion

# Known issues in the Hunspell conversion

1085
Feil i Hunspell-konverteringa:
|   Bug#|Severity|Priority|Summary
| --- | --- | --- | ---
|  1355 | blo | P5 | still numerals missing
|  1358 | nor | P5 | hotealla is missing - G3
|  1574 | enh | P5 | no particles in Hunspell
|  1576 | enh | P5 | sloooow and not very eager to suggest
|  1577 | enh | P5 | single letter suggestions
|  1578 | enh | P5 | gođii- Der/goahtit w diph-simpl
|  1579 | enh | P5 | compound-form accepted as is goahte
|  1583 | enh | P5 | compound patterns with hyphen "everything" gets accepted
|  1608 | maj | P5 | cmp-forms w fin hyph gets marked  goahte-
|  1085 | enh | P3 | Installation instructions for "Facebook" are missing
|  1157 | enh | P3 | Add full support for our languages as document language in OOo/LibreO
|  1158 | enh | P3 | Add support for SJE and other languages in OOo/LibreOffice
|  1304 | enh | P5 | v1.5 installed instead of v2.2 on office 64

Mange av feila er slike som Tomi alt har løyst i PLX-konverteringa. Det einaste
problemet er at vi fjernar morfem-grensene tidleg i PLX-konverteringa, slik at
dei er borte når omforminga til Hunspell-formatet skal gjerast. Ved å venta med
å fjerna morfem-grensene til etter at all PLX-konvertering er ferdig, kan vi
bruka PLX-konverteringa for både PLX og Hunspell, og berre justera det vi skriv
ut i aller siste fase.

**GJORT:**
1. flytta fjerninga av morfemgrensene til etter PLX-konverteringa (**Sjur, Tomi**)
1. flytta `sme` til ny infra (**Sjur**)

**GJERELISTE for Hunspell-konvertering:**
1. testa og retta Hunspell-spesifikke buggar (**Børre, Thomas**)

**GJERELISTE for å flytta stavekontrollkonverteringa til ny infra:**
1. flytta PLX-konverteringa til ny infra (**Sjur, Tomi**)
1. flytta testane for PLX-konverteringa til ny infra (**Sjur, Tomi**)
1. sjekka at ny og gamal infra produserer same stavekontroll for `sme`
  (**Sjur, Tomi**)
1. byggja ut stavekontroll-konverteringa til å dekkja både PLX og Hunspell
  (**Sjur**)
