# Server overview

Here we document our servers and common machines. If some servers are down, see our [in case of a crisis document](DontPanic.html)


## Server list

Our servers run Ubuntu 22.04, some have been upgraded to Ubuntu 24.04. The Domain names are _DNS aliases_ to the same name ending in `-02`, e.g. `gtweb.uit.no` is a DNS alias for `gtweb-02.uit.no`. We previously had old CentOS servers with names ending in `-01`.

Domain name | Managed by | Services
---|---|---|---|---
[divvun.uit.no](divvun.html)   | Divvun      | ?
[satni.uit.no](satni.html)     | Divvun      | satni.org (?)
[gtsvn.uit.no](gtsvn.html)     | Divvun      | svn server
[gtdict.uit.no](gtdict.html)   | Giellatekno | Neahttadigisanit
[gtweb.uit.no](gtweb.html)     | Giellatekno | apertium, korp, webdict, webpipeline, metadict
[gtoahpa.uit.no](gtoahpa.html) | Giellatekno | oahpa.no, kuvsje, kursa, oahpa instances


## SSH access

Simply `ssh <server>`. If your username on your local machine is different from
the username you have on gtdict, use `ssh USERNAME@<server>`. **NOTE**: If you are
not on campus physically, you must use the **VPN** before that ssh endpoint
becomes reachable. See the UiT IT departments user manuals for info on how to
connect to the VPN, at <https://uit.no/it-brukerstotte/art?p_document_id=801127>.

**See also:** [Passwordless login using ssh-key](system/auto-pass.html)


## Common setup

### nginx

`nginx` is main web server on most servers. The main configuration file
is at `/etc/nginx/nginx.conf`. With a _virtual server_ setup, individual servers
are configured at `/etc/nginx/sites-available/NAME.conf`. Some servers have many
services running under the one default server, so check out
`/etc/nginx/default.d/FILE` too, if you aren't finding services under
`sites-available`.

After changing the configuration files, make sure to _reload_ nginx, using the
command `sudo systemctl reload nginx`. If there are errors in a config file,
nginx will refuse to reload.

Log files are by default at `/var/log/nginx/`, but are stored in other places for
some services. Check the details for the specific server and service!

`nginx` can be restarted with `sudo systemctl restart nginx`, but note that this
is rarely needed. When changing the configuration files, 


### apache

(Common apache config files here). (Log files for apache). (Restarting).


### systemd

All our servers use `systemd`. Service files are at `/etc/systemd/system/NAME.service`.


### TLS (SSL) certificates

All servers only expose TLS-enabled web endpoints (`http://` works for the users, by sending `301 Permanent Redirect` to the same url).

Most servers and services use **LetsEncrypt** to handle automatically setup and
update certificates, but for some servers, we use certificates that ITA sends us.

TODO: document TLS certificates for the servers who needs them.
