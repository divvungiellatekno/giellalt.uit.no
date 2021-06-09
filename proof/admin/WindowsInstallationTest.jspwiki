# Testrutine
* Dump register
* Installer pakke
* Dump register
* Lag diff av register fra operasjon 1 og 3 [1]
* test
    - sjekk om stavekontroll fungerer for bruker som installerte
    - logg inn som annen bruker
    - sjekke om stavekontroll fungerer
    - logg ut annen bruker
* Avinstaller pakke, sjekk at filene er fjernet
* Dump register
* Lag diff av register fra operasjon 1 og 9

[#1] Registerfiler er UTF-16LE. For å kunne bruke diff i Unix-miljø må man kjøre recode utf16..utf8 <registerfil> før man lager en diff

|   Windows-versjon | bit-versjon | MSOffice-versjon | Installert verktøy   | Fungerer for installerende bruker | Fungerer for annen bruker | Registry diff etter installering    | Registry diff etter fjerning                            | remarks
| --- | --- | --- | --- | --- | --- | --- | --- | --- 
|  Windows7 | 32 | 2007 | Divvun 1.1            | y   | y   | [AfterDivvun11InstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterDivvun11InstalledDiff.diff]        | [AfterDivvun11RemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterDivvun11RemovedDiff.diff)
|  Windows7 | 32 | 2007 | Divvun 2.2.           | y   | y   | [AfterDivvun22InstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterDivvun22InstalledDiff.diff]        | [AfterDivvun22RemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterDivvun22RemovedDiff.diff)
|  Windows7 | 32 | 2007 | Didriksen Kukkuniiaat | y   | n   | [AfterKukkuniiaatInstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterKukkuniiaatInstalledDiff.diff]     | [AfterKukkuniiaatRemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterKukkuniiaatRemovedDiff.diff)
|  Windows7 | 32 | 2007 | Lingsoft Kukkuniiaat  | y   | y   | [AfterOldKukkuniiaatInstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterOldKukkuniiaatInstalledDiff.diff]  | [AfterOldKukkuniiaatRemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2007/AfterOldKukkuniiaatRemovedDiff.diff)
|  Windows7 | 32 | 2010 | Divvun 1.1            | n/a | n/a | n/a                                                 | n/a                                         | exits with: 1607 Unable to install InstallShield runtime; LS tools were made at a time when Office 2010 did not exist
|  Windows7 | 32 | 2010 | Divvun 2.2.           | y   | n   | [AfterDivvun22InstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2010/AfterDivvun22InstalledDiff.diff]        | [AfterDivvun22RemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2010/AfterDivvun22RemovedDiff.diff)  | unclean uninstall, sami proofing available even after running c:\backup\divvun\remove_SamiProofingtools.exe
|  Windows7 | 32 | 2010 | Didriksen Kukkuniiaat | y   | n   | [AfterKukkuniiaatInstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2010/AfterKukkuniiaatInstalledDiff.diff]     | [AfterKukkuniiaatRemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-32-2010/AfterKukkuniiaatRemovedDiff.diff)
|  Windows7 | 32 | 2010 | Lingsoft Kukkuniiaat  | n/a | n/a | n/a                                                 | n/a
|  Windows7 | 64 | 2007 | Divvun 1.1            | y   | y   | [AfterDivvun11InstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterDivvun11InstalledDiff.diff]        | [AfterDivvun11RemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterDivvun11RemovedDiff.diff)
|  Windows7 | 64 | 2007 | Divvun 2.2.           | n   | n   | [AfterDivvun22InstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterDivvun22InstalledDiff.diff]        ]( [https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterDivvun22RemovedDiff.diff)  | Word tells that spelling exists, but doesn't work
|  Windows7 | 64 | 2007 | Didriksen Kukkuniiaat | y   | n   | [AfterKukkuniiaatInstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterKukkuniiaatInstalledDiff.diff]     | [AfterKukkuniiaatRemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterKukkuniiaatRemovedDiff.diff)
|  Windows7 | 64 | 2007 | Lingsoft Kukkuniiaat  | y   | y   | [AfterOldKukkuniiaatInstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterOldKukkuniiaatInstalledDiff.diff]  | [AfterOldKukkuniiaatRemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2007/AfterOldKukkuniiaatRemovedDiff.diff)
|  Windows7 | 64 | 2010 | Divvun 1.1            | n/a | n/a | n/a                                                 | n/a
|  Windows7 | 64 | 2010 | Divvun 2.2.           | y   | n   | [AfterDivvun22InstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2010/AfterDivvun22InstalledDiff.diff]        | [AfterDivvun22RemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2010/AfterDivvun22RemovedDiff.diff)
|  Windows7 | 64 | 2010 | Didriksen Kukkuniiaat | y   | n   | [AfterKukkuniiaatInstalledDiff|https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2010/AfterKukkuniiaatInstalledDiff.diff]     | [AfterKukkuniiaatRemovedDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2010/AfterKukkuniiaatRemovedDiff.diff)
|  Windows7 | 64 | 2010 | Lingsoft Kukkuniiaat  | n/a | n/a | n/a                                                 | n/a                                         | Not made for Office 2010
|  Windows7 | 64 | 2010 | Microsoft NOB         | y   | y   | [AfterNOLangpackDiff](https://gtsvn.uit.no/biggies/trunk/techdoc/proof/w7-64-2010/AfterNOLangpackDiff.diff) | n/a

Noen av diffene er svært store, over 100 MB.
