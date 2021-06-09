# Telefonsamtale med Per Christian Biti på Ávvir

* Adobe 5.5 og nyare kan bruka Hunspell
* Ávvir planlegg å ta i bruk CS6, med støtte for iPad-utgjeving av avisa
* Outlook kan òg bruka Hunspell (frå systemet)
* Ávvir bruker OpenOffice på dei fleste maskinene
* Vil gå over til eit redaksjonelt system med server + Adobe Air-program (ev. i nettlesar)
* Både orddeling og stavekontroll blir støtta i InDesign som open kjeldekode

# Bakgrunnsinfo

CS 5.5 og nyare støttar korrekturverktya i OpenOffice, men i ei eiga mappe i InDesign-hierarkiet (slik at dei ikkje blir blanda med verkty som elles finst på systemet). Dette betyr:

* Hunspell for stavekontroll
* modifisert tex-orddeling for den automatiske orddelinga (OOo-orddeling)

## Lenkar

* [Adobe-info](http://blogs.adobe.com/typblography/2011/11/how-to-enable-more-languages-in-indesign-cs5-5.html)
* [Orddeling i OpenOffice](http://hunspell.sourceforge.net/tb87nemeth.pdf)
* [LinguComponent Page](http://www.openoffice.org/lingucomponent/)
* [LinguComponent Hyphenation](http://www.openoffice.org/lingucomponent/hyphenator.html)
* Basic explanation of [how to build a tex hyphenation dictionary](http://translate.sourceforge.net/wiki/guide/hyphenation) both semi-automatically and manually, including an explanation of the syntax of hyphenation entries, also a long list of **links to usable resources**
* [OPatGen site](http://www.fi.muni.cz/~xantos/patlib/) - a Unicode-aware (UTF-8) version of PatGen, a utility to create hyphenation patterns from a list of correctly hyphenated words

# Målsetjing

* 100 % automatisk konvertering til Hunspell, utan samansetjing (vi er nesten allereie der, men skriptet treng truleg litt finpuss enno)
* 100 % automatisk generering av orddelingsmønster for Tex og OOo

Desse kan gå rett inn i InDesign, og brukast der. InDesign krev ei enkel redigering av ei plist-fil, for å sikra at språka og verktya er korrekt registrerte. Det vil difor vera bra med eit enkelt installeringsprogram.
