# Users and groups

Administrators needs to have their own user on the server. To get root access,
they must also be a member of the `sudo` group. Other applications may require
group membership, too.


## Managing users

### Forgotten passwords

Use `sudo passwd USERNAME` to set a new password for a user. Set a new password,
(preferibly a strong one), and then have the user immediately change their own
password after logging in (they will use simply `passwd` to do that after logging in).

A python command to generate a strong password: `python -c "import secrets; print(secrets.token_urlsafe(14))"`


### Adding users

(_Reference:_ <https://www.digitalocean.com/community/tutorials/how-to-add-and-delete-users-on-ubuntu-20-04>).

Add users with `sudo adduser USERNAME`, and add users to the sudo group with `usermod -aG sudo USERNAME`.

Root privleges: Run `sudo visudo`. It opens up a text editor. Find the line

```
    root    ALL=(ALL:ALL) ALL
```

And add a new line for the new user (here, the new user is named `newuser`):

```
    newuser ALL=(ALL:ALL) ALL
```

### Deleting users

Delete a user with `sudo deluser USERNAME`. You can remove the users home directory
at the same time with `sudo deluser --remove-home USERNAME`. **Remember:** If that
user had sudo rights, remove the line that was added previously, with the `sudo visudo` command.


## Managing groups

To add a user to a group, use `sudo usermod -aG GROUP USERNAME`. Check group membership of a user with `sudo groups USERNAME`.

To see the group number of a user, look at the file `/etc/group`. To create a new group, use `sudo groupadd GROUPNAME`. This is rarely needed.


## Group attribute for files

Change a directory to be owned by a specified user with `chown USERNAME -R DIRECTORY`. Change group ownership using `chgrp USER -R DIRECTORY`. Do both in one command using `chmod USERNAME:GROUPNAME -R DIRECTORY`.
