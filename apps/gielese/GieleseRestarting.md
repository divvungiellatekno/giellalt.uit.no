Restarting Gïelese
==================

#  Overview

Running the [Gïelese](http://gielese.no/play/) process depends on the following
things on the *gtweb* server:

1. nginx, the HTTP server, which connects to Gïelese processes
1. mongodb, which stores user data, points, and such.
1. Gïelese python processes, served via gunicorn

Nginx may be started whenever, and ideally will be running already.
Mongodb must be running first, so that the Python processes can
connect.

#  Starting the service

Do this as your regular user account, thus the sudo password will be your usual
sudo password.

```
    sudo service gielese-mongodb start
```

Then if all is good... 

```
    sudo service gielese start
```

NB: commands accepted by these processes are also *stop*, and *restart*; however,
make sure to start mongodb first, otherwise the gielese process will not start.

#  Restarting the services

The order to restart these is such that the web service is not running without mongo, thus:

```
    sudo service gielese stop
    sudo service gielese-mongodb stop
    sudo service gielese-mongodb start
    sudo service gielese start
```
