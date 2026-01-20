# gtweb

`gtweb.uit.no` is an alias for `gtweb-02.uit.no`.

The list of services and websites run on gtweb:

- apertium
  - <https://gtweb.uit.no/jorgal/>
  - <https://gtweb.uit.no/mt/>
  - <https://gtweb.uit.no/mt-testing/>)
- "cgi-bin" <https://gtweb.uit.no/cgi-bin/>
- korp
  - portal/index: <https://gtweb.uit.no/korp/>
  - Each language has its own instance, for example, sme is at <https://gtweb.uit.no/korp/sme>.
  - Old instances:
    - Sámi languages: <https://gtweb.uit.no/old_korp/>
    - Baltic Finnic + Faroese: <https://gtweb.uit.no/f_korp/> 
    - Other Uralic: <https://gtweb.uit.no/u_korp/>
    - (missing ?? tyv_korp) <https://gtweb.uit.no/tyv_korp/>
- metadict <https://gtweb.uit.no/metadict/>
- webpipeline <https://gtweb.uit.no/webpipeline>
- webdict <https://gtweb.uit.no/webdict/>
- old webdict <https://gtweb.uit.no/old-webdict/>
- ocr service <https://gtweb.uit.no/ocr/>


## Management

Almost all services on gtweb are run in podman containers. These services are
managed by a service script, whose github repo is at
<https://github.com/giellatekno/gtweb-service-script>.

Additionally, cgi-bin is being run by Apache (proxied from nginx), and there are
some static html served directly from nginx.

One container = one service. Often, websites will consist of two or even more
containers, e.g. one for backend, one for frontend, or in the case of _Korp_,
one container for each frontend instance.

The service script controls the underlying systemd service files, and also takes
care of setting up the global nginx to route to where the services are defined.
It of course also takes care of managing the images, by proxying to podman
commands.


#### nginx

Many of the services are websites. They are accessed on the same domain, but under
a different base, and as such, the configuration files for those services are
located in `/etc/nginx/default.d/SERVICE.conf`. The nginx service file will
`proxy_pass` to the webserver in the container.

The images for the containers are built on a developer's machine, and uploaded
to our container registry, [gtlabcontainerregistry](../gtlabcontainerregistry.html).


### Usage

The containers run under the `services` user, so after logging in through `ssh`,
switch to the `services` user:

```bash
sudo su - services
```

The script is installed on the `PATH`, and is run with command `tjeneste`.
Some commands, such as the ones starting and stopping, will require `sudo`.


#### Tab completions

Tab completions are set up for the service script. Entering `tj<TAB>` will expand
to `tjeneste `. Short names for services are also accepted, for example, `mdapi`
will both be accepted as is by the script, but also tab-expand to `metadict-api`.
Finally, commands themselves are also completable.


#### --help is your friend!

All commands and arguments takes an optional `--help` argument, which will
show useful help for that command or argument.


### Commands

#### For individual services

The general structure is `tjeneste <command> <service-name>`.

Command | requires sudo | Description
---|---|---
status  | no            | An overview of the status of the service
logs | no | View the logs for the container, (runs `podman logs` internall)
pull | no | Pull the newest image from the container registry
stop | yes | Stops the service (using `systemctl`)
start | yes | Starts the service (using `systemctl`)
restart | yes | Restarts the service (using `systemctl`)
print-systemd-service | no | Prints the `.service` file.
install-systemd-service | yes | Installs the systemd `.service` file (1)
remove-systemd-service | yes | Removes the systemd `.service` file (1)
print-start-cmd | no | Prints the command the `.service` file runs (the `Exec` attribute of the `.service`-file)
install-nginx-route | yes | Installs the nginx config file for this service (2)
delete-nginx-route | yes | Removes the nginx config file for this service (2)

(1): The systemd `.service` files are located in `/etc/systemd/system`. The commands will also `enable`/`disable` the service, and `daemon-reload` to update systemd.

(2): Also runs `sudo systemctl reload nginx` for the changes to effect.

**Notice:** Some services have additional commands defined. For example,
`metadict-db` has the `psql` command, which starts a `psql` inside the running
container, to help with debugging. Use `--help` to see all commands for a service.


#### Common commands

Additionally, there are commands that do not work on a specific service, but
on the entire system as a whole:

Command | requires sudo | Description
--- | --- | ---
status | no | Shows a table of status for all services.
install-bash-completions | yes? | Installs the bash completions for the service script
uninstall-bash-completions | yes? | Removes the bash comlpetions


## Common resources on the server

### FSTs

FSTs are installed globally on the server directly, from _apertium nightly_, and
are located in `/usr/share/giella/`. They are _mounted_ into each container that
needs FSTs. The applications contains no FSTs on their own.

The FSTs should be updated every night, through normal `apt` means.


### Corpora

**Korp** uses compiled *Corpus WorkBench (CWB)* files. These are located in
`/home/services/korp/cwb_files`. The `korp-backend` service mounts this directory
into its container.

(The korp configuration is in `/home/services/korp/config` (MOVE THIS TO THE KORP DOCUMENTATION?)).


## Apache

Cgi-bin is run from Apache. Nginx proxies to Apache for those routes.
