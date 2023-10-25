Restarting httpd services on *gtdict.uit.no*
=============================================

This document deals with restarting httpd services on *gtdict.uit.no*,
i.e. the NDS dictionaries on gtdict.

## Restarting the dictionaries

Log in to *gtdict.uit.no*, switch to user neahtta, go to /home/neahtta/neahtta and issue:


```
    fab DICT restart-service
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
    sanj
    valks
```


To (manually) check that the services are running, click each of these links:
* <http://baakoeh.oahpa.no>
* <http://bahkogirrje.oahpa.no>
* <http://kyv.oahpa.no>
* <http://muter.oahpa.no>
* <http://saan.oahpa.no>
* <http://saanih.oahpa.no>
* <http://sanat.oahpa.no>
* <http://sanit.oahpa.no>
* <http://sonad.oahpa.no>
* <http://sanj.oahpa.no>
* <http://vada.oahpa.no>
* <http://valks.oahpa.no>

To check that the services are running on the server, you may also use the command

```bash
systemctl status nds-sanit
```
replacing sanit with the dictionary you want to test. The line starting with "Active" should read something like `Active: active (running) since Wed 2022-06-15 11:51:45 CEST; 1h 55min ago` and there should (probably) be a list of gunicorn workers.
