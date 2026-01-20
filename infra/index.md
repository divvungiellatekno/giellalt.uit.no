# Infrastructure

These pages document our infrastructure, services, servers, and administration of
those. This documentation is relevant only to readers with access to our servers.

## Services and Servers

Some setup is common for all our servers, take a look at the [Overview](servers/overview.html).

Service | Server
---|---
[SVN Server](services/svn-server.html) | [gtsvn](servers/gtsvn.html)
[sátni.org](services/satni.html)| ?? [satni](servers/satni.html)
[giellatekno.uit.no](services/giellatekno-page.html) | ?? [divvun](servers/divvun.html)
[dicts.uit.no](services/dicts-portal.html) | ?? [divvun](servers/divvun.html)
[gielese.no](services/gielese.html) | ?? [divvun](servers/divvun.html)
[Neahttadigisanit](services/nds.html) | [gtdict](servers/gtdict.html)
[Apertium](services/apertium.html) | [gtweb](servers/gtweb.html)
[Korp](services/korp.html) | [gtweb](servers/gtweb.html)
[cgi-bin](services/cgi-bin.html) | [gtweb](servers/gtweb.html)
[Webdict](services/webdict.htm) | [gtweb](servers/gtweb.html)
[Old Webdict](services/old-webdict.html) | [gtweb](servers/gtweb.html)
[webpipelines](services/webpipelines.html) | [gtweb](servers/gtweb.html)
[Metadict](services/metadict.html) | [gtweb](servers/gtweb.html)
[Kursa and Kuvsje](services/kursa-kuvsje.html) | [gtoahpa](servers/gtoahpa.html)
[Oahpa portal](oahpa-portal.html) | [gtoahpa](servers/gtoahpa.html)
[Oahpa programs](services/oahpa-programs.html) | [gtoahpa](servers/gtoahpa.html)
[Konteaksta](services/konteaksta.html) | **not running!**


## Infrastructure and administration

- [Users and groups](system/users-and-groups.html)
- [How to set up signing certificates](system/SettingUpSigningCertificates.html)
- [Update content on online Speller Server](SpellerServer.html)
- [Accessing private repos from the servers](ClosedGithubRepoBotAccess.html)
- [Automatic updates](ServersUnattendedUpgrades.md)
- [Azure: Giellateno Container Registry](gtlabcontainerregistry.md)
- [Azure: Server logs streaming directly to cloud storage](ServersLoggingToAzure.html)
- [Azure: Logger fra de gamle serverne](OldServerLogs.html)
- [Guide: Automatic login by using ssh](system/auto-pass.html)
- [Guide: Containers (norwegian)](system/guide-containers.md)
- [Cheat sheet: Common server admin tools](server/common-tools.html)
- [Apache Forrest](forrest/index.html)
- [Testing tools for the sámi LT project](docu-testing.html)


## Obsolete documents (for reference)

- [Møte om serveroppgradering - 9.3.2018](../admin/technical/2018-03-09Servers.html)
- [Old server list](VirtualServers.html)
- [Server Programs and Logs](ServerProgramsAndLogs.html)
- [Managing groups](groups.html)
- [Adding and removing users](addremove.html)
- [Serveroppgradering (2018)](system/Serveroppgradering.html)
- [Setup of svnserve on victorio](system/svnserve.html)
- [Adding users to svn](addsvn-users.html)
- [Manually send svn e-mail](manually-send-svn-email.html)
- [Service Checks After System Restarts](system/ServiceChecksAfterSystemRestarts.html)
- [Maintaining users and access administration](system/UsersAndAccessAdministration.html)
- [Restarting Gtlab](Gtlabrestart.html)
- [Byte til Markdown](Byte_til_Markdown.html)
- [Korpusinnsamling, kontrakter](corpus_collectors_howto.md)
- [CyrillicSaamiKeyboard.md](CyrillicSaamiKeyboard.md)
- [The interface for our web pages.](docu-webinterface.md)
