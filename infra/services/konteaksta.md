# Konteaksta

**IMPORTANT:** The _Konteaksta_ app is **NOT RUNNING**. This information is a
gathering of information found around the wiki.

ruskonteaksta
Log? tbw.


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
