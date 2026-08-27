# Searching nginx logs

Nginx logs on our servers are usually located in `/var/log/nginx`, but
check the nginx config `/etc/nginx/nginx.conf` (and related config files),
as some services may log elsewhere.

There are two log streams: `access.log`, and `error.log`. Access log logging
all requests, while the error log records any errors that happen on the server
side. To view traffic, access log is the one you want.

The log files grows very big, very fast, and are therefore _rotated_ regularly.
There is a separate tool on the server that does this, called _logrotate_. Take
a look at `/etc/logrotate.d/nginx` for how the nginx logs are rotated - and
refer to documentation on logrotate itself to understand that file.

The bottom line is that there is not just one `(access|error).log` file, but 14.
The current one is named like `access.log`, while yesterdays log file is
`access.log.1`, and the starting from the second day, they are also gzipped, so
we have `access.log.2.gz`, `access.log.3.gz`, etc, up to 14 days. Older logs
are stored permanently in Azure (both for safeguarding, in case of server
failure, but also because our servers doesn't have the disk space to keep
ever increasing log files in the hundreds or thousands of GB) -- see the
article on _server logging to azure_ for more information about the logs
on Azure.


# Searching

Because log files are rotated, it can be a bit cumbersome to search through them
with the standard _rg_ or _grep_ tools. We have some other tools to easier
look through the logs.

One of them is [nginx-logs](https://github.com/giellatekno/nginx-logs). On
gtweb, the `services` user has the binary in the root of the homedirectory.

Run directly, such as e.g.: `services@gtweb-02:~$ ./nginx-logs --help`.
