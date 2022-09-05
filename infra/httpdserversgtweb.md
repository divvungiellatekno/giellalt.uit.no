# Restarting the httpd server on *gtweb-01*


(For interactive linguistic analysers' malfunctioning, see the bottom of the page)

This is the server with the web address *gtweb.uit.no*. It runs the interactive services of Giellatekno and Divvun, most notably **machine translation**, **corpus search** (Korp) and the grammatical analysis on [http://giellatekno.uit.no](giellatekno.uit.no) (running cgi-bin scripts). 


On `gtweb-01`, two httpd services are used. `nginx` is the primary system
for serving all projects, however `apache/httpd` is used to run certain CGI
and MT scripts which Nginx does not have support for. This is done via
reverse proxy. `apache/httpd` thus doesn't run on port 80, rather
`nginx` does, and certain requests are passed off to `apache`
internally.


##  In case of emergencies...

### Get an overview

#### Are the processes running?

Try (e.g.) [http://jorgal.uit.no](jorgal.uit.no) (write "ja" and translate, the answer should be "og"). If you get no answer, the system is malfunctioning.

#### If machine translation is down, look at the *apy* process

Check whether `apy` runs and look at the log:

```
 ssh gtweb # log into gtweb
 sudo journalctl -u apy -n100 # 100 last lines
```
When things are working, you should get strings in some Saami language. When things are **not** working, you could e.g. get a message saying that the disc is full. This is the most likely error, as the disc has only 111GB space (**TODO**: ask IT to get a bigger one). When the disc is full other things could go wrong. Have a look at that:

```
systemctl --state=failed
```

If the disc is full, at least the following files may be removed (followed by a restart of `apy`:

```
sudo rm -rf /var/cache/apy/*    # remove files (be careful with sudo and -rf!
sudo systemctl restart apy      # restart apy
```




### Investigating whether the process do run or not (internally).


On gtweb-01, if for some reason the processes do not restart via chkconfig,
inspect via

```
    ps aux
```

or

```
    top
```

to find out what is or isn't running.


Once missing processes have been identified, the proper order that all services
should be started in (given dependencies between them) is:


  1. mysqld
  1. nginx
  1. httpd
  1. gielese-mongodb
  1. gielese


For this use the command

```
    sudo service NAME start
```
, or alternatively restart, if necessary.


```
    sudo service mysqld start
    sudo service nginx start
    sudo service httpd start
    etc...
```


For further documentation on this, see the various sections in [common httpdserver](httpdserver.html).




## Restarting the mt processes on gtweb-01


Restart is still not documented (but see above), but have a look at
[the page for installing mt on gtweb](https://giellalt.uit.no/mt/infra/UpdatingApertiumOnGtweb.html)




## Apache/httpd (victorio)


The following documentation was taken from the old victorio
documentation, but may be relevant for gtweb-01 as well:
(TODO: check)


Updates to the code require restart of the httpd-server. Sometimes
updates to the localisation require that too. The restart is otherwise
harmless, but may distrub someone who is playing the came (although
that is not very probable).


Restarting the server (requires sudo rights):


```
    sudo /etc/init.d/httpd restart
```




Earlier, there was a memory leak problem, which should not be among us
anymore. However if victorio is very slow, check the memory by writing:
```
    ps aux | grep http
```


If the result indicates memory use too close to 100, this is a clear
problem indication. The answer is to restart the apache web server,
and thereafter, if need, to [restart mysqld](mysql.html).


If the webserver takes too much memory, you may also want to stop
apache first, and then myql, and then starting them again:


```
    sudo /etc/init.d/httpd stop
    sudo /etc/init.d/mysqld stop
    sudo /etc/init.d/httpd start
    sudo /etc/init.d/mysqld start
```


## eXist-db restart
```
    sudo service eXist-db start
```




# Interactive web analysers are down


A server reboot should not affect the web servers. After the reboot, the web
servers are automatically running again.


Eventual malfunctioning here is due to errors in the pipeline being used by the analysers.
The documentation is found on [the cgi-bin documentation page](/infra/docu-cgi-bin.html)




# If jorgal is down


The jorgal.uit.no page may give the message `Oversettelse ikke tilgjengelig!`


This command should help:


```
  ssh -t gtweb
  sudo systemctl restart apy
```
