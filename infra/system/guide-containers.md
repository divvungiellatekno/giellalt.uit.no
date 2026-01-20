# En primer om containers

En kort introduksjon til containerteknologi. Begrep som _containers_, _images_,
_podman_, _container registry_ brukes flittig i denne sammenhengen. Her er ei
lita innføring i hva disse betyr.


## Introduksjon

Alle som drifter systemer ønsker at programmene sine skal (1) kjøre over alt,
uten å behøve å gjøre mye oppsett av miljøet programmet skal kjøres i, og (2)
ikke påvirkes av andre programmer som kjører i samme miljø.

Det ideelle hadde vært en helt egen server for hver applikasjon. Da hadde man
kunne ha satt opp alle systembiblioteker og avhengigheter spesifikt for denne
applikasjonen, og vært sikker på at ingenting kolliderer, og at applikasjonen
får være i fred for andre, og utnytte hele maskinen slik den selv ønsker.

Dette er ikke prakis mulig å få til. Men, vi har virtuelle maskiner.


## Virtuelle maskiner

En _virtuell maskin_ er et program som kjører på en _fysisk, faktisk maskin_,
som man kan installere et operativsystem og programmer i. Man kan ha flere
virtuelle maskiner installert på én og samme fysiske maskin. Operativsystemet
som kjører som et program inni hver enkelt virtuelle maskin, "tror" at den
er den faktiske fysiske maskinen. Programmet som kjører på den
fysiske maskinen, og administrerer hvilke virtuelle maskiner som får tilgang
til hva, heter en `hypervisor`. Det klassiske diagrammet er som følger:

```
            --------   --------   --------
            | VM 1 |   | VM 2 |   | VM 3 |   ....
            --------   --------   --------
                |          |          |
            ---------------------------------------
            |            hypervisor               |
            ---------------------------------------
                              |
            ---------------------------------------
            |         physical machine            |
            ---------------------------------------
```

Denne modellen for isolering, og å kunne kjøre flere servere på én og samme
fysiske maskin, brukes flittig. For eksempel er alle serverne våre VMer som
kjører på en delt, krafig, fysisk server.

Problemet med denne modellen er ressursbruk. Et helt operativsystem (linux)
per applikasjon bruker mye ressuerser. Mye ressurser går rett og slett med
til å kjøre selve operativsystemet.


## Containers

Hva om alle VMene kan dele på samme operativsystemkjerne? Da kan hver VM
slippe å ha sin helt egen operativsystemkjerne installert, og holde styr på.
Man kjører en _container orchistrator_, som er et program som organiserer
containers på en maskin, på samme måte som en hypervisor er et program
administrer VMer på en fysisk maskin.

Det finnes to store container orkistratorer: _docker_, og _podman_. _Docker_
kom først, og er størst, men fungerte ikke på de gamle serverne våre. Det
gjorde derimot _podman_ (som er Oracle sitt produkt).

Modellen vi da får, ser slik ut:

```
    -------------  ------------- 
    | Container |  | Container |    ....
    -------------  -------------
           |             |
    ---------------------------------------
    |   container orchistrator (podman)   |
    ---------------------------------------
                      |
    ---------------------------------------
    |  operativsystemkjerne (Linux, VM)   |
    ---------------------------------------
                      |
    ---------------------------------------
    |            hypervisor               |
    ---------------------------------------
                      |
    ---------------------------------------
    |         physical machine            |
    ---------------------------------------
```

En container er altså *som et VM, bare mye mindre ressurskrevende*.


## Containers og images

Et _container image_ (eller bare _"image"_) er i prinsippet bare ei fil på
en maskin. Den inneholder informasjonen om hva som er installert i imaget,
og hva den internt skal kjøre. Man kan kjøre et og samme image flere ganger.
(f.eks med forskjellige parametre). Et image som kjører, kalles en _container_.

Man bygger et image fra en spesifikasjon, kalt en `Dockerfile`. Den enkleste
formen for ei Dockerfile inneholder kun linja:

```dockerfile
FROM scratch
```

Se for deg at du sitter på kommandolinja på en linux-maskin, som i tillegg
til selve linuxkjerna, kun har et super-simplt lag med essensielle programmer
installert, som f.eks et `shell` (så man kan skrive kommandoer). Resten av
linjene i Dockerfila er kommandoer som man ville ha kjørt på denne maskinen.

Dette er selvfølgelig i praksis litt slitsomt. Det man egentlig vil ha, er
en linuxdistribusjon som grunnlag. Det finnes! For eksempel kan første linja
i dockerfila være:

```dockerfile
FROM docker.io/library/debian:bookworm
```

Det som skjer her, er at man starter fra et image som allerede har Debian
installert. En debianinstallasjon for servere, uten grafiske programmer,
selvfølgelig, men med tilgang til `apt` og slikt. Nå er det en smal sak
å legge sin egen app _oppå_ der, kanskje som følger:

```dockerfile
FROM docker.io/library/debian:bookworm
RUN apt-get update && apt-get install -y SOME_DEPENDENCIES ...
COPY * /app
CMD [ "/app/applikasjon" ]
```

Her ser vi for oss at vi står i ei mappe som inneholder et prosjekt, en app,
som har et program som heter "applikasjon" liggende i mappa. Den applikasjonen
trenger noen systembiblioteker installert på systemet, og det installerer man
på linje to. Deretter kopierer vi alt som ligger i nåværende mappe, _inn i_
ei mappe _inni imaget_ under stien `/app`.

Merk at disse kommandoene blir kjørt inni imaget, og ikke på systemet. Alle
filer man kopierer inn, blir en del av filsystemet til imaget, men ikke på
host-systemet. Et image er altså helt isolert fra host systemet.

Slik bygges et image. Når man bygger et image, gir man det et navn (kalt en
_tag_). Nå har man et image som kjører applikasjonen, men som ikke er
avhengig av noe på systemet, annet enn orkistratoren. Man kan få ut imaget
som ei .tar fil, og manuellt overføre den til en annen maskin for å kjøre den,
eller man kan laste den opp til et _container registry_, og deretter laste
den fra _container registriet_ på en annen maskin. Vi gjør dette med et
container registry i Azure, som ligger under addressen
`gtlabcontainerregistry.azurecr.io`.


## Oppsummering

Hver tjeneste vi kjører, er et image. Det gjør at alle avhengigheter er
installert, og det eneste serveren må ha, er `podman`, for å kunne kjøre
imagene.

Når vi oppdaterer en applikasjon, bygger vi et nytt image lokalt på
utviklermaskinen, laster det opp til container-registriet, laster det så
ned fra container-registriet på serveren, og restarter imaget, så den nye
versjonen av imaget kjøres.
