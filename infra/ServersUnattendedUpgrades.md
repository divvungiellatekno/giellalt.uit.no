# unattended-upgrades

All our servers uses `unattended-upgrades` to keep the system updated with
the newest packages. Packages from apertium are also kept up-to-date every
day this way.

## Configuration files

The important configuration options resides in a few files, as shown:

    anders@gtdict-02:~$ cat /etc/apt/apt.conf.d/20auto-upgrades
    APT::Periodic::Update-Package-Lists "1";
    APT::Periodic::Unattended-Upgrade "1";
    
    anders@gtdict-02:~$ cat /etc/apt/apt.conf.d/52unattended-upgrades
    # Alt fra apertium nightly skal holdes oppdatert hele tida
    
    Unattended-Upgrade::Allowed-Origins {
            "apertium.org:";
            "apertium.projectjj.com:*";
    };
    
    Unattended-Upgrade::Automatic-Reboot "true";
    Unattended-Upgrade::Automatic-Reboot-WithUsers "true";
    Unattended-Upgrade::Automatic-Reboot-Time "04:00";

## Modified timer

By default, the timer to actually perform the updates was set to 0600. Since
we specify automatic reboot time at 0400, we want to change the time of the
updates, so that the reboot happens quickly after the updates, and not 22 hours
later.

To do that, a few settings in the systemd timers has been overriden, by
adding these files, as such:

    anders@gtdict-02:~$ cat /etc/systemd/system/apt-daily.timer
    # Anders: override the default time of 0600, because
    # the unattended-upgrade is set to reboot at 0400 (in case
    # a reboot is needed)
    
    [Timer]
    # The empty line cancels out (resets) the setting, meaning
    # it deletes the setting found in
    # /lib/systemd/system/apt-daily-upgrade.timer
    OnCalendar=
    OnCalendar=*-*-* 1:00
    RandomizedDelaySec=30m

    anders@gtdict-02:~$ cat /etc/systemd/system/apt-daily-upgrade.timer
    # Anders: override the default time of 0600, because
    # the unattended-upgrade is set to reboot at 0400 (in case
    # a reboot is needed)
    
    [Timer]
    # The empty line cancels out (resets) the setting, meaning
    # it deletes the setting found in
    # /lib/systemd/system/apt-daily-upgrade.timer
    OnCalendar=
    OnCalendar=*-*-* 2:00

With this, updates should happen from 01 to 02, and be done in plenty of time
for the reboot to happen at 04 (in case the update needed a reboot to happen
to take effect. that's not always the case).
