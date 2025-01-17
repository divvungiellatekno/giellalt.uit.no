# Sending server logs to Azure

By *Anders Lorentsen*, January 2025.

## Motivation

We want to save the logs from our applications for later analysis, both to
make the services themselves better (technnical debugging), as well as to
learn from them (academically).

Servers are not emphemeral, but they also cannot be trusted to never crash
or fail. It is there paramount that the logs are stored also outside of the
servers. For us, *outside* means *Azure*. Most services we have in use, send
most of their logging data to Azure, and this document describes how that is
done. It gets quite detailled, so beware.

*In this document, the __portal__ refers to the __azure portal__ website. If
not otherwise specified, __the cli__ refers to the __az cli__ tool. A full list
of all abbreviations and terminology used in this document is found towards the
end.*


## Overview

Our VMs has installed *Azure Arc Agent* (*AAA*), software that registers the VM
with azure. To gather logs from systemd services running on the VMs, and send
those to azure from the VM, software called *Azure Monitor Agent* (*AMA*) is also
installed on the VMs.

The logging framework in Azure is called *Azure Monitor*, and it contains a
*Log Analytics Workspace* (*LAW*), which is where logs are conceptually sent.
The logs can be viewed for 30 days in the portal, or through the *az cli*.

To archive the logs, the logs are also sent directly to a *storage account*,
from the *LAW* by an export rule. A *storage account* can retain data
indefinetely.


## Viewing the logs

### In log analytics workspace

Logs from up to 30 days ago is available in the log analytics workspace. They
can be viewed in the portal, or through the cli. I have a script which wraps
an `az` command to simplify looking at logs. It is found in
`giellatekno/gtweb-service-script`.

#### Query language

The query language for looking the tables in a log analytics workspace, is
called *Kusto Query Language (KQL)*, learn about it on its documentation:
[learn.microsoft.com/en-us/kusto/query/](https://learn.microsoft.com/en-us/kusto/query/)

The simplest query is to just mention the table: `Syslog`. To contrast it, here
is a more useful query:

    Syslog
    | project TimeGenerated, HostName, SyslogMessage, ProcessName
    | order by TimeGenerated
    | limit 100


### In storage account

The logs in the log analytics workspace is a default retention period of 30
days. To keep the logs permanently, we use the ability to send logs to blob
files in a storage account.

## Where logs are stored

The logs will be stored in blobs, split up by the hour, so logs for
every hour is stored in a separate file. The hourly logs will have names of
the format:

    insights-logs-{log category name}/resourceId=/SUBSCRIPTIONS/{subscription ID}/RESOURCEGROUPS/{resource group name}/PROVIDERS/{resource provider name}/{resource type}/{resource name}/y={four-digit numeric year}/m={two-digit numeric month}/d={two-digit numeric day}/h={two-digit 24-hour clock hour}/m=00/PT1H.json

So, for us, that means logs will be

    insights-logs-networksecuritygrouprulecounter/resourceId=/SUBSCRIPTIONS/aaaa0a0a-bb1b-cc2c-dd3d-eeeeee4e4e4e/RESOURCEGROUPS/TESTRESOURCEGROUP/PROVIDERS/MICROSOFT.NETWORK/NETWORKSECURITYGROUP/TESTNSG/y=2016/m=08/d=22/h=18/m=00/PT1H.json

Currently, there is no script to automate the process of looking at logs from
the storage account. Use the portal to download individual files, to take a
look at them.

As an aside, the time period where logs can be actively searched through, can
be extended. Additionally, the log analytics workspace can be set up to also
retain the logs, in an *archival period*, which can be up to 12 years. Still,
these possibilities has not been selected for our system.


## Setup

This is a step by step guide on what has been done to set this up. Each step
is documented more throughly in its own section, below.

1. Created **resource group: gtlab-arcmachines**.
2. Created **log analytics workspace: vm-logs**
3. Install Azure Arc Agent on the VMs
4. Install AMA on the VMs.
5. Create data collection rule (DCR)
6. Associate the rule with our resources
7. Setup data export rule from LAW to Storage Account
    1. Storage account
    2. Set up automatic blob archival


### 1. Creating resource group

All related resource is grouped by a *resource group* in Azure, and we have
everything related to sending logs from the VMs to azure in a resource group
called **gtlab-arcmachines**.

Use the cli command `az group create` to create a resource group, or use
the portal.


### 2. Create log analytics workspace

The log analytics workspace is named **gtlab-arcmachines**, andd was created
using the command:

    az monitor log-analytics workspace create \
        --resource-group gtlab-arcmachines \
        --workspace-name vm-logs

**Anders: This took a long time to be able to do, as it turns out the az cli
is bugged in the newest version on debian sid (2.67.0-1~bookworm is bugged,
2.66.0-1~bookworm works.** *(Microsoft claimed user error in the bug reports,
so finding the fix took me a long time.)*



### 3. Install Azure Arc Agent:

In the Azure portal, navigate to Arc Machines, and click Add. Select the option
to generate a script to use for a single machine. Downloaded the script to
/home/anders/gut/giellatekno/gtweb-service-script/install_arc_script.sh

It's a small script, which does the following (quote from the portal):

    Download an installation script from the Microsoft Download Center.
    Configure the package manager to use and trust the packages.microsoft.com repository.
    Download the agent from Microsoft's Linux Software Repository.
    Install the agent on the server.
    Create the Azure Arc-enabled server resource and associate it with the agent.

After running it on the servers, the server shows up in the portal, under
Arc Machines. But, the monitoring software, the AMA, has not yet been installed.


### 4. Install AMA on the VMs:

To install the AMA on the servers is simple, now that the AAA has been installed
and can control the VM. It is done by an `az` command, locally on my (the
developers) machine:

I have ran this command with `MACHINE_NAME` set to `gtweb-02`, `gtoahpa-02`,
`gtdict-02`, to set up AMA on those servers.

    az connectedmachine extension create \
        --resource-group gtlab-arcmachines \
        --location norwayeast \
        --name AzureMonitorLinuxAgent \
        --publisher Microsoft.Azure.Monitor \
        --type AzureMonitorLinuxAgent \
        --machine-name MACHINE_NAME \
        --enable-auto-upgrade true


### 5. Create data collection rule

Command I ran to create the data collection rule. Most of the data is in
the rule file.

    az monitor data-collection rule create \
        --resource-group gtlab-arcmachines \
        --name gtweb02-local4-syslog \
        --rule-file local4syslog_rule.json

The rule file specifies the *LAW* as the destination, and the *local4* facility
of the *syslog* as the source.

This also means that all systemd services will have to specify that they will
log to the *local4* syslog name. This is done by adding `SyslogFacility=local4`
and `SyslogIdentifier=CONTAINER_NAME` in the `[Service]` section in the systemd
`.service` files.

Conveniently, this also allows us to filter our logs on the syslog identifer,
to easily retrive logs for any of our services.


### 6. Associate the rule with resource

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

Finally we have all information we need to create the association. Have created
one for `gtweb-02`, and one for `gtoahpa-02`:

    az monitor data-collection rule association create \
        --association-name gtweb02syslog-vmlogs \
        --resource /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtweb-02 \
        --data-collection-rule-id /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Insights/dataCollectionRules/gtweb02-local4-syslog

    az monitor data-collection rule association create \
        --association-name gtweb02syslog-vmlogs \
        --resource /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtoahpa-02 \
        --data-collection-rule-id /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Insights/dataCollectionRules/gtweb02-local4-syslog

anders: accidentally used the same `association-name` - is that actually ok?

For gtdict-02, this command was used:

    az monitor data-collection rule association create \
        --association-name gtdict02syslog-vmlogs \
        --resource /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.HybridCompute/machines/gtdict-02 \
        --data-collection-rule-id /subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.Insights/dataCollectionRules/gtweb02-local4-syslog


### 7. Setup data export rule from LAW to Storage Account

It's possible to send logs coming in to log analytics directly to a storage
account. This of course means that we need a storage account, so lets first
look through that.


#### 7.1 Storage account

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


### Further work

#### Logging nginx

Nginx can send its access- and error logs directly to the syslog, see the
nginx
[guide article](https://docs.nginx.com/nginx/admin-guide/monitoring/logging/),
and the [reference](https://nginx.org/en/docs/http/ngx_http_log_module.html).

For us, this means that we add an `access_log` directive to our configuration
files of nginx, which may look like the following:

    access_log syslog:server=unix:///dev/log,facility=local4,tag=nginx,severity=debug;

This should be done on for all nginx servers of NDS instances, in other words,
all files `/etc/nginx/sites-available/*.conf` (`*` is `sanit`, `sanat`, etc).


#### Logging text files

There are many services which writes to log files on disk. These can be sent
to the log analytics workspace, using the ability of the *monitor agent* to
send text files directly, see the azure documentation site on logging text
files: [azure-monitor/agents/data-collection-log-text](https://learn.microsoft.com/en-us/azure/azure-monitor/agents/data-collection-log-text)

For `gtdict`, the `NDS` processes themselves are not really logging any useful.
We should use the text file logging functionality to set up logging of the
`morph_log` files.

We should also set up logging of the global nginx. Here we could log stdout
of the nginx process, but instead we can also here use the access and error
*.log* files that nginx writes to.


#### Create data export

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


#### Set up automatic blob archival

Blobs in a storage account can be moved periodically to an even colder access
tier, called _archive_. This is done by adding a policy rule.

https://learn.microsoft.com/en-us/azure/storage/blobs/archive-blob?tabs=azure-cli


#### Create data collection rule (without rulefile)

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


#### local4syslog_rule

The actual contents of the rule file, which specifies log analytics as the
destination, and syslog local4 facility as the source.

    {
        "description": "send local4 facility of syslog to the syslog table",
        "kind": "Linux",
        "destinations": {
            "logAnalytics": [
                {
                    "workspaceResourceId": "/subscriptions/6748c55c-5151-4849-a9a3-b3ff1841caa1/resourceGroups/gtlab-arcmachines/providers/Microsoft.OperationalInsights/workspaces/vm-logs",
                    "workspaceId": "27d9513f-059e-4762-a795-0f6117c74bc2",
                    "name": "loganalytics-vm-logs"
                }
            ]
        },
        "dataSources": {
            "syslog": [
                {
                    "streams": [
                        "Microsoft-Syslog"
                    ],
                    "facilityNames": [
                        "local4"
                    ],
                    "logLevels": [
                        "Debug",
                        "Info",
                        "Notice",
                        "Warning",
                        "Error",
                        "Critical",
                        "Alert",
                        "Emergency"
                    ],
                    "name": "do-i-need-this"
                }
            ]
        },
        "dataFlows": [
            {
                "streams": [
                    "Microsoft-Syslog"
                ],
                "destinations": [
                    "loganalytics-vm-logs"
                ],
                "transformKql": "source",
                "outputStream": "Microsoft-Syslog"
            }
        ]
    }


### Terminology

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


### Documentation

- **Very** useful introduction to the entire thing:
  https://trstringer.com/azure-monitor-agent-linux-syslog-systemd-journal/
- DCR: https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/data-collection-rule-overview
- ... Search azure on any of the buzzwords!
