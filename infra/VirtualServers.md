# Virtual servers

Here we document our servers and common machines. If some servers are down, see our [in case of a crisis document](DontPanic.html)

## List over the machines

All new machines are Ubuntu 22.04. Domain names ending in -02 also has an alias
with the same name without the -02-ending. For example, gtdict-02.uit.no also
is reahable as gtdict.uit.no.

Machine | Managed by | Age | Specs | Services
---|---|---|---|---
divvun.uit.no     | Divvun      | old | | ?
divvun-02.uit.no  | Divvun      | new | | ?
satni.uit.no      | Divvun      | old | | ?
satni-02.uit.no   | Divvun      | new | | ?
gtsvn-02.uit.no   | Divvun      | new | | svn server
gtdict-02.uit.no  | Giellatekno | new | 32GB RAM, 8 CPUs | Neahttadigisanit
gtweb-01.uit.no   | Giellatekno | old | | webpipeline, apertium, korp, webdict, metadict
gtweb-02.uit.no   | Giellatekno | new | 16GB RAM, 4 CPUs | webpipeline, apertium, korp, webdict, metadict
gtoahpa-02.uit.no | Giellatekno | new | 16GB RAM, 4 CPUs | oahpa.no, kuvsje, kursa, oahpa instances


Each machine is documented below.

## divvun.uit.no

## gtoahpa.uit.no (gtoahpa-02.uit.no)

Services are managed by a service script, see
<https://github.com/giellatekno/gtoahpa-service-script>.

- Running services:
  - oahpa
    - sme_oahpa_project (<https://oahpa.no/davvi/>)
    - sms_oahpa_project (<https://oahpa.no/nuorti/>)
    - sma_oahpa_project (<https://oahpa.no/aarjel/>)
    - sjd_oahpa_project (<https://oahpa.no/kiilt/>) (disabled)
    - smn_oahpa_project (<https://oahpa.no/aanaar/>)
    - est_oahpa_project (<https://oahpa.no/eesti/>)
    - vro_oahpa_project (<https://oahpa.no/voro/>)
    - fkv_oahpa_project (<https://oahpa.no/kveeni/>)
    - myv_oahpa_project (<https://oahpa.no/erzya/>)
    - crk_oahpa_project (<https://oahpa.no/nehiyawetan/>)
  - kuvsje (<https://kuvsje.oahpa.no/>)
  - kursa (<https://kursa.oahpa.no/>)
  - konteaksta (<https://oahpa.no/konteaksta/>) (**NOT RUNNING**: Has been broken since the java bug in *log4j*!)


## gtdict.uit.no (gtdict-02.uit.no)

Setup is the same as on gtdict (old). Maintenance is done with the
the nds maintenance script, see
<https://giellalt.github.io/dicts/nds/nds_commands.html>.

- Running services:
  - NDS:
    - <https://sanit.oahpa.no>
    - <https://baakoeh.oahpa.no>
    - <https://kyv.oahpa.no>
    - <https://muter.oahpa.no>
    - <https://saanih.oahpa.no>
    - <https://vada.oahpa.no>
    - <https://bahkogirrje.oahpa.no>
    - <https://saan.oahpa.no>
    - <https://sanat.oahpa.no>
    - <https://sanj.oahpa.no>
    - <https://sonad.oahpa.no>
    - <https://valks.oahpa.no>


## gtsvn.uit.no (gtsvn-02.uit.no)

Running our SVN server.

## gtweb-01.uit.no

- Specifications:

  - OS: Centos 7
  - CPU: 4
  - Minne: 16GB

- Running services:
  - korp
    - sme, smj, sma, smn, sms, nob_parallel and fin_parallel (<https://gtweb.uit.no/korp>)
    - fkv, fit, vep, vro, fkv_parallel (<https://gtweb.uit.no/f_korp/>)
    - kpv, koi, udm, mdf, myv, mrj, mhr (<https://gtweb.uit.no/u_korp/>)
  - others
    - Jorgal/MT-testing/Apertium (<https://gtweb.uit.no/jorgal/>, <https://gtweb.uit.no/mt/>, <https://gtweb.uit.no/mt-testing/>)
    - cgi-bin
    - webdicts

## gtweb-02.uit.no

Same services as gtweb-01. Services are managed by a service script, see
<https://github.com/giellatekno/gtweb-service-script>.

- Running services:
  - apertium
  - "cgi-bin"
  - webpipeline
  - webdict
  - korp
  - metadict

## satni.uit.no (oppgradert)

## Other documentation

Admin documentation/log:

- private/admin/README-admin-gtoahpa.txt: for changes, package installation, and other things that must remain private.

General practices:

- Admin group on the four (following CentOS) are to add users to the wheel group (usermod -G wheel USER).


## Obsolete documentation below

Old server list. Many are the same as the current ones, but they are included
here, because other, obsolete documentation may refer to them. They ran CentOS
7, which was a type of red hat linux that received maintenance patches until
2024-06-30.

Machine | Managed by | Specs | Services
---|---|---|---
gtlab.uit.no      | (?)         | Fedora 28, 8 CPUs, 16GB RAM | (not in use)
gtdict.uit.no     | Giellatekno | 32GB RAM, 8 CPUs | Neahttadigisanit
gtoahpa.uit.no    | Giellatekno | | oahpa.no
gtsvn-01.uit.no   | Divvun      | | svn server
