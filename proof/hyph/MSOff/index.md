Hyphenation is provided for both supported languages, North and Lule
Sámi, and is installed automatically together with the spellers. See the
[page dedicated to proofing tools
installation](http://divvun.no/korrektur/korrektur.html) for further
details.

Basic architecture
==================

Technically, the hyphenation engines and lexicons are the same as in the
InDesign installation, and the engines are delivered by Polderland. The
hyphenation lexicons are compiled by the Divvun project for the
Polderland engine.

The hyphenation tool consists of the following components:

-   a hyphenation engine
-   a word-list lexicon with compounding support
-   a pattern-based fall-back component for unrecognised words

The word-list lexicon is generated from our transducer sources, and is
exactly the same as the speller lexicon (which contains hyphenation
points). The hyphenation points are mostly added by a rule-based
component, with exceptional hyphenation explicitly added to the lexicon
entries. The hyphenator can be tested independently on [this
page](http://giellatekno.uit.no/cgi/d-smj.eng.html).

This means that all words recognised by the speller should hyphenate
correctly - always. And all other words should hyphenate correctly in
most cases. All in all the hyphenation precision should be around 99,9 %
or better. Anything else is a bug, and should be reported to us via
[e-mail](mailto:feedback@divvun.no) or
[Bugzilla](http://giellatekno.uit.no/bugzilla).
