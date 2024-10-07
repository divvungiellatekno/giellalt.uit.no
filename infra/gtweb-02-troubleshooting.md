# Troubleshooting gtweb-02

All services on gtweb-02 are managed by our service script.
See <github.com/giellatekno/gtweb-service-script> (in Norwegian)
for more information.

It is set up so that all services starts automatically on reboot,
so a simple thing to do first, is to `ssh` into the server, and
run `sudo systemctl reboot`.


# Basic check

Start by `ssh`-ing to the server, change to the `services`
user, and run the `status` command:

```
sudo su - services
tjeneste status
```

It takes a few seconds to run. You should see a list of all the
services, and what `systemd` reports as the status.


# Restarting a service

Restarting services is done with the `restart` command. Any single
page or service, may consist of several containers. For example,
the `metadict` (meta dictionary) service, contains of 3 services:
`metadict-db`, `metadict-api`, `metadict-front`. To see a list of
all services, run `tjeneste --help`.

So, to restart the metadictionary, issue these three commands:

```
tjeneste mddb restart
tjeneste mdapi restart
tjeneste mdfront restart
```

(Here the short version of the service names are used.)


## If that doesn't work

You can see the command that any individual service runs through
systemd by issuing the `print-start-cmd`:

```
tjeneste mdapi print-start-cmd
```

A long `podman` command will be printed. As of writing, the exact
command for `mdapi` is

```
/usr/bin/podman run --name metadict-api --rm --replace -p 3516:3000 --env PG__HOST=gtweb-02 --env FRONTEND=https://gtweb-02.uit.no/metadict --stop-signal=SIGINT --privileged --security-opt seccomp=unconfined gtlabcontainerregistry.azurecr.io/metadict-api:latest
```

Add `-it` to the start of this command, after the `/usr/bin/podman run`,
like so: `/usr/bin/podman run -it [....]`, and run this command, to see
what happens.

There are so many things that can cause a failure, that to cover
them all is out of scope in this document.
