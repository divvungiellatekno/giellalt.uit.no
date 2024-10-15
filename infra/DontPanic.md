# Don't Panic

**This page is for people with access to the Tromsø servers!**

What to do if ...

# The servers are down

Get an overview on the [status monitor for Giellatekno and Divvun **services** running on our servers](https://status.giellalt.org/) The overview is refreshed every 5 minutes.

## Get them up and running

For the *divvun.no, gtdict.uit.no, gtoahpa-01.uit.no, gtsvn-01.uit.no, gtweb-01.uit.no, satni.org* servers at uit.no:

* Relevant persons are Børre Gaup, Anders Lorentsen, Sjur Moshagen, Trond Trosterud.
* Ultimately, _IT, Seksjon for applikasjoner og tjenester_ (see `$GTPRIV/admin/emergency.txt`)

Note that *gtsvn.uit.no* redirects to *gtsvn-01.uit.no*, etc for all *-01*.


## Restart processes afterward

### Instructions for each server:

The following processes need to be restarted, and in the following way.

- **Server: api-giellalt.uit.no**
	- Domain on server: *api-giellalt.uit.no*
	- TODO: Write documentation on this server
- **Server: divvun.uit.no**
	- Domains on server: *divvun.uit.no, divvun.no, divvun.org, indigenous-langtech.uit.no, giellalt.uit.no, giellatekno.uit.no, dicts.uit.no*
	- [Restart instructions for **divvun.no** (the speller server)](SpellerServer.html)
- **Server: gtdict.uit.no**
	-  Domains on server: *\*.oahpa.no* (all NDS versions)
	-  [Restart instructions for **gtdict.uit.no**  (NDS)](httpdserversgtdict.html)
- **Server: gtoahpa.uit.no** 
	- Domain on server: *oahpa.no, kursa.oahpa.no, kuvsje.oahpa.no*
	- [Restart instructions for **gtoahpa.uit.no** (oahpa.no, Konteaksta, kursa and kuvsje)](httpdserver.html)
- **Server: gtsvn.uit.no**
	- Domain on server: *pahkat.uit.no*
	- [Restart instructions for **gtsvn.uit.no** (svn)](gtsvn.html)
- **Server: gtweb.uit.no**
	- Domain on server: *jorgal.uit.no, gtweb.uit.no*
	- Services on server: MT, korp, cgi-bin
	- [Restart instructions for **gtweb-01** (interactive web programs, MT, webdicts)](httpdserversgtweb.html)
- **Server: gtweb-02.uit.no**
    - [Troubleshooting gtweb-02](gtweb-02-troubleshooting.md)
- **Server: satni.uit.no**
	- Domains on server: *satni.org, sátni.org, bahko.org, báhko.org, baakoe.org*
	- [Restart instructions for **satni.org**](satniorg.html)


### Specific processes

- [instructions for restarting nginx](RestartingNginx.html)
- [instructions for Gïelese](../apps/gielese/GieleseRestarting.html) (TODO: Update documentation)
    - Look for commands with *restart...*
- [When the webpages are not rebuilt](SiteBuildProblems.html)


## Test that everything is ok

Go back to [the interactive monitor](https://status.giellalt.org/), refresh, and check whether the report has turned greener. (Remember: The monitor tests every 5 minutes).


# A server is very slow

Log in to the machine via ssh and find out which processes are using most CPU resource by giving the command:

```
    htop
```

The top part of the screen shows CPU usage per core, as well as memory usage.
Sort by CPU or Memory in the process list below, by typing **shift-p** or 
**shift-m**, respectively. Processes that seem to use a lot of either CPU
or Memory should be restarted.

The output looks something like
```
 PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
15221 neahtta   20   0  512m 303m 2848 R 19.2  3.9   2:24.15 python
 9405 neahtta   20   0  512m 303m 2848 S 13.9  3.9   1:28.60 python
 6239 mysql     20   0  896m 185m 5500 S  0.3  2.4  19:10.63 mysqld
.......
```

Observe the column **%CPU**. If some of the processes remains in the top of the table with a high value in this column then this is obviously the cause of the problem. To get more information about the problematic process give the command

```
    ps -fp *PID*
```

where you replace *PID* by the concrete number, e.g. 15221 in the given example.

If it is an Oahpa (python2.7) process then you can see from this output which Oahpa it is. First, you can try to [restart the particular Oahpa instance](http://giellatekno.uit.no/ped/common/httpdserver.html). After doing that check with command **top** if the problem has disappeared. If not then you can stop the process using the command

```
    kill *PID*
```

(requires sudo rights)

# Analysers do not work

* The analysers are in /opt/smi. Check that they work, and recompile if they don't.
    - One possible error source is mismatch between compiled programs and compilers that
   use them. The pipeline is documented in [the cgi-bin documentation](docu-cgi-bin.html).
    - The naming conventions for fsts when compiled ("new") and in the web directories ("old") [are found here](infraremake/FstNamesInOldAndNewInfra.html)

# The svn application is down, yet the gtsvn server is up-n-running (test it by logging into the server)

* error messages
```
sme$ svnup
Updating '/Users/xxxxxx/gtsvn':
svn: E000060: Unable to connect to a repository at URL 'https://gtsvn.uit.no/langtech/trunk'
svn: E000060: Error running context: Operation timed out
```

* log into the gtsvn server

* find the processes running
```
[root@gtsvn ~]# lsof -i | grep http
httpd     26024    apache    4u  IPv6    15925      0t0  TCP *:http (LISTEN)
httpd     26024    apache    6u  IPv6    15929      0t0  TCP *:8099 (LISTEN)
httpd     26024    apache    8u  IPv6    15935      0t0  TCP *:https (LISTEN)
```

* kill them
```
[root@gtsvn ~]# kill -KILL 26024
```

* start the service anew
```
ot@gtsvn ~]# service httpd start
Starting httpd:                                            [  OK  ]
```

# Reference document

[Server Programs and Logs](ServerProgramsAndLogs.html)
