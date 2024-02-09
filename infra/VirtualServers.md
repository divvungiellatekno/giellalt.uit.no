# Virtual servers

Here we document our servers and common machines. If some servers are down, see our [in case of a crisis document](DontPanic.html)

## List over the machines

- divvun.uit.no
- gtlab.uit.no
- gtoahpa-01.uit.no
- gtdict.uit.no
- gtsvn-01.uit.no
- gtsvn.uit.no
- gtweb-01.uit.no
- satni.uit.no

Each machine is documented below.

## divvun.uit.no

## gtlab.uit.no

- Specifications:

  - OS: Fedora 28
  - CPU: 8
  - Minne: 16GB

- Running services:
  - none

## gtoahpa-01.uit.no

- Specifications:

  - OS: Centos 7
  - CPU: 8
  - Minne: 16GB

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
  - others
    - konteaksta (<https://oahpa.no/konteaksta/>) (temporarily unavailable)
    - kuvsje (<https://kuvsje.oahpa.no/>)
    - kursa (<https://kursa.oahpa.no/>)

## gtdict.uit.no

- Specifications:

  - OS: Centos 7
  - CPU: 8
  - Minne: 16GB

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

## gtsvn-01.uit.no

## gtsvn.uit.no

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

## satni.uit.no (oppgradert)

## Other documentation

Admin documentation/log:

- private/admin/README-admin-gtoahpa.txt: for changes, package installation, and other things that must remain private.

General practices:

- Admin group on the four (following CentOS) are to add users to the wheel group (usermod -G wheel USER).
