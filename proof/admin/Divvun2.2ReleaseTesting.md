# Test procedure

This test report document is all about technical stability and functionality. The
testing should for each combination of Windows, MacOS and Office versions cover the
following:

1. uninstall old Divvun installations if you have any
1. install the version to test (links should have been given in an e-mai)
1. make noters about all issues, problems and unexpected behaviour
1. start MS Office (preferably all applications in the suite, but the absolute
  minimum is to start Word), and paste in the following text: 'nuvviDspeller'.
  Set the language one at a time to North Sámi, Lule Saami and South Saami, and
  check that the second suggestion gives respectively:
    1. Davvisámi, version 2.2, 20111108-49612
    1. Julevsáme, version 2.2, 20111107-49546
    1. Åarjelsaemien, version 1.2, 20111108-49611
1. go to [http://avvir.no/], copy a random news article, paste it into Word, and set the
  document language to North Sámi. Change the document layout to use at least 3
  columns. Turn on automatic hyphenation. The text should now be automatically
  hyphenated.
  In addition Thomas should check that the hyphenation seems reaonsable and correct, and also redo this same test with a Lule sami text.  Sissel and Marit should do the same with a South Saami text. Everybody should do the first, technical part to check that hyphenation is working for the setup you're testing.
1. uninstall the tested version of Divvun 2.2

If the test run above leads to a working proofing tool for all three languages, then the test
has PASSed. If not, it has FAILed. If there is no test reports so far, the cell
in the table is marked with —. Non-supported combinations are marked with *N/A*.

Any problems should be reported to [feedback@divvun.no](mailto:feedback@divvun.no)

# Test results - Windows

## Speller
|   Office version | Windows XP | Windows Vista | Windows 7 32bit | Windows 7 64bit
| --- | --- | --- | --- | --- 
|   Office 2000    |      —      |      —         |      —           |      —     
|   Word   2002    |    PASS     |      —         |      —           |     FAIL
|   Office 2003    |    PASS     |      —         |      —           |      —     
|   Office 2007    |      —      |      —         |      —           |     PASS (?)
|   Office 2010    |    PASS     |      —         |     PASS         |     PASS/FAIL

## Hyphenator
|   Office version | Windows XP | Windows Vista | Windows 7 32bit | Windows 7 64bit
| --- | --- | --- | --- | --- 
|   Office 2000    |      —      |      —         |      —           |      —     
|   Word   2002    |    PASS     |      —         |      —           |     FAIL
|   Office 2003    |    PASS     |      —         |      —           |      —     
|   Office 2007    |      —      |      —         |      —           |      —     
|   Office 2010    |      —      |      —         |     FAIL         |      —     

## Installation & uninstallation
|   Windows version | Installer | Uninstaller | Unsupervised install
| --- | --- | --- | --- 
|   Windows XP      |    PASS     |     PASS    |     PASS
|   Windows Vista   |      —      |      —      |      —
|   Windows 7 32b   |    PASS     |     FAIL    |     PASS
|   Windows 7 64b   |    PASS     |      —      |     PASS

# Test results - Mac

There should be no discrepancies between speller and hyphenator functionality on
the Mac. The table below covers both tools. If just one of them fails, the whole
test fails.

|   Office version | MacOS 10.3 | MacOS 10.4 | MacOS 10.5 | MacOS 10.6 | MacOS 10.7
| --- | --- | --- | --- | --- | --- 
|   Office 2004    |      —      |      —      |      —      |    PASS     |     N/A
|   Office 2008    |     N/A     |      —      |      —      |    PASS     |     PASS
|   Office 2011    |     N/A     |     N/A     |      —      |    PASS     |     PASS

# Known issues

## Divvun 2.2

Divvun 2.2 was tested and found to work on a number of Windows systems before the release. Nevertheless there are several reports of non-working installations and configurations.

* Office 2010 Home & Student edition - Divvun does not work, at least not on a Win7 64 bit system
* On 64 bit Windows 7, if installed by an admin, the tools do not work for regular user accounts
    - in some cases it has been possible to work around this issue by empowering the user to become local admin during the installation, and letting the user install from his/her own user account. Then the tools will work, also after the user has been depowered to a regular user. But there are also cases where this workaround has *not* helped

We are investigating these issues, and will release an update as soon as possible.
