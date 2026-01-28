# Korp

Korp is Språkbankens Corpora search web interface. See their [official site](https://spraakbanken.gu.se/en/tools/korp) for general info.

Korp consists of a [backend](https://github.com/spraakbanken/korp-backend) web api,
written in Python, and a [frontend](https://github.com/spraakbanken/korp-frontend),
using the Angular framework. The backend provides a web api on top of a tool called
[Corpus Workbench](https://cwb.sourceforge.io/) (*CWB*), which is the tool that stores
the corpus data, and provides the search routines in the data.

We host our own instances of Korp. For general documentation on how we setup korp,
see our Korp repo, at [github.com/giellatekno/korp](https://github.com/giellatekno/korp).

## Instances

- [Korp for Saami languages](http://gtweb.uit.no/korp/)
- [Korp for Kven, Meänkieli, Veps, Võro](http://gtweb.uit.no/f_korp/)
- [Korp for Komi-Zyrian, Komi-Permyak, Udmur, Moksha, Erzya, Hill Mari, Meadow Mari](http://gtweb.uit.no/u_korp/)
- [Korp ved Artlab: Plains Cree](https://korp.altlab.app/)
