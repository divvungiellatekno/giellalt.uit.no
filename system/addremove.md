Adding and removing users on linux
==================================

Be root. To add a new user named Laila Sara with laila as the user name,
do the following:

You will need *nnnnn*, the next free uid number, the numbers start with
10000 for trond. Check out the next number by typing `tail /etc/passwd`.
Say it is 501.

Then make the group laila:

`/usr/sbin/groupadd -g 501 laila`

Then make the new user. Write the following command. It shall be written
in one line, but is here written on multiple lines for readability.

     /usr/sbin/useradd
     -u 501
     -g 501
     -G cvs
     -c "Laila Sara, Samisk inst."
     laila

The user must own her own catalogue, but others may want to read it.
This is achieved by writing:

`chown laila:laila /home/laila`

`chmod 0755 /home/laila`

Then assign the new user a password, by writing:

`passwd laila`

Remember to copy the .bashrc, .bash\_profile and .emacs files to the
laila account while you are still a root user. Remember to run the
initial "cvs get" command.

If the user has forgot his/her own password, log in as root, and enter
the command "passwd laila". You will not be prompted for the old
password, and the new one you enters will erase the old one.

Adding users on mac server
==========================

Use the dscl command. This example would create the user "luser", like
so:

    dscl . -create /Users/luser
    dscl . -create /Users/luser UserShell /bin/bash
    dscl . -create /Users/luser RealName "Lucius Q. User"
    dscl . -create /Users/luser UniqueID "1010"
    dscl . -create /Users/luser PrimaryGroupID 80
    dscl . -create /Users/luser NFSHomeDirectory /Users/luser
    You can then use passwd to change the user's password, or use:

    dscl . -passwd /Users/luser password

    You'll have to create /Users/luser for the user's home directory and
    change ownership so the user can access it, and be sure that the
    UniqueID is in fact unique (via the command id 1010 etc.)

This line will add the user to the administrator's group:

    dscl . -append /Groups/admin GroupMembership luser

Removing users on linux
=======================

For removing (in this example the user laila), be root, and use this
command (-r removes the files of the user al well):

    /usr/sbin/userdel -r laila
    rm -r /export/home/laila
    cd /var/yp
    make

A general warning: The commands that the manuals say should work, do
work, if you just write /sbin/ in front of them, i.e. prbably
/sbin/userdel instead of userdel.

------------------------------------------------------------------------

Last modified: Fri Nov 26 15:50:23 2004
