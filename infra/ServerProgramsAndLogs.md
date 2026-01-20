# Server programs and logs

This is an overview over our servers, their services, and log data.

# gtdict server

This is the server for the NDS dictionary

## NDS

### NDS dictionaries on gtweb

### NDS log

* NDSlog full: neahtta/logs
* NDSlog pruned: neahtta/neahtta/user_log.txt

**TODO:** Document procedure logs -> user_log.txt

## Online analysis (cgi-bin)

The services are the ones linked to here: (https://giellatekno.uit.no/cgi/index.sme.eng.html) (cf. all [Saami](https://giellatekno.uit.no/smilang.eng.html) and [other](https://giellatekno.uit.no/all-lang.eng.html) languages, linking to similar cgi-bin services).

The log is access_log at `/var/log/httpd/`

## Other resources (?)

- pite-lex (??)
- risten (tbw.)
- iwclul2015 (tbw.)
- sigur (tbw.)


## WebDicts

`/var/www/html/webdict/`

Log: tbw.


# gtoahpa server

## Oahpa

Technical documentation is here:

(http://giellatekno.uit.no/ped/index.html)

### Oahpaversions

The overview of oahpa versions is (https://giellalt.uit.no/ped/oahpa_projects.html)

Clicking on each language gives the url to the different Oahpa versions. The one with an url containing *testing* do not work. The oahpa versions are found in `/home/oahpa/orig_gtoahpa` on the gtoahpa server.

- Oahpas in orig_gtoahpa that do **not** work: hdn, kpv, mdf, rus, sjd, udm, yrk
- These **did** work in March 2022: crk, fkv, myv, sma, sme, smn, sms, vro.

### Oahpalog

[Cf. documentation](http://giellatekno.uit.no/ped/common/logextraction.html)
