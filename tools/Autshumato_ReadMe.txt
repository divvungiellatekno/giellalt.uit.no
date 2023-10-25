-================= Autshumato ITE =================-

Autshumato Integrated Translation Environment (ITE)
Complete translation environment with translation memory, machine translation and glossaries. Powered by OmegaT

Version: 1.1.0
Platform: Windows (tested on XP, Vista, 7), Linux (tested on OpenSuse, Fedora, Ubuntu), Mac (tested on OS X 10.5)
License: GNU GPL 2 (or any later version)
The license is present in the "License.txt" file. The used components and equivalent licenses are listed in the "Components&Licenses.txt" file. 
The licenses for the various components are also available in the "\lib" directory.

All changes made since the Alpha version are indicated in the Change Log.txt file.

-=== To Install ===-
Required:
* JRE 1.6_12 (at least)
* OpenOffice.org 3 (or any later version)

[Windows]
It is recommended to download and use the "Autshumato.ITE.X.X.X.Setup.exe" installer to install the application on Windows.
* Download the Autshumato.ITE.X.X.X.Setup.exe from SourceForge.net.
* Run the installer.
* The installer will automatically install the required prerequisites.
* The program is now installed and ready to be used.

    Alternatively

    * Download OpenOffice.org 3 (or any later version) from http://www.openoffice.org and install.
    * Download the Java Runtime Environment 1.6 update 12 (or any later version) from http://www.java.com and install.
    * Download the Autshumato.ITE.X.X.X.zip archive from SourceForge.net.
    * Extract the archive to the directory of your choice.
    * The program is now ready to be used.



[Linux]
    *  Install the OpenOffice.org and openoffice_org-officebean packages.
    * Install the Sun JRE package (java-1_6_0-sun) and ensure that the default JRE used is the Sun version and not the Open JDK version.
    * Extract the Autshumato.ITE.X.X.X.zip archive to the directory of your choice.
    * Edit the run.sh script inside the newly extracted directory and enter the appropriate values for the UNOPATH and LIBPATH variables.
          o UNOPATH = Path to the OpenOffice.org program directory. (For openSUSE: /usr/lib/ooo3/program)
          o LIBPATH = Path to the officebean library (libofficebean.so). On some platforms this is the same as the UNOPATH. (For openSUSE: /usr/lib/ooo3/basis3.1/program)

    * The program is now ready to be used.


[Mac]
    *  Install OpenOffice.org 3 (or later).
    * Install the Sun JRE 1.6 Update 12 (or later) and ensure that the default JRE used is the Sun version and not the Open JDK version.
    * Extract the Autshumato.ITE.X.X.X.zip to the directory of your choice.
    * The program is now ready to be used.


-=== To Run ===-
[Windows]
Open the directory where you installed/extracted the Autshumato ITE to. Start the application by double-clicking on the launcher file.

[Linux]
Start the application by running the run.sh file in the terminal.
$ bash run.sh 

If the program fails by specifying that the UNO_PATH variable has not been set the UNOPATH variable in the run.sh script is incorrect.
If the program fails by specifying that the officebean is not present in the java.library.path then the LIBPATH variable in the run.sh script
is incorrect.

[Mac]
Start the application by running the Macrun.sh file in the terminal.
$ bash Macrun.sh 

-=== To Build ===-
Required: 
* JDK 1.6
* OpenOffice.org SDK
(If NetBeans is your IDE then you will also require the NetBeans OpenOffice.org plug-in. 
The plug-in supposedly only works for NetBeans 6.5 and lower, but I got it working on NetBeans 6.8 despite warnings 
about the plug-in not being installed correclty. If you use Eclipse or any other IDE please consult the OpenOffice.org 
website for information on how to link the OOo libraries in the IDE.)

- The project was coded using NetBeans, so I would recommend using that to build the project.
- Use your favourite IDE and open the Autshumato.ITE project.
- Resolve any reference problems (The OpenOffice.org and JDK libraries usually need to be resolved)

-=== Known Bugs ===-
- The first start usually takes a little longer.
- If heavy memory processes are running it slows the operation of the program.
- Please report any bugs at http://autshumato.sourceforge.net.

For further information consult the help document contained within the "\Help" directory. Double click the "index.html" file to open the help document.
You can also visit the project website at: http://autshumato.sourceforge.net