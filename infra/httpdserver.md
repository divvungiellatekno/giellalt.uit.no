Restarting httpd services on *gtoahpa-01.uit.no*
================================================

This document deals with restarting httpd services on *gtoahpa-01.uit.no*,
i.e. the oahpa versions and konteaksta on gtoahpa-01.

For the other virtual machines, see [Restarting gtweb|httpdserversgtweb.html], [Restarting gtdict](httpdserversgtdict.html)
and [Restarting gtlab](GtlabRestart.html)


On `gtoahpa-01`, `gtweb-01`, `gtdict` and `gtlab`, we use nginx for serving HTML
and other applications. See [how to restart nginx itself](RestartingNginx.html)
if needed (after an ordinary update it is not needed).




## Restarting Oahpa versions on gtoahpa


Log in to gtoahpa-01.
The following is the list of Oahpas on gtoahpa-01 as of 14.04.2020:


|  Oahpa name|  Language|  URL
| --- | --- | --- 
| crk_oahpa   | Plains Cree       | [oahpa.no/nehiyawetan](http://oahpa.no/nehiyawetan)
| est_oahpa   | Estonian          | [oahpa.no/eesti](http://oahpa.no/eesti)
| fkv_oahpa   | Kven              | [oahpa.no/kveeni](http://oahpa.no/kveeni)
| myv_oahpa   | Erzya             | [oahpa.no/erzya](http://oahpa.no/erzya)
| sjd_oahpa   | Kildin Saami      | [oahpa.no/kiilt](http://oahpa.no/kiilt)
| sma_oahpa   | South Saami       | [oahpa.no/aarjel](http://oahpa.no/aarjel)
| sme_oahpa   | North Saami       | [oahpa.no/davvi](http://oahpa.no/davvi)
| smn_oahpa   | Inari Saami       | [oahpa.no/aanaar](http://oahpa.no/aanaar)
| sms_oahpa   | Skolt Saami       | [oahpa.no/nuorti](http://oahpa.no/nuorti)
| vro_oahpa   | Voro              | [oahpa.no/voro](http://oahpa.no/voro)




### Restarting on the old gtoahpa:


Once an Oahpa version is down, it must be restarted.
As root write:
```
    touch /etc/uwsgi/sites/XXX_OAHPA.ini
```
where XXX_OAHPA.ini is the relevant name from one of the following:
```
    crk_oahpa.ini
    est_oahpa.ini
    fkv_oahpa.ini
    myv_oahpa.ini
    sjd_oahpa.ini
    sma_oahpa.ini
    sme_oahpa.ini
    smn_oahpa.ini
    sms_oahpa.ini
    vro_oahpa.ini
```


If only an Oahpa version has been down, this is enough. If **the server has been totally down**, you may need to start more. Here is the full list of services that
should be started, **in this order** (there are dependencies between them):


1. mysqld
1. nginx
1. php-fpm


For each of the processes listed, issue (anywhere on the system)
the command


```
    sudo service NAME restart
```


Thus, *sudo service mysqld restart*, etc.


After that, run all the Oahpa restarting commands:


```
    touch /etc/uwsgi/sites/XXX_OAHPA.ini
```




## Restarting Konteaksta


Konteaksta is running on the Tomcat web server. After upgrade of gtoahpa-01, as well as adding new components to Konteaksta, it is always recommended to restart Konteaksta (the script compiles the Konteaksta source code, redeploys it on Tomcat and restarts Tomcat). Restarting Konteaksta is also the first thing to try if the url [oahpa.no/konteaksta](http://oahpa.no/konteaksta) gives "server error", e.g. "The page you are looking for is temporarily unavailable. Please try again later.".


To restart Konteaksta:


Log in to gtoahpa-01 and issue the following commands:


```
    sudo su teaksta
    cd
    svn up
    ./make_teaksta.sh
```


Sometimes the restart of the Tomcat web server is needed as well:


```
    cd $CATALINA_HOME/bin
    ./shutdown.sh
    ./startup.sh
```


## kursa and kuvsje

Documentation to be written.

