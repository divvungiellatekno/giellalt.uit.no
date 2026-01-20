# Neahttadigisanit

The Neahttadigisanit dictionary. _NDS_ for short. The **gtdict** server (gtdict.uit.no)
runs NDS. NDS is _the only_ service **gtdict** runs.


## Troubleshooting

Some common problems, and their solution.

### Site doesn't reply at all

`ssh` to the server. Try to restart both nginx, as well as all the services:
`sudo systemctl restart nginx` to restart nginx, then `sudo su neahtta`, and `nds restart all`, to restart all the individual instances.


### Server is very slow

Restart it. `ssh` to the server, restart the systemd service, for example for, sanit: `sudo systemctl restart nds-sanit`.


### Dictionaries are not being updated

This could be that the automatic update has run into git conflicts in a
dictionary's repository. `cd` into the dictionary: `cd /home/neahtta/gut/giellalt/dict-xxx-yyy` (where `dict-xxx-yyy` is the dictionary in question), and check what
`git status` says. If it says "git rebase in progress", abort the rebase.
Otherwise, resolve the issue. Finally run `git pull` and make sure it's all up
to date.

Another frequent issue, are that invalid XML are pushed to the dictionary sources.
Fix the issues manually, or report the issue to the dictionary authors.


### Language models are not being updated

Usually this is due to errors when building the language models. Check out the
build log from Tino's logs, which are found here (example for `giellalt/lang-sme`): <https://apertium.projectjj.com/apt/logs/giella-sme/build.log>.

If this all seems fine, check out `apt` logs on why the new packages are not being
installed.


## Endpoints

Users reach the Neahttadigisanit dictionary through the following addresses:

- <https://baakoeh.oahpa.no>
- <https://bahkogirrje.oahpa.no>
- <https://kyv.oahpa.no>
- <https://muter.oahpa.no>
- <https://saan.oahpa.no>
- <https://saanih.oahpa.no>
- <https://sanat.oahpa.no>
- <https://sanj.oahpa.no>
- <https://sonad.oahpa.no>
- <https://vada.oahpa.no>
- <https://valks.oahpa.no>

This list is also located on the publicly reachable address <https://gtdict.uit.no>, as
a super simple, static html page.


## About the application

NDS is an old Python application, using the Flask web framework. It runs on python version
3.10. There is some JavaScript functionality, using some old jQuery. Other JS code is written
to be compatible with what MDN (Mozilla Developer Network) calls "baseline", that is,
browsers going back to 2015. We do this because we have users using very old computers,
and we want most functionality to work for them.


## Architecture

NDS instances are run by **gunicorn**. The gunicorn instance is managed by systemd.


## Maintenance

Once ssh'd into the server, switch to the `neahtta` user using the command: `sudo su neahtta`.
It will place you in `/home/neahtta/neahttadigisanit/neahtta`, and activate the python
virtual environment, which you can see because the prompt starts with `(venv) ...`.
A `message of the day` with useful information on common `nds` commands will be printed.

`nds` is the command that does most of the maintenance. It can update dictionaries, and
is also used to restart the servers, for example. See LINK-TO-NDS-COMMAND-DOCUMENTATION.


## Automatic updates

Language models from apertium nighly, and the dictionaries are updated automatically.

A systemd timer `/etc/systemd/system/autoupdate-nds.timer` runs hourly. It runs the
`/etc/systemd/system/autoupdate-nds.service`. That service runs the commmand `nds autoupdate`.

It does the following:

1. Update language models, from apertium, using `apt`
1. `git pull`s shared repositories (giellalt/giella-core)
1. for each instance (sanit, baakoeh, etc)
  1. determines which dictionaries it uses (dict-xxx-yyy), and does a `git pull` on each dictionary
  1. If any dictionaries had new data from the git pull: compile the dictionary
  1. (if the sme-nob dictionary was updated, do `add_stem` (special case just for sme-nob))
  1. restart the gunicorn server, so new dictionaries come online

**NOTE**: The autoupdate **DOES NOT** update the application itself. If you have made
changes to `giellatekno/neahttadigisanit`, you must `git pull` in the directory, and
restart all services.


## TLS (SSL) certificates

Because services runs under a subdomain of `oahpa.no`, we use a _wildcard_ certificate.
Such a certificate can NOT be issued by **letsencrypt**, so we get these certificates
sent to us regularly from ITA.

HOW CERTIFICATES WORKS, WHERE THEY ARE.


## Logs

nginx entry and access logs are at `/home/neahtta/logs/(access|error).<INSTANCE>.log`,
as controlled by the indivial nginx config files for each instance, at
`/etc/nginx/sites-available/<INSTANCE>.conf`. In the nginx conf file, you can see that
those logs also goes to the syslog, which ultimately pushes logs to Azure, for permanent
storage, so that we don't lose the logs, in case the server data loss. (See SERVERSLOGGINGTOAZURE)

Additionally, the application itself writes two different log files: `/home/neahtta/morph_log.txt`,
and `/home/neahtta/user_log.txt`. These logs are as of this writing (2026-01-16) **NOT**
automatically transferred to Azure. This is a WIP.
