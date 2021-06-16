Links
=====

Initially, this is just a collection of links to useful internal and
external documents:

-   An [overview and evaluation](projmantools.html) of software tools to
    support project management
-   A [document describing the whole software production
    process](http://www.dixite.com/pages/pdf/sposs_v1.0.pdf) using OSS
    (Open Source Software) - from
    [Dixite.com](http://www.dixite.com/docs/spposs/)

Development process
===================

The main highlights from the Dixite document is the following process
and related tools:

1.  Planning - [Apache Maven](http://maven.apache.org/)
2.  Requirement Analysis and Specification -
    [ArgoUML](http://argouml.tigris.org/), CVS and DocBook (XML) as well
    as LaTeX for (version control of) documentation
3.  Design and Specification - Dixite uses
    [ArgoUML](http://argouml.tigris.org/), and
    [Xfig](http://www.xfig.org/) (runs under X11) for higher level
    graphing, I suggest we use
    [OmniGraffle](http://www.omnigroup.com/applications/omnigraffle/)
    for graphing purposes.
4.  Implementation and Unit Testing - a plethora of software, depending
    on the tasks at hand.
5.  System Integration and Testing -
    [JUnit](http://www.junit.org/index.htm) and
    [Bugzilla](http://www.bugzilla.org/)
6.  Delivery and Maintenance - [Bugzilla](http://www.bugzilla.org/)

We have so far not had any real development process, only doing bits of
4 and 5 without support from a real plan, no design, no specifications,
and testing only of the inflection of the linguistic models (we have
very recently added the facilities to test two-level rules, but that
isn't put to much use yet).

Software we have
================

We are already using several of the tools listed by Dixite (CVS,
Bugzilla, XML-based documentation). If we set up a development process
similar to the above, with software used specified, we arrive at the
following:

1.  Planning – \[nothing really, that is, MS Word and Excel\] see the
    [list of candidates](projmantools.html) for more info
2.  Requirement Analysis and Specification – Forrest
3.  Design and Specification – Forrest
4.  Implementation and Testing –
5.  System Integration and Testing –
6.  Delivery and Maintenance – Forrest, CVS, Bugzilla

Suggested additions to our tool chest
=====================================

For the missing parts I suggest we look more into the following
packages:

-   [Apache Maven](http://maven.apache.org/) – project management (but
    cf also the list of [commercial project management
    tools](projmantools.html))
    -   Maven is now officially dead - see the home page. The most
        likely candidate now is the commercial, Mac-only tool Merlin
        ([more info](/admin/projmantools.html#Merlin+1.3.6)).
-   [ArgoUML](http://argouml.tigris.org/) – design, specifications and
    use cases.
-   [JUnit](http://www.junit.org/index.htm) derivatives for our purposes
    (= more systematic testing) - if we can't find something suitable,
    we need to look into what we can do ourselves to ensure proper
    regression testing and testing routines in general. The present
    testing system is too random, and doesn't automatize the process of
    checking against earlier bugfixes when new bugs have been fixed.
-   [OmniGraffle](http://www.omnigroup.com/applications/omnigraffle/) —
    we are already using it for small-scale drawing, I suggest we buy
    full licenses for this one
-   OmniOutline — it is included with our computers, and is a good tool
    for developing plans, and all sorts of outline activities more
    advanced than what can be done with the wiki format

Updated software list
=====================

After having investigated several tools and options, the following set
of tools is what we will use for the main phases of our project (editors
of different types, like SubEthaEdit, emacs and XXE, are not listed,
just assumed):

1.  Planning – Merlin, OmniOutline, OmniGraffle, Forrest
2.  Requirement Analysis and Specification – Forrest, Merlin, ArgoUML,
    OmniOG
3.  Design and Specifiation – Forrest, Merlin, ArgoUML, OmniOG
4.  Implementation and Testing – Xerox, home-made testing routines,
    Bugzilla
5.  System Integration and Testing – Bugzilla, software from
    integrators, home-made testing routines
6.  Delivery and Maintenance – Forrest, CVS, Bugzilla

What is still open, is how to test Aspell and similar engines, as well
as the hyphenation. For Aspell and other Unix spellers, a lot of testing
can be automated, and the routines needs to be worked out. All testing
needs to be formalised, and the results should be collected
systematically, preferably automatically, and stored and processed to
monitor the development of the tools.

UML References
==============

UML is news to most of us, so here's a list of references.

-   [UML in
    WikiPedia](http://en.wikipedia.org/wiki/Unified_Modeling_Language)
-   What is a [Use Case](http://en.wikipedia.org/wiki/Use_case)?
-   [Understanding Use Case
    Modelling](http://www.methodsandtools.com/archive/archive.php?id=24)
-   [Precise Use
    Cases](http://www.methodsandtools.com/archive/archive.php?id=8)
-   ArgoUML [User
    Manual](http://argouml.tigris.org/documentation/defaulthtml/manual/)
