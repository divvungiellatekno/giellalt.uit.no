# Status for infra - møte 30.8.2023

Folk: Anders, Børre, Flammie, Sjur, Trond

Saker:
- jf førre møtet i 2022
- jf møtet i morgon med IT

# Kommentert opprit frå [førre møtet](infra-arbeid-2022-03-21.html)

> * kløyva giella-shared
>     * definera filformat for dependensar (Flammie, Sjur)
>     * i lag med andre `.gut`-filer? `toml`?
>     * kløyva no, men la giella-shared stå til alt fungerer (Flammie, Sjur?)

Gjort! Ser ut til å fungera ok. I den grad det er problem er det (a) fordi innhaldet i filer i dei ulike delane kunne ha vore betre strukturert og (b) fordi det ikkje alltid er integrert i ulike *lang-X* på ein optimal måte. Men sjølve delinga er

> * omorganisera [fst-bygginga](https://github.com/giellalt/template-lang-und/issues/8)

Ugjort.

> * omorganisera testkatalogane

Ugjort.

> * flytta fleire repo frå svn til git(hub)

Punktvis:

> * words/ dicts + lists + terms
>     * ordbøker har truleg rettlinja historie => enkle å konvertera til git
>     * terminologi er for det meste berre ein spegel av termwikien
>     * listene er genererte frekvenslister, kan/bør genererast frå korpus

Lister:
- som genererte artifaktar i github-release-pakkesystemet
- i svn til vi har det på plass

Terminologi:
- planlegg flyttinga
- vidare diskusjonar i GitHub-prosjekt el.

Ordbøker:
- org på same måte som `lang-`katalogane, prefiks `dict-`
- script osb i `giella-core`
- reponamn: `dict-` L1 `-` L2; L2<1 => L2 = `mul`
- døme på reponamn: `dict-sma-nob`, `dict-myv-mul`
- dicts/scripts, dicts/dtd og Makefile må inn i giella-core 
- doc? dev?

> * nds - Børre konverter og lastar opp
>     * <https://github.com/giellatekno/neahttadigisanit> - ferdig!
>     * Trond Tynnøl sjekkar at alt er i orden og fjernar NDS frå svn

Som det står over - ferdig!

> * oahpa
>     * oahpa ligg i ped-katalogen, som også inneheld andre ting enn oahpa. Vi må (bør?) skilje dei frå kvarandre.

Vi ventar.

> * tools
>     * Her er det mange ulike ting, også irrelevante. Vi kan rydde eller flytte alt.

- fjern det som alt har vorte flytta til git

> * korpus
>     * rettlinja historie
>     * to repoar pr språk, eitt ope og eitt lukka

Ferdig!

> * Definerte oppgaver på github
>     * [Get rid of giella-lib and associated downloads](https://github.com/giellalt/giella-core/issues/1)
>     * [Proper support for Alt-Orth and Alt-WS etc for mobile spellers](https://github.com/giellalt/giella-core/issues/2)
>     * [Add support for lexc in GH Linguist](https://github.com/giellalt/giella-core/issues/16)
>     * [Support Lemma/Stem/Contlex variables in lexc2markdown](https://github.com/giellalt/giella-core/issues/17) - gjort!
> 
> Sjå òg <https://github.com/orgs/giellalt/projects/1>.

# Azure og IT-folka

- domener:
    * antar at de subdomenene av uit.no vi har i dag kan overføres,
    men vil høre mulighetene rundt domenenavn (særlig underdomener av
    `*.uit.no`, e.g. som i dag: gtweb, gtdict, ..., men kan vi få nye?
    f.eks `korp.uit.no`?)
- bygge-infrastruktur: Azure Pipelines?
  kostnader med dette? Vi har potensiellt sett noen store bygge-pipelines
- machine-learning-relaterte jobber.
- økonomi: hva dekker ITA, hva må avdelingene dekke?
