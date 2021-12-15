Restarting *nginx*
==================

Nginx is the server we use for http services.

To test whether it is operative on gtlab, click [http://testing.oahpa.no].
If you get *Welcome to nginx on Fedora!*, nginx is fine. To test whether it is
oparative on gtoahpa, click  [http://oahpa.no]. If the Oahpa main page comes up,
nginx is fine.


Updates to code do not normally require restarting nginx, unless updating configuration
files specifically for nginx. However, should the system reboot and nginx not 
survive this reboot, here is what you need to do: 


```
    sudo service nginx restart
```


Pay attention to the output, and trouble any errors that come up.


If you after (re)starting nginx do not see:
* on gtlab when opening [testing.oahpa.no](http://testing.oahpa.no), the nginx test page
* or on gtoahpa when opening [oahpa.no](http://oahpa.no), the Oahpa.no page itself,


the try restarting iptables as well:


```
    sudo service iptables restart
```


If for some reason the system is running slowly, inspect processes running,
using ```top``` or ```htop```, the latter of which is a more updated and easier
to interpret tool.
