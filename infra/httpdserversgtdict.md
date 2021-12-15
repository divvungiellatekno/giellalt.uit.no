Restarting httpd services on *gtdict.uit.no*
=============================================

This document deals with restarting httpd services on *gtdict.uit.no*,
i.e. the NDS dictionaries on gtdict.

## Restarting the dictionaries

Log in to *gtdict.uit.no*, switch to user neahtta, go to /home/neahtta/neahtta and issue:


```
    fab DICT restart_service
```

where DICT is the relevant name for the dictionary to restart:

```
    sanit
    baakoeh
    saanih
    sonad
    bahkogirrje
    muter
    sanat
    vada
    kyv
    saan
    valks
```


To (manually) check that the services are running, click each of these links:
* [http://sanit.oahpa.no]
* [http://baakoeh.oahpa.no]
* [http://saanih.oahpa.no]
* [http://sonad.oahpa.no]
* [http://bahkogirrje.oahpa.no]
* [http://muter.oahpa.no]
* [http://kyv.oahpa.no]
* [http://sanat.oahpa.no]
* [http://vada.oahpa.no]
* [http://saan.oahpa.no]
* [http://valks.oahpa.no]
