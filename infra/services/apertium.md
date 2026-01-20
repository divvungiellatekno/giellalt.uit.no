# Apertium

Aperitum machine translation.


## Endpoints

- <https://gtweb.uit.no/jorgal>
- <https//jorgal.uit.no> (**re-routes to gtweb.uit.no/jorgal**)
- <https://gtweb.uit.no/tolkimine>
- <https://gtweb.uit.no/mt>
- <https://gtweb.uit.no/mt-testing>


## Server, domain names

Apertium is hosted on **gtweb**.

- gtweb.uit.no is a _DNS alias_ to gtweb-02.uit.no (-02, because we had gtweb-01.uit.no a long time ago)
- gtweb-02.uit.no resolves to an IP address of a server running somewhere on campus UiT.


## SSH to the server

Simply `ssh gtdict.uit.no`. If your username on your local machine is different from
the username you have on gtdict, use `ssh USERNAME@gtdict.uit.no`. **NOTE**: If you are
not on campus physically, you must use the **VPN** before that ssh endpoint becomes reachable.
(Link to VPN info?)

(_See also:_ PASSWORDLESS LOGIN USING SSH KEY-LINK GOES HERE)


## About the application

Apertium is an external application that we host, it is **NOT** written by us.
Apertium contains of a backend, written in Python, and a frontend, which is a React application.
However, we do run on a fork from upstream, which is so far behind that the version we
are running, is quite radically different from what upstream uses.


## Architecture

gtweb runs nginx. All components are run as containers. The images for these containers
are built from the repositories.

There are 4 containers: `apertium-api`, `apertium-front-jorgal`, `apertium-front-tolkimine`,
`apertium-front-mt`, `apertium-front-mt-texting`. That is, the 4 different clients for
the different language grups all use the same API.


### ...


## Maintenance

We use a script to do common maintenance tasks. See
[github.com/giellatekno/gtweb-service-script](https://github.com/giellatekno/gtweb-service-script).
Apertium nightly provides all resources that is required for Apertium. They are automatically
updated daily, through standard `apt` machinery.


## TLS (SSL) certificates


## Logs
