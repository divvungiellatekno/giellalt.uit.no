Passwordless login by using ssh
===============================

These instructions will work for Linux, and probably MacOS.


## Overview

By using SSH keys, you can avoid having to type a password to login
to servers using `ssh`.


### Check for existing keys

Check if you already have a key for this machine:

```bash
ls -al ~/.ssh/id_*.pub
```

If you see a listing, it will most likely be file with the name
`id_ed25519.pub`, but other names are possible. **Continue to the
next section if you have a key.**

If you see `No such file or directory`, then you must generate a new key.
To do that, simply run:

```
ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"
```

You will be prompted for where to save the new files. Just press Enter
to use the suggested value (which will be in `/home/username/.ssh/`).

Next you will be asked for a password. You can choose _not_ to have a
password, in which case just press Enter. It is considered safer to
have a password, but of course this also partially comes at some
inconveniences. See _A note on passwords_, below.

If you do type a password, that password has to be typed every time the
key is accessed/used.


## A note on passwords

If your ssh key does _not_ require a password, anyone who gains access
to the key, now has access to the servers you log on to, too. It should
go without saying, that your private key (usually the file
`/home/youruser/.ssh/id_ed25519`) - is private. Do not share it with
_anyone on earth -- or the universe - for any reason - whatsoever - ever_.

But, if disaster strikes, and you lose your private key, or someone
gets access to your machine, then, if your key is password-proteced,
the key is still useless to them (so long as your machine is not currently
connected to ssh, of course). So even though it feels exactly the
same to type in your _ssh-key-password_, instead of your
_user-password-on-the-server_ when using a password-protected ssh key
when logging on to a server through ssh, now, two factors are needed:
your key, as well as the accompanying password - instead of just one
or the other (either the password for password-logins, or the key,
for passwordless logins).

However, this is of course an inconvenience, and in one way defeats
the entire purpose of this document. A neat compromise is however
available, see the section on _ssh agent on terminal creation_, below.

**Note**: You are _not_ required to have a password on your ssh key!
This section is just here to help you understand the situation, and
the potential risks. Using a passwordless ssh key to login to ssh
is still better than using password-logins!


### Send the public key to the server

Now that you have a key pair, you send the public part of the key
to the server you do `ssh` logins to, by doing:

```
ssh-copy-id username_at_server@server_domain_name
```


## Disable password authentication

To completely disable the ability to log on as a user to a server,
you can disable password authentication for that user on that server.

**Note**: It should go without saying, but if you disable password
authentication, the only way to log on is by having the ssh key.
If you lose this key (by any means, such as losing the machine,
the machine stops working, or accidentally delete the key, etc),
then you are naturally locked out of logging in, and will have to
get an administrator to help you.

The way you do it, is edit the file `/etc/ssh/sshd_config` on the server.
At the end of the file, append the following:

```
Match User <username on server>
        PasswordAuthentication no
        KbdInteractiveAuthentication no
```

Save this file, then restart ssh, by doing `sudo systemctl restart ssh`.


## ssh agent on terminal creation

If you have an ssh key with a password, you can modify your `~/.bash_profile`
file, to always start up an ssh agent whenever you start up a terminal.
When the ssh agent starts up, you type in the password for the ssh key.
Then, whenever you `ssh` into a server, using this key, you will not
have to type your password.

Of course, if anyone gets access to your machine, that has a terminal
open, then, and only then, will they have access to the servers.

Therefore, this is a good compromise. You can start the terminal, type
in your password once, and close the terminal when you are done. As
long as your terminal is not open in the unfortunate case that someone
gets ahold of your machine, you are still secure.

How to do it is simple, just append this snippet to `~/.bash_profile`:

```
# Start the ssh agent on every terminal creation
# https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent() {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
```

Restart your current terminal for the snippet to take effect.
