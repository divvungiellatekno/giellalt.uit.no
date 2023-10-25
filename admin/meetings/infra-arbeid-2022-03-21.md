# Infra-arbeid framover

Møte 21.3.2022

Til stades: Børre, Flammie, Sjur, TrondTr, TrondTy

* kløyva giella-shared
    * definera filformat for dependensar (Flammie, Sjur)
    * i lag med andre `.gut`-filer? `toml`?
    * kløyva no, men la giella-shared stå til alt fungerer (Flammie, Sjur?)
* omorganisera [fst-bygginga](https://github.com/giellalt/template-lang-und/issues/8)
* omorganisera testkatalogane
* flytta fleire repo frå svn til git(hub)
    * words/ dicts + lists + terms
        * ordbøker har truleg rettlinja historie => enkle å konvertera til git
        * terminologi er for det meste berre ein spegel av termwikien
        * listene er genererte frekvenslister, kan/bør genererast frå korpus
    * nds - Børre konverter og lastar opp
        * <https://github.com/giellatekno/neahttadigisanit> - ferdig!
        * Trond Tynnøl sjekkar at alt er i orden og fjernar NDS frå svn
    * oahpa
        * oahpa ligg i ped-katalogen, som også inneheld andre ting enn oahpa. Vi må (bør?) skilje dei frå kvarandre.
    * tools
        * Her er det mange ulike ting, også irrelevante. Vi kan rydde eller flytte alt.
    * korpus
        * rettlinja historie
        * to repoar pr språk, eitt ope og eitt lukka
* Definerte oppgaver på github
    * [Get rid of giella-lib and associated downloads](https://github.com/giellalt/giella-core/issues/1)
    * [Proper support for Alt-Orth and Alt-WS etc for mobile spellers](https://github.com/giellalt/giella-core/issues/2)
    * [Add support for lexc in GH Linguist](https://github.com/giellalt/giella-core/issues/16)
    * [Support Lemma/Stem/Contlex variables in lexc2markdown](https://github.com/giellalt/giella-core/issues/17)

Sjå òg <https://github.com/orgs/giellalt/projects/1>.
