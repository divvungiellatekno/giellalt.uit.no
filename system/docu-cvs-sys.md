CVS administration
==================

Note that this info is obsolete, we now use svn. See documentation
elsewhere.

-   Where is the repository? Type ` locate repository` to see repository
    location.

As part of the installation routine, every new user is assigned to the
group "cvs". Add the new user to the group cvs.

Run the command

cvs -d /usr/local/cvs/repository/ co gt

(This might work for the user, without root privileges, I am not sure).
What does work is the following:

Be root. Go to the home directory of the new user. Write "cvs get gt".

Cf. Eero's explanation:

    [root@gitek cvsrep]# groups sjur
    sjur : sjur
    Aha. Sjur ei ole ryhm�ss� lingsoft, jolla on oikeudet gt-hakemistoon.

    [root@gitek cvsrep]# groups kristin
    kristin : kristin
    [root@gitek cvsrep]# /usr/sbin/usermod -G lingsoft kristin
    [root@gitek cvsrep]# groups kristin
    kristin : kristin lingsoft

    Nyt pit�isi toimia:

    [root@gitek cvsrep]# su -l sjur
    [sjur@gitek sjur]$ cvs get gt
    cvs checkout: Updating gt
    cvs checkout: Updating gt/doc
    <......>

    Jep, toimii. Nyt Kristinin pit�isi saada tiedostot ulos komentamalla
    cvs get gt




    This is a command that perhaps is irrelevant?


    [root@gitek cvsrep]# ls -lart gt
    drwxrwsr-x   10 trond    lingsoft     4096 feb 15 17:42 gt

------------------------------------------------------------------------

Eero Taipale

Last modified: Fri Feb 21 09:59:36 GMT 2003
