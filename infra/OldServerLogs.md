## Logger fra de gamle serverne

Av _Anders Lorentsen, 2024-11-21_

I 2024 ble de gamle CentOS 7-serverne tatt ned, og erstattet med Ubuntu-
servere. I den forbindelse ble alt av logger tatt vare på, og lagt i en
lagringsplass i Azure.


## Hvordan bruke

__TL;DR__

`scp` kan brukes som vanlig til og laste opp og ned filer. Addressen er

```
gtlabbackuplrs.CONTAINER.BRUKERNAVN@gtlabbackuplrs.blob.core.windows.net
```

Husk å bruke riktig ssh-nøkkel (med `-i ~/.ssh/KEY`). F.eks, for å laste ned ei
fil:

```
scp -i ~/.ssh/SSH_KEY gtlabbackuplrs.CONTAINER.BRUKERNAVN@gtlabbackuplrs.blob.core.windows.net:/FIL FIL
```

(på vanlig måte kan man ha sti til lokal fil først for å laste filer opp.)


### Bruker og SSH-Nøkkel

Alle må ha en bruker. Brukeren identifiseres med et navn, f.eks `anders`, eller
`trond`. Brukeren har en tilhørende SSH-nøkkel. SSH-nøkkelen består av to
filer som plasseres i `~/.ssh`-mappa.


### Containers og filer

Hver server (_gtweb_, _gtdict_, osv) har sin egen `container`, som vil si
at den har sin egen ssh addresse (erstatt `CONTAINER` med `gtdict1` eller
`gtoahpa1`).

| Container  | Fil                   | Inneholder |
| :--------- | :-------------------- | :--------- |
| gtdict1    | Readme.txt | Ei enkel Readme-fil |
| gtdict1    | user_log_all.txt.gz   | Alle `user_log.txt` fra alle instanser av NDS i samme fil |
| gtdict1    | morph_log_all.txt.gz   | Alle `user_log.txt` fra alle instanser av NDS i samme fil |
| gtdict1    | nginx_logs.tar.gz | `access` og `error` log for alle instanser av NDS |
| gtdict1    | parse_user_log.rs | Et script for å parse user_log |
| gtoahpa1   | oahpa_db_logs.tar.gz | Hele tabellen `drill_logs` fra databasen for hvert språk |
| gtoahpa1   | uwsgi_logs.tar.gz | Alle filene fra `/var/logs/uwsgi/` |


## Hvordan virker det?

Hvert endepunkt er en `container` i en `storage account` som heter
`gtlabbackuplrs`, som ligger under _"Lab"-supscription_-en til Anders i Azure.
Den har aktivert SFTP (`settings -> SFTP`), les Azures dokumentasjon om hvordan
man får til det.

Hver bruker som skal ha tilgang, må legges til. Innlogging skjer med ssh-key.
Den kan genereres av Azure, og sendes til brukeren, eller brukeren kan
generere sin egen key (som __må__ være RSA, ikke Ed25519).

Man kan også få Azure til å generere en key for en ny bruker, og sende brukeren
keyen etterpå.

__Husk å gi brukeren rettigheter til alle containere!__

_Anders: I tutorialene jeg leste når jeg satt opp dette, så kan jeg ikke huske
å ha lest noe om passord-basert tilgang, men det virker som om webgrensesnittet
tillatter det nå. Så det er et alternativ til å bruke SSH-key._

https://learn.microsoft.com/nb-no/azure/storage/blobs/secure-file-transfer-protocol-support
