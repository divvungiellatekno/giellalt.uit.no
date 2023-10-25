There is a family of open-source speller engines available, namely
[Aspell](http://aspell.net/),
[hunspell](http://packages.debian.org/experimental/text/hunspell/),
[iSpell](http://fmg-www.cs.ucla.edu/fmg-members/geoff/ispell.html) and
[Myspell](http://lingucomponent.openoffice.org/) (at least). They are
inspired by each other, and partly borrowing code from each other.

Because of these relationships, the expressive power in their linguistic
formalism seems to be more or less identical, and other projects
generate speller dictionaries for all three engines from the same source
code, most notably [Debian](http://www.debian.org/). We therefore
document these spellers and our implementation for them under a common
umbrella, loosely tagged **X-spell** (replace X- with your favourite
speller).

Present work
============

Initially we have [worked with Aspell](aspell.html). Documentation and
support will be expanded to cover the other ones as well.

Links
=====

Aspell
------

-   [Project Home Page](http://aspell.net/)
-   [GNU Aspell Home](http://www.gnu.org/software/aspell/)
-   [GNU Aspell Documentation](http://aspell.sourceforge.net/man-html/)
-   [cocoAspell Home](http://www.ict.usc.edu/~leuski/cocoaspell/)
    (Aspell on MacOS X)

hunspell
--------

It seems **hunspell** is our friend wrt open-source spellers: real
compounding, advanced continuation/inflection lexicons (they can be
combined, as opposed to Aspell/MySpell/Ispell), forbidden words, and
several other nice features. It is still a far cry from Xerox and
similar technologies, but it is a big step forward from the Ispell
tradition. Aside from two-level rules to handle complex morphophonology,
the biggest problem is integration with host applications. **Hunspell**
does however supports the most important one: OpenOffice.org. One nice
feature of it is that it can also be used as a morphological analyzer.

The code is partially based on MySpell, and the dictionary and affix
file formats are almost identical to the MySpell formats, with
exceptions for extensions to support compounding, circumflexing, a
larger continuation class set, etc.

-   [Home](http://hunspell.sourceforge.net/)
-   [Debian Home](http://packages.debian.org/experimental/text/hunspell)
-   [FreshPorts](http://www.freshports.org/hungarian/hunspell)
-   [Documentation](http://sourceforge.net/docman/display_doc.php?docid=29374&group_id=143754)

Ispell
------

**Ispell** is the father of all interactive spellers in the Unix world.
**Ispell** might be too old, with restricted or lacking support for
Unicode (UTF-8), and with more restrictions on the number of
continuation lexicons than Aspell/MySpell. It is also targeted at a
different set of applications than MySpell and Aspell, mainly command
line ones. We might thus decide to skip **Ispell** support, and instead
look for new initiatives like hunspell.

-   [Home](http://fmg-www.cs.ucla.edu/fmg-members/geoff/ispell.html)
-   [GNU Ispell Home](http://www.gnu.org/software/ispell/ispell.html)
-   [FSF Directory entry](http://directory.fsf.org/ispell.html)
-   [Dictionaries](http://fmg-www.cs.ucla.edu/fmg-members/geoff/ispell-dictionaries.html)
-   [Emacs Ispell
    interface](http://www.kdstevens.com/~stevens/ispell-page.html)

MySpell
-------

-   [OOo MySpell Home](http://lingucomponent.openoffice.org/)
-   [Debian Package](http://packages.debian.org/testing/source/myspell)
