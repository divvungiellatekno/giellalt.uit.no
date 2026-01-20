# Restarting the httpd server on *gtweb-01*

#### Are the processes running?

Try (e.g.) [http://jorgal.uit.no](jorgal.uit.no) (write "ja" and translate, the answer should be "og"). If you get no answer, the system is malfunctioning.

#### If machine translation is down, look at the *apy* process

Check whether `apy` runs and look at the log:

```
 ssh gtweb # log into gtweb
 sudo journalctl -u apy -n100 # 100 last lines
```
When things are working, you should get strings in some Saami language.

```
systemctl --state=failed
```

```
sudo rm -rf /var/cache/apy/*    # remove files (be careful with sudo and -rf!
sudo systemctl restart apy      # restart apy
```


### Investigating whether the process do run or not (internally).


## Restarting the mt processes on gtweb-01

Restart is still not documented (but see above), but have a look at
[the page for installing mt on gtweb](https://giellalt.uit.no/mt/infra/UpdatingApertiumOnGtweb.html)

## Apache/httpd (victorio)

# If jorgal is down

The jorgal.uit.no page may give the message `Oversettelse ikke tilgjengelig!`

This command should help:

```
  ssh -t gtweb
  sudo systemctl restart apy
```
