Agenda
======

1.  Directory structure (TBS)
2.  Name lexicon (TBMS)
3.  Numerals (TMS)
4.  Three-part compounds. (TMS(T))
5.  Project planning + Árran (TS)

Directory structure (TBS)
=========================

Tuesday afternoon

Conversion from original to internal format. Manually add meta-info on
writer, mainlang, etc. into the xsl file. Manually (temporarily) edit
the int file, adding language info in multilingual docs. Do a xmldiff on
this, add the result to the xsl file.

Problem with xmldiff: The document structure of the int file could
change, thus rendering the generated references in the xmldiff part of
the xsl file invalid. Typically xmldiffs contain XPath expressions such
as:

    /doc/section[2]/p[3]

If a new version of antiword or our DocBook2GT generates a different
structure, the p \[n\] type references will identify the wrong node, or
nothing at all.

Solution to this problem: Version control of the intermediate xml file.
You have two reasons for this: 1) manual addition of language
information, 2) new generations of the internal xml file. After this is
done, apply the xsl file and generate the final document.

We then started to look for free software to do automatic language
recognition, and found some alternatives. We picked (TextCat\|), a
perl-based tool licensed under a GPL license. It is now installed in
gt/scripts/, and rudimentary user doc can be found in our
[intranet](/ling/langrec.html).

What is left to do now, is to integrate language recognition with the
corpus processing, adding language information automatically to at least
the document (if not existing and correct), but preferably to all
elements containing text, and the language of the text is different from
the main language of the doc.

Name lexicon (TBMS)
===================

Semantic classification
-----------------------

The name lexicon meeting turned into a very productive meeting, ending
in a new classification for names, as well as a draft XML document. The
new classification is:

-   mal
-   fem
-   sur
-   org
-   plc
-   obj

Each name can have more than one of these classes.

XML format
----------

We made an xml fragment illustrating the suggested document format. The
fragment is found at:

    gt/common/src/proper-nouns.xml

and contains the following:

    <?xml version='1.1'  encoding="UTF-8"?>
    <!DOCTYPE propndict PUBLIC "-//DIVVUN//DTD Proper Noun Dictionary V1.0//EN"
    "http://www.divvun.no/dtd/prop-noun-dict-v10.dtd">
    <propndict>
        <entry id="Guovdageaidnu">
            <sem>
              plc sur
            </sem>
            <form lg="sme">
              <cnt>DEATNU</cnt>
            </form>
            <form lg="smj">
              <lm>Guovdageajdno</lm>
            </form>
            <form lg="sma">
              <lm>Goevtegeajno</lm>
            </form>
            <form lg="fin">
              <lm>Koutokeino</lm>
            </form>
            <form lg="eng nno nob swe"/>
              <lm>Kautokeino</lm>
            </form>
        </entry>
        <entry id="India">
            <sem>
              fem plc
            </sem>
            <form lg="sme">
              <cnt>ACCRA</cnt>
            </form>
            <form lg="smj">
              <cnt>AKKRA</cnt>
            </form>
            <form lg="sma">
              <cnt>IE_PNOUN</cnt>
            </form>
            <form lg="fin">
              <lm>Intia</lm>
              <cnt>14</cnt>
              <sem>plc</sem>
            </form>
            <form lg="fin">
              <lm>India</lm>
              <cnt>14</cnt>
              <sem>fem</sem>
            </form>
            <form lg="eng nno nob swe"/>
        </entry>
    </propndict>

Note:

The entries above are not necessarily correct, their purpose is to
illustrate how to handle some different cases.

The following should be noted regarding the above XML document, and it's
interpretation:

-   the **id** attribute contains the name itself in the language of the
    entity named if known, otherwise the most common form (to reduce
    space)
-   the **&lt;sem&gt;** element contains one or more of the
    classification strings listed above
-   the **&lt;form&gt;** element contains language-specific information
    about a name:
    -   **&lt;lm&gt;** - lemma, only needed if different from the **id**
        of the entry
    -   **&lt;stem&gt;** - gives the stem if different from
        **&lt;lm&gt;**
    -   **&lt;cont&gt;** - the continuation lexicon. The string here is
        concatenated with the strings given in **&lt;sem&gt;** (one at a
        time) separated by a hyphen, forming the set of possible
        continuation lexicons. If *no* &lt;cont&gt; is given, the name
        is not included in the compiled lexicon for that language.
    -   **&lt;sem&gt;** - contains override semantic classification -
        see the India example above, Finnish entries, for a use case
    -   if the same information is shared among several languages, the
        **@lg** can (or preferably should) contain multiple entries
        separated by a space
    -   the **&lt;form&gt;** element can be empty if all information can
        be deduced from the **@id** of the entry (such as when there's
        no known continuation class, and the form is the same as in
        the @id)

The languages we considered were:

-   sme
-   smj sma fin swe nob nno eng

Others might and could easily be added later.

The next steps
--------------

The next steps to be taken are:

1.  classify each name according to the most obvious semantic class -
    but only one
2.  write a DTD or schema (preferably, to enforce limitations on the
    content of &lt;sem&gt;)
3.  write scripts to transform the above format to LEXC format,
    correction strings for spellers, etc.
4.  evaluate the best editing tools for this document (considering that
    50 000 names in up to 10 languages must be handled properly); we
    might need to consider splitting up the file in smaller fragments
5.  consider synchronisation issues in case the same material is also
    stored and updated at risten.no
6.  convert existing names to this format
7.  test the conversion
8.  add additional semantic classes, where such are needed
9.  add new names and language forms

Numerals (TMS)
==============

Not covered.

Three-part compounds. (TMS(Tomi))
=================================

Not covered.

Thursday - Project planning + Árran (TS)
========================================

We discussed project plans and planning a lot, as well as the possible
tools to use. We tried or looked at a few, and settled on Merlin. It has
nice OS X integration, but also its drawbacks, the main being that it
really is a single-user application. This makes it hard to share and
access project files and info among several users, which limits the
usefulness of the application quite a lot. Nevertheless, the pros
outweight the cons, at least compared to the alternatives.

There's an [online Handbook](http://www.projectwizards.net/help) for
Merlin, as well as a [pdf
version](http://www.projectwizards.net/download/Merlin-Handbook.pdf.zip).

Real project plans are (finally!) forthcoming:-)

We did not discuss Árran.
