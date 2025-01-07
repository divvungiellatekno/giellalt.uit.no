# Logging direkte til Azure fra tjenestene som kjører på serverne

**Dette dokumentet er under utarbeiding etter hvert som jeg finner ut
av det, det er ikke linket til av noen andre dokumenter i dokumentasjonssida
pr nå.**

Vi har lyst til å lagre logger fra tjenestene som kjører på serverne,
direkte til permanent lagring i Azure, slik at de taes vare på. Vi har lyst
til å logge *så mye som mulig* og *for så lang tid som mulig*.

Først litt terminologi:

- Azure Arc

  Registrer egen VM (våre servere) som en "hybrid-VM" som er registrert hos
  Azure. Azure får tilgang til noe data og kan styre maskinen noe, så den
  kalles en "hybrid VM".

- Azure Arc Agent (AAA)

  Programvaren som integrerer en "hybrid VM" mot Azure.

- Azure Monitor Agent (AMA)

  Programvare installert på Azure Arc-VM (som allerede har AAA installert),
  som kan laste opp logger og slikt til Azure fra VMen.

- Azure Monitor

  Samlingsprodukt for alt av monitorering og logging i Azure. Alle
  Azure-tjenester er integrert mot Azure Monitor, for overvåking og logging.

- Log Analytics workspace

  Lagringsplass for logger sendt til Azure Monitor.

- Storage Account

  Samlingsprodukt for alt av datalagring i Azure. Tilbyr flere forskjellige
  under-løsninger for lagring av data.

- Data Collection Rule (DCR) [Azure Monitor]

  _Hva_ skal logges, OG _hvor_ skal de sendes, som nedskrevne regler, som
  kan legges inn for forskjellige tjenester.

- Data collection rule associations (DCRA) [Azure Monitor]

  Assosiere en regel (DCR) med en ressurs som skal overvåkes. En regel kan
  assoseres med flere ressurser, og en ressurs kan assosieres med flere regler.
  Altså er det en mange-til-mange-relasjon mellom overvåkingsregler (DCR) og
  ressurser som overvåkes. Hver assosiasjon er en DCRA.


## Hvordan det fungerer

Våre VMer installerer AAA og AMA. Vi setter op en Azure Monitor med en
Log Analytics workspace i Azure, og setter det opp slik at sysloggen til
serverne går til log analytics workspacet.

For å få podman containers til å skrive stdout og stderr til Syslog,
har de fått feltene "SyslogFacility=local4" og "SyslogIdentifier=CONTAINER"
i "[Service]"-seksjonen i .service fila til tjenesten.


## Se loggene

Loggene kan man se i Log Analytics i portalen. Tabellen heter `Syslog`, så
den enkleste spørringa man kan gjøre er `Syslog`. Denne henter alt, altså
alle logglinjer. For å kun se noen av linjene, kan man spørre etter
`Syslog | limit 50`.

Jeg har også et script som bruker `az` internt for å få loggene tilsendt
lokal teriminal. Det ligger i `giellatekno/gtweb-service-script`.


## Lagringsperiode

Det er slik at i Azure Monitor har loggene en standard "retention period" på
30 dager. Vi har to valg: Sette "archive period" opp til 12 år - men også,
eller heller, eksportere loggene fra Azure Monitor til blobs i en Storage
Account. Lagring her **BØR** være billigere....


---



DCR docs: https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-collection-rule-overview


# Temp temp..

logg over hva jeg har gjort:

1. i azure portal, brukte guides for å laste ned et script som legger
   til en vm som azure arc-maskin.
   scriptet er /home/anders/azure_arc_install_script.sh
2. Kjørte det.   (se INSTALL_ARC_AGENT_SCRIPT)
3. Installerte AMA på serveren. (se INSTALL_AMA)
4. Lagde en regel og la den til for serveren i portalen.
   Brukte en gammle log analytics workspace kalt "mock-chatuit-logs",
   bare for å slippe å lage en ny en for denne testen.

N. I portalen: Log analytics workspace "mock-chatuit-logs", Settings -> Tables,
   Settings for "Syslog"-tabellen -> Sett archive period til 12 år.




# INSTALL_ARC_AGENT_SCRIPT:

scripet gjør følgende, i følge azure portal:

    Download an installation script from the Microsoft Download Center.
    Configure the package manager to use and trust the packages.microsoft.com repository.
    Download the agent from Microsoft's Linux Software Repository.
    Install the agent on the server.
    Create the Azure Arc-enabled server resource and associate it with the agent.


# Setup on Azure

- Subscription: Lab subscription Anders.
- Resource group: **gtlab-arcmachines**.
- Log analytics workspace: **vm-logs**. (See *Create log analytics workspace*)
- Data collection rule


# Create log analytics workspace

The command I ran to create the log analytics workspace in use:

    az monitor log-analytics workspace create --resource-group gtlab-arcmachines --workspace-name vm-logs

**Anders: This took a long time to be able to do, as it turns out the az cli
is bugged in the newest version on debian sid (2.67.0-1~bookworm is bugged,
2.66.0-1~bookworm works.** *(Microsoft claimed user error in the bug reports,
so finding the fix took me a long time.)*


# Create data collection rule

    az monitor data-collection rule create \
        --resource-group gtlab-arcmachines \
        --name gtweb02-local4-syslog \
        --rule-file local4syslog_rule.json


## Create data collection rule (without rulefile)

An example of creating a data collection rule without using a rulefile.

    az monitor data-collection rule create \
        --resource-group rg1 \
        --name dcr1 \
        --data-flow \
            streams="Microsoft-Syslog" \
            destinations="logAnalytics1" \
        --log-analytics \
            resource-id=$(az monitor log-analytics workspace show \
                --resource-group rg1 \
                --workspace-name workspace1) \
            name="logAnalytics1" \
        --syslog \
            name="syslog1" \
            streams="Microsoft-Syslog" \
            facility-names="local4" \
            log-levels="Debug" \
            log-levels="Info" \
            log-levels="Notice" \
            log-levels="Warning" \
            log-levels="Error" \
            log-levels="Critical" \
            log-levels="Alert" \
            log-levels="Emergency"

While this would be for adding a syslog to a DCR (but we probably don't need
that, since we add it at creation time).

    az monitor data-collection rule syslog add \
        --data-collection-rule-name \
       --name \
       --resource-group \
       [--facility-names local4 \
       [--log-levels] \
       [--streams] \
       [--transform-kql]

# INSTALL_AMA:

Kjørte denne kommandoen, LOKALT PÅ MIN LAPTOP:

    az connectedmachine extension create --name AzureMonitorLinuxAgent --publisher Microsoft.Azure.Monitor --type AzureMonitorLinuxAgent --machine-name gtweb-02 --resource-group gtlab-arcmachines --location norwayeast --enable-auto-upgrade true

Her er hele seansen, med resultatet:

    anders@debian:~/$ az connectedmachine extension create --name AzureMonitorLinuxAgent --publisher Microsoft.Azure.Monitor --type AzureMonitorLinuxAgent --machine-name gtweb-02 --resource-group gtlab-arcmachines --location norwayeast --enable-auto-upgrade true
    id: /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtweb-02/extensions/AzureMonitorLinuxAgent
    location: norwayeast
    name: AzureMonitorLinuxAgent
    properties:
      autoUpgradeMinorVersion: false
      enableAutomaticUpgrade: true
      instanceView:
        name: AzureMonitorLinuxAgent
        status:
          code: '0'
          level: Information
          message: 'Extension Message: Enable succeeded'
        type: AzureMonitorLinuxAgent
        typeHandlerVersion: 1.33.1
      provisioningState: Succeeded
      publisher: Microsoft.Azure.Monitor
      type: AzureMonitorLinuxAgent
      typeHandlerVersion: 1.33.1
    resourceGroup: gtlab-arcmachines
    type: Microsoft.HybridCompute/machines/extensions
