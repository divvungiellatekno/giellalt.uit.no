Restarting gtlab
================

As of 14.04.2020 there are no services running on gtlab.
All Oahpa instances and Konteaksta have been moved to gtoahpa-01.


##  In case of emergencies...


## Restarting Nginx


Should the system reboot and nginx not
survive this reboot, see [how to restart nginx itself](RestartingNginx.html).


There have been problems with rebooting gtlab. If you after (re)starting nginx do not see the nginx test page when opening [testing.oahpa.no](http://testing.oahpa.no) then try restarting iptables as well:


```
    sudo service iptables restart
```


If for some reason the system is running slowly, inspect processes running,
using
```
    top
```
or
```
    htop
```
, the latter of which is a more updated and easier to interpret tool.
