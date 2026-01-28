# Apertium

Aperitum machine translation. Hosted on [gtweb](../servers/gtweb.html).


## Endpoints

- <https://gtweb.uit.no/jorgal>
- <https://jorgal.uit.no> (**re-routes to gtweb.uit.no/jorgal**)
- <https://gtweb.uit.no/tolkimine>
- <https://gtweb.uit.no/mt>
- <https://gtweb.uit.no/mt-testing>


## About the application

Apertium is an external application that we host, it is **NOT** written by us.
Apertium contains of a backend, written in Python, and a frontend, which is a
React application. However, we do run on a fork from upstream, which is so far
behind that the version we are running, is quite radically different from what
upstream uses.


## Architecture

Apertium runs in containers. There is one container for the API, `apertium-api`.
Then, each instance runs in their own container, they are:
`apertium-front-jorgal`, `apertium-front-tolkimine`, `apertium-front-mt`,
`apertium-front-mt-testing`. That is, the 4 different clients for the different
language grups all use the same API.


## Maintenance

We use a script to do common maintenance tasks. See
[github.com/giellatekno/gtweb-service-script](https://github.com/giellatekno/gtweb-service-script).
Apertium nightly provides all resources that is required for Apertium. They are automatically
updated daily, through standard `apt` machinery.


## TLS (SSL) certificates


## Logs
