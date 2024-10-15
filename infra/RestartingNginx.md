Restarting *nginx*
==================

Nginx is the server we use for http services.

To test whether it is oparative on gtoahpa, click [http://oahpa.no].
If the Oahpa main page comes up, nginx is fine.


Updates to code do not normally require restarting nginx, unless updating configuration
files specifically for nginx. However, should the system reboot and nginx not
survive this reboot, here is what you need to do:


For old servers (Fedora/CentOS):

```
    sudo service nginx restart
```

For new servers (Ubuntu 22.04):

```
    sudo systemctl restart nginx
```


Pay attention to the output, and trouble any errors that come up.


If you after (re)starting nginx do not see:
* on gtoahpa when opening [oahpa.no](http://oahpa.no), the Oahpa.no page itself,


the try restarting iptables as well (for old servers, Fedora/CentOS only):


```
    sudo service iptables restart
```


If for some reason the system is running slowly, inspect processes running,
using ```top``` or ```htop```, the latter of which is a more updated and easier
to interpret tool.
