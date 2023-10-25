# Byte til Markdown

# Bakgrunn

- innebygd støtte i GitHub (README, Pages/nettsider)
- ein godt støtta standard
- kan innehalda HTML der MD ikkje strekk til (med visse avgrensingar)
- Forrest er eit daudt prosjekt
- Forrest nyttar Java - vi prøver å kvitta oss med Java
- nettsidene blir bydde automatisk ved innsjekking går berre sekundar/minuttar før oppdateringa er på plass

# Konvertering av gamle nettsider

- Tommi og Sjur gjer det
- finst skript i $GIELLA_CORE for dei som vil prøva seg ([oppskrift her](https://giellalt.github.io/infra/ConvertingDocsToMarkdown.html))
- nettsidene er no organiserte slik:
	- techdoc delt i to
		- det som gjeld Tromsø: giellalt.uit.no (enno med Forrest/jspwiki/xml, og inneheld all gamal techdoc enno)
		- det som er allment (og på engelsk): giellalt.github.io
	- alt språkspesifikt skal liggja i `docs/`-mappa i kvart språk - med unnatak av:
	- kjeldekodeintern dokumentasjon (doccomments) er no òg i Markdown - alle språk er konverterte
	- språkspesifikk dokumentasjon ligg her: `giellalt.github.io/REPONAMN/` - frå `docs/`-katalogen
	- kjeldekodedokumentasjon blir trekt ut og bygd automatisk, treng ikkje `make` + innsjekking lenger

# Verkty

- dei fleste editorane har innebygt støtte for Markdown
	- syntaksfarging, førehandsvising
- i dag viser eg med SubEthaEdit (berre for Mac), men det aller meste er uavhengig av program
	- for å få forhandsvising i SEE: sjekk at syntaksen er sett til Markdown (nederst til venstre), og trykk deretter `Cmd-R`

# Kjeldekodeintern dokumentasjon (doccomments)

- same syntaks som elles
- same konvensjonar som før:
    `!! ` - Alt etter dette blir lagt i Markdown-dokumentet
    `!!= `
    `!!≈ `
- same variablar som før: `@CODE@` osb

# Markdown-syntaks

Sjå denne: <https://www.markdownguide.org>

# Over stokk og stein

- tabellar må ha (eit tomt) hovud, og må ha ei tom line rett før
- HTML: alle HTML-element er støtta, men om du set inn eit blokknivåelement så vil ikkje Markdown inni elementet bli tolka i utgangspunktet, alt må vera HTML
- ekstra CSS, Javascript osb må liggja i spesielle mapper og filer
- oppmerkinga for halvfeit og kursiv (ei eller to stjerner/golvstrekar før og etter) MÅ stå inntil teksten dei skal formattera - ingen mellomrom!
