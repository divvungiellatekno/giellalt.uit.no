# HFST-orientering

* Krister orienterade om situationen för HFST; nästa huvudversion lanseras nästa vecka, men kod finns att tillgå på hfst.sourceforge.net
* Måns orienterade om Foma
* Vi diskuterade integration med OpenOffice för FST-baserade korrektur-verktyg (foma, HFST, andra liknande teknologier); Måns nämnde arbete med OOo-integration i Baskien
* vi diskuterade lite mera generellt hur en korrekturbibliotek/-abstraktion ovanpå olika språkteknologier kunde se ut
* vi diskuterade kursen i praktiskt arbete med fullskaliga lexikon och regelsamlingar som Sjur skall hålla på HU, särskild vilka lexikon det kunde vara aktuellt att använda i kursen. De lexikon som nämndes var: Kristers svenska, Måns engelska, det tyska och det franska som kommer att göras tillgängliga när HFST 2 kommer ut nästa vecka, de samiska (nord- och lulesamiska)

Åtgärdspunkter:
* ta fram det svenska lexikonet (Krister)
* ta fram de engelska lexikonen (Wordnet-lexikonet och Arizona-leksikonet) (Måns)
* göra en första skiss till ProofingLib som diskussionsunderlag för nästa möte (Sjur)

# HFST
Next main release this week (hfst.sourceforge.net), Oct. 1.
* It works cross-platform autoconf, automake etc. twolc, lexc, xfst-type compilers
* They are not compatible in the sense that you can use the own commands.
*ou need a new Makefile.
* support for flag diacritics

# Foma
For all languages that don't use twolc, we may just replace xfst with foma.
*  But beware lexc - you have to replace calls to the lexc tool to equivalent operations in xfst/foma.

Issues:
```
foma[1]: save-source ../bin/ipk-lex.save
Unknown command. Ignoring until end of line.
foma[1]: quit
```

# FSTs in OOo etc. proofing tools

IXA Group:

* Iñaki Alegria <i.alegria@ehu.es>
* Kepa Sarasola <kepa.sarasola@ehu.es>

See also: http://ixa.si.ehu.es/Ixa/Argitalpenak/Artikuluak/1246984902/publikoak/pdf

Possibly involve them in the discssion about a new generation proofing/correction/language services API

ftyers@prompsit.com

# Agenda

* Iñupiaq - make it compile both with foma and xfst (an excercise in foma compatibility)

## Changes between xfst/lexc and foma

* Comments -- foma does not like comments in regex [[ ... ] -- need to be removed
* echo statements -- foma does not like blank echo statements.
* in read regex [[ ... ] the compose .o. operator needs a _space_ both sides, so

```
    read regex [
     Foo
    .o. Bar


    ] ;
```
is not ok unless there is a space after Foo.

* redirection: foma does not accept < in front of filenames when reading files
* the 'read regex' command needs to be terminated with a semicolon - ;

## Foma feature requests

* Warnings upon attempting to load binaries compiled with Xerox tools.
* better and more error messages

## Pending questions

What is wrong with this:
```
    LEXICON f
    < "@D.[IT]V.ON@" >  # ; ! Deletes unwated iv/tv combinations xfst style
```
We get a syntax error message with double quotes, removing the quotes removes the error message, but leaves the flag diacritic in a wrong form, and it does not appear in the alphabet.
