# Common server administration tools

Here is a quick cheat sheet on the various tools we use on the servers. These
tools are standard linux tools.


## htop

`htop` is a process watcher. Run it with the simple `htop` command to see the
processes running, and how much CPU and RAM they use. Useful to find processes
that are experiencing a high resource use. It is typically the first tool to run
after logging on to a server, just to have a general quick look.


## podman

Many of the servers run their services in containers, using `podman`. **Note:**
Containers run under a specific user, make sure to `su` to the appropriate user
for the server you are on, if podman seems "empty"!

Common commands include `podman ps -a` to list all containers, or
`podman image ...` to handle images, `podman pull IMAGE` to pull an image from a
repository, and `podman restart CONTAINER` to restart a container.

**NOTE:** Some servers (_gtweb_ and _gtoahpa_) have a custom _service script_ to
do common tasks, including restarting services running in containers, but using
`podman` (and `systemctl`) directly is fine, too.


## systemd

The main tool to start, stop, restart services. The `systemctl` command is used to
start, stop, restart services, for example `sudo systemctl restart <service>`. Note the `sudo`, most systemd-commands must be run with sudo.


## less, head, tail, and cat

Remember that some files, particularly log files, can be very large. Loading them
up in `vim` (or even `nano`) to take a look at, can be very slow. Prefer to use `head` to look at the start of the file, `tail` to look towards the end, and `less` if you want paged output where you can scroll. `cat` prints the entire file to standard out.


## adduser and usermod

Add users with `adduser`, and add users to the sudo group with `usermod -aG sudo USERNAME`.


## chmod and chown

If permissions are an issue, they are changed with `chmod`, and `chown`. Some files need to be executable, do that with `chmod +x FILE`. Sometimes, a particular user
must own the file, do that with `chown`.


## df and du

Use `df` to see disk usage, and `du` when looking at file sizes, which includes
the sizes of all subdirectories.


## rg (or grep)

To search for text in files, all our servers have _ripgrep_, with the command name
`rg` installed. It is faster than, and has a simpler syntax to remember than `grep`
, which of course also is available.


## fd (or find)

To find files by name, use `fd`, which has a nice and easy syntax, or you can use
`find`, which is also available.


## dig

`dig` is a DNS info query tool. Use it to figure out which domain names are pointing where.


## tmux (or screen)

If you are planning to do run a long-running process on the servers, consider
using `tmux` (or `screen` if `tmux` is not installed). With those, you can start
the command, and then detach (or even log out of the server), and still still
have the command running, and attach back to the same terminal session later.
Can be useful, so that a command doesn't stop half way just because the connection
to the server failed, for example.

## Others

`traceroute` and `ping` to check connectivity. `netstat`, `ss`, `lsof` to check
check open ports, etc. `scp` (and `rsync` can be used to copy files from local to the server). `journalctl` to look at system logs.
