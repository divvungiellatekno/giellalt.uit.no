# gtdict

## Troubleshooting

### Server doesn't respond at all

`ssh` to the server. Try to restart both nginx, as well as all the services:
`sudo systemctl restart nginx` to restart nginx, then `sudo su neahtta`, and `nds restart all`, to restart all the individual instances.

If you can't even `ssh` to the server, message ITA!


### Server is very slow

Restart it. `ssh` to the server, restart the systemd service, for example for, sanit: `sudo systemctl restart nds-sanit`.
`gtdict.uit.no` is an alias for `gtdict-02.uit.no`.


## Overview

Setup is the same as on the old gtdict. Maintenance is done with the `nds`
maintenance script, see
<https://giellalt.github.io/dicts/nds/nds_commands.html>.

gtdict has 32GB RAM, 8 CPUs, because it is a fairly big application, and it's usage
is very high. Very high memory usage can be a problem. If it is particularly slow, check out `htop` for memory usage, and restart instances if needed.

- Running services:
  - <https://sanit.oahpa.no>
  - <https://baakoeh.oahpa.no>
  - <https://kyv.oahpa.no>
  - <https://muter.oahpa.no>
  - <https://saanih.oahpa.no>
  - <https://vada.oahpa.no>
  - <https://bahkogirrje.oahpa.no>
  - <https://saan.oahpa.no>
  - <https://sanat.oahpa.no>
  - <https://sanj.oahpa.no>
  - <https://sonad.oahpa.no>
  - <https://valks.oahpa.no>
