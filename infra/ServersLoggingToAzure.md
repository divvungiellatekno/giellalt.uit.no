# Sending server logs to Azure

**Dette dokumentet er under utarbeiding etter hvert som jeg finner ut
av det, det er ikke linket til av noen andre dokumenter i dokumentasjonssida
pr nå.**

We send the logs of the services running on our virtual machines (servers)
to Azure, for permanent storage.

First some terminology:

- Azure Arc

  Register our VMs as "hybrid VMs" in Azure. Azure gets access to the server,
  and can control some aspects of the machine, but not full, like a VM from
  Azure.

- Azure Arc Agent (AAA)

  The software that integrates a "hybrid VM" with Azure.

- Azure Monitor Agent (AMA)

  Software installed on an Azure Arc-VM (which is a VM with the AAA installed),
  that can upload logs (among other things) to Azure.

- Azure Monitor

  Samlingsprodukt for alt av monitorering og logging i Azure. Alle
  Azure-tjenester er integrert mot Azure Monitor, for overvåking og logging.

- Log Analytics workspace (here: unofficial abbreviation: LAW)

  A place for gathering logs in Azure. Contains analysis and presentation tools
  for viewing the logs as well.

- Storage Account (SA)

  Gathering of many related storage solutions in Azure. The overall skeleton
  allows for many kinds of storage. Blobs, File Shares, etc.

- Data Collection Rule (DCR) [Azure Monitor]

  *What* should be logged, AND *where* it should be sent, as a rule that can
  be applied for multiple resources.

- Data collection rule associations (DCRA) [Azure Monitor]

  Assosiere en regel (DCR) med en ressurs som skal overvåkes. En regel kan
  assoseres med flere ressurser, og en ressurs kan assosieres med flere regler.
  Altså er det en mange-til-mange-relasjon mellom overvåkingsregler (DCR) og
  ressurser som overvåkes. Hver assosiasjon er en DCRA.


## Hvordan det fungerer

Våre VMer installerer *AAA* og *AMA*. Vi setter opp en *Azure Monitor* med en
*LAW*, og lager en *DCR* som sier at *Syslog* skal til *LAW*-en. Vi setter
opp en *DCRA* mellom VM og *LAW*, slik at loggene fra VMet går dit.

Videre setter vi opp en *Storage Account*, og setter opp en *data export*
fra *LAW*-et til *SA*-en. *Storage Account*-en har *Cold access tier*.

TODO: Sette opp storage account auto-archive policy?

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


# Oppsett

Denne punktlista fungerer som logg over hva jeg har gjort, og hvordan det er
satt opp.

1. Opprettet **resource group: gtlab-arcmachines**.
1. Opprettet log analytics workspace: **vm-logs**. (Create log analytics workspace)
1. In the Azure portal, navigate to Arc Machines, and clicked Add.
   Selected to generate a script to use for a single machine.
   Downloaded the script to
   /home/anders/gut/giellatekno/gtweb-service-script/install_arc_script.sh
1. Uploaded the script to gtweb-02 and gtoapa, and ran it there.
   (Install Azure Arc Agent script)
1. Installed AMA on the servers. (Install AMA)
1. Opprettet data collection rule. (Create data collection rule)



# Install Azure Arc Agent script:

It's a small script, which does the following (quote from the portal):

    Download an installation script from the Microsoft Download Center.
    Configure the package manager to use and trust the packages.microsoft.com repository.
    Download the agent from Microsoft's Linux Software Repository.
    Install the agent on the server.
    Create the Azure Arc-enabled server resource and associate it with the agent.

After running it, the server shows up in the portal, under Arc Machines.
But, the monitoring software, the AMA, has not yet been installed.


# Install AMA:

To install the AMA on the servers is simple, now that the AAA has been installed
and can control the VM. It is done by an `az` command, locally on my (the
developers) machine:

I have ran this command with `MACHINE_NAME` set to `gtweb-02`, `gtoahpa-02`,
to set up AMA on those servers.

    az connectedmachine extension create \
        --resource-group gtlab-arcmachines \
        --location norwayeast \
        --name AzureMonitorLinuxAgent \
        --publisher Microsoft.Azure.Monitor \
        --type AzureMonitorLinuxAgent \
        --machine-name MACHINE_NAME \
        --enable-auto-upgrade true


# Create log analytics workspace

The command I ran to create the log analytics workspace in use:

    az monitor log-analytics workspace create \
        --resource-group gtlab-arcmachines \
        --workspace-name vm-logs

**Anders: This took a long time to be able to do, as it turns out the az cli
is bugged in the newest version on debian sid (2.67.0-1~bookworm is bugged,
2.66.0-1~bookworm works.** *(Microsoft claimed user error in the bug reports,
so finding the fix took me a long time.)*


# Create data collection rule

Command I ran to create the data collection rule. Most of the data is in
the rule file.

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

# Associate rule with resource

Next step is to associate the rule with the resource.

The command to do that is

    az monitor data-collection rule association create \
        --association-name ASSOC_NAME \
        --resource RESOURCE \
        --data-collection-rule-id RULE_ID

As we can see, we need `RESOURCE`, which is the resource we want to monitor,
in our case, the VM. We also need the id of the data collection rule, here
called the `RULE_ID`.

To get `RESOURCE`, we can run

    az monitor data

Our `RESOURCE` is the full id of our virtual machines, which follows this
format:

    /subscriptions/SUBSCRIPTION_UUID/resourceGroups/RESOURCE_GROUP/providers/Microsoft.HybridCompute/machines/MACHINE_NAME

So, in our case, we just replace with our values, such as this (for gtweb-02):

    /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtweb-02

To find the `RULE_ID`, we use

    az monitor data-collection rule show \
        --resource-group gtlab-arcmachines \
        --name gtweb02-local4-syslog \
        --query id -o tsv

    /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Insights/dataCollectionRules/gtweb02-local4-syslog

Finally we have all information we need to create the association:

    az monitor data-collection rule association create \
        --association-name gtweb02syslog-vmlogs \
        --resource /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtweb-02 \
        --data-collection-rule-id /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Insights/dataCollectionRules/gtweb02-local4-syslog

    az monitor data-collection rule association create \
        --association-name gtweb02syslog-vmlogs \
        --resource /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtoahpa-02 \
        --data-collection-rule-id /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Insights/dataCollectionRules/gtweb02-local4-syslog


# Set up exporting log analytics data to storage account

It's possible to send logs coming in to log analytics directly to a storage
account. This of course means that we need a storage account, so lets first
look through that.


## Storage account

To create a storage account, we use the command:

    az storage account create \
        --name NAME \
        --resource-group RG \
        --access-tier <Cold|Cool|Hot|Premium> \
        --location LOCATION \
        --sku SKU \

    LOCATION: The name of the Azure data center. "norwayeast" for us.
    SKU: Redunancy mode. One of Premium_LRS, Premium_ZRS, Standard_GRS,
       Standard_GZRS, Standard_LRS, Standard_RAGRS, Standard_RAGZRS,
       Standard_ZRS.
       Default: Standard_RAGRS.

    az storage account create \
        --resource-group gtlab-arcmachines \
        --name vmlogsarchive \
        --location norwayeast \
        --access-tier Cold \
        --sku Standard_LRS 


## Archiving the blobs

Blobs in a storage account can be moved periodically to an even colder access
tier, called _archive_. This is done by adding a policy rule.

https://learn.microsoft.com/en-us/azure/storage/blobs/archive-blob?tabs=azure-cli


## Where logs are stored

The logs will be stored in blobs, split up by the hour, so logs for
every hour is stored in a separate file. The hourly logs will have names of
the format:

    insights-logs-{log category name}/resourceId=/SUBSCRIPTIONS/{subscription ID}/RESOURCEGROUPS/{resource group name}/PROVIDERS/{resource provider name}/{resource type}/{resource name}/y={four-digit numeric year}/m={two-digit numeric month}/d={two-digit numeric day}/h={two-digit 24-hour clock hour}/m=00/PT1H.json

So, for us, that means logs will be

    insights-logs-networksecuritygrouprulecounter/resourceId=/SUBSCRIPTIONS/aaaa0a0a-bb1b-cc2c-dd3d-eeeeee4e4e4e/RESOURCEGROUPS/TESTRESOURCEGROUP/PROVIDERS/MICROSOFT.NETWORK/NETWORKSECURITYGROUP/TESTNSG/y=2016/m=08/d=22/h=18/m=00/PT1H.json


## Create data export

To create a data export, use the following command:

    az monitor log-analytics workspace data-export create \
        --resource-group RESOURCE_GROUP \
        --workspace-name WORKSPACE_NAME \
        --data-export-name EXPORT_NAME \
        --destination DESTINATION \
        --tables TABLES

    EXPORT_NAME: An arbitrary name for this specific export rule.
    WORKSPACE_NAME: Name of log analytics workspace we're sending logs from.
    DESTINATION: id of the storage account to send to.
    TABLES: A list of tables that we want to send.

So, in our case, we will use the command:

    az monitor log-analytics workspace data-export create \
        --resource-group gtlab-arcmachines \
        --workspace-name vm-logs \
        --data-export-name vm-logs-archiving \
        --destination /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Storage/storageAccounts/vmlogsarchive \
        --tables Syslog



# Remaining work to do...

Install on the other servers. Set up all required thigns to make everything
work on the other servers.
