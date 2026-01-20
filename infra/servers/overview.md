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

In Ubuntu, the main configuration file for apache is located at
`/etc/apache2/apache2.conf`. Log files are usually at `/var/log/apache2/`.
To restart apache, if necessary, run `sudo systemctl restart apache2`.


### systemd

All our servers use `systemd`. Service files are at `/etc/systemd/system/NAME.service`.


### TLS (SSL) certificates

All servers only expose TLS-enabled web endpoints (`http://` works for the users, by sending `301 Permanent Redirect` to the same url).

Most servers and services use **LetsEncrypt** to handle automatically setup and
update certificates, but for some servers, we use certificates that ITA sends us.


#### Wildcard certificates

ITA sends us new certificates regularly for the certificates we need for
wildcard domains, this is mainly `*.oahpa.no`. This is used on both
[gtdict](gtdict.html), for Neahttadigisanit domains, such as `sanit.oahpa.no`
and `baakoeh.oahpa.no`, but also for the `kursa.oahpa.no` and `kuvsje.oahoa.no`
domains, which are handled by the [gtoahpa](gtoahpa.html) server.

The certificate consists of several files with names ending in `.pem`, and a
single file whose name ends with `.key`.

A `.key` file looks something like this:

```
-----BEGIN EC PARAMETERS-----
<...ascii data...>
-----END EC PARAMETERS-----
-----BEGIN EC PRIVATE KEY-----
<...lines of ascii data...>
-----END EC PRIVATE KEY-----
```

The path to this `.key` file is what nginx expects as its value to the
`ssl_certificate_key` directive, such as this example from gtdict's
`/etc/nginx/nginx.conf` file:

```
ssl_certificate_key /etc/nginx/ssl/wildcard.gtdict-02.uit.no.key;
```

The `.pem` files look similar, for example:

```
-----BEGIN CERTIFICATE-----
<...lines of ascii data...>
-----END CERTIFICATE-----
```

The reason why there are many `.pem` files, is that each certificate only
"certificates" certain entities. How does your computer trust `sanit.oahpa.no`?
Just because we have a cryptographic certificate, doesn't mean that we should
trust it. Who issued it? Who does it prove that issued it? If you ever encountered
a webpage giving you security warnings due to a _self-signed certificate_, this
is exactly that: A certificate signed by oneself. And hence, what good is it,
if there are nobody else to "vouch" for trusting that page?

Certificates forms chains. Our certificates are verified by our certificate
provider. They are "just a company", but have their own certificate, and are
verified by a "root level certificate provider". The root level certificate
is built into all computers. So, your computer trusts `sanit.oahpa.no`, because
we have been vouched by our certifcate provider, which is trusted by a root
level certificate provider, which our computer knows that it trusts. This was
of course just a _hand-wavey_ explanation, but it explains why there are more
than one `.pem` file. Each will "point" to each other, up the chain of trust,
so to speak.

The way you make these certificate chains, is that you literally just write
out the certificate text data, from top to bottom, in a file. **NOTE:** It is
important that the certificates goes from top to bottom, starting with _our_
certificate, and works down to the root.

For example, our full chain certificate looks like the following. It is located
in `/etc/nginx/ssl/wildcard.oahpa.no.fullchain.pem`. This path is also set in
the nginx config file:

```
ssl_certificate /etc/nginx/ssl/wildcard.oahpa.no.fullchain.pem;
```

```
-----BEGIN CERTIFICATE-----
<...lines of ascii data...>
[sanit.oahpa.no-certificate, trusted by "certificate provider"]
<...lines of ascii data...>
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
<...lines of ascii data...>
["certificate provider"'s certificate, trusted by the root provider]
<...lines of ascii data...>
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
<...lines of ascii data...>
[root provider's certificate, trusted "instinctively" by your operating system]
<...lines of ascii data...>
-----END CERTIFICATE-----
```

So, what we do when we get a new certificate, is replace the top one. The other
certificates in the chain are valid for many, many years.
