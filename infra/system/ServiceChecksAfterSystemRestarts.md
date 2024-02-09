# Service Checks After System Restarts

Services to keep an eye on after system restarts - because they need to be operative all the time:

- svn-server
- our web pages (and their automatic updating)
- bugzilla

For each service, after a system restart you may have to do some manual work to ensure they are actually working. Please see below.

## svn-server

Nothing to do.

### Nginx

Front-end resides on the same server as neahttadigisánit. Restarting nginx should be enough.

## our web pages (and their automatic updating)

The sites

- [http://giellatekno.uit.no]
- [http://dicts.uit.no]
- [http://oahpa.no]
- [http://divvun.no]
- [https://giellalt.uit.no]
- [http://divvun.org]

To manually update the sites, run the commands found above in the crontab entries.

## bugzilla

Bugzilla is no longer in use, we use **Issues** in git.
