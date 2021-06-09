# Notes from the Brainstorming session

## Satisfaction

### Thomas

* everything
* great progress linguistically

### Maaren

* cooperation - it's been working very well
* linguistically quite ok, but would like more time

### Tomi
* everything
* cooperation
* weekly meetings
* tasking

### Børre
* cooperation
* atmosphere within the team
* linguistic work doing well (it seems)
* also technical work seems to be on schedule

### Trond
* My coworkers
* The task at hand
* The tools
* The spirit
* The progress ... yes, some of it...

### Sjur
* the team
* telephone/weekly meetings
* documentation
* progress & work

## Improvements

### Thomas
* technical knowledge
* what's happening
* personal improvements: xml, unix

### Maaren
* technical knowledge
* what's happening: in Børre's life, how's Tomi doing, etc.
* personal improvements: more common unix commands

### Tomi
* long term planning: project plan, where we are heading, what's coming up next
* risk analysis and planning would be useful
* process instructions: documentation, what each one is doing and whether we can
  or need to help each other on specific tasks

### Børre
* what are the other ones doing
* how's the project progress vs plans and schedules -
  monthly briefing?
* little bit more focused in the weekly meetings - sometimes
  slide out in technical / linguistic details
* we have failed in getting the contract ready in time - who
  has the responsibility to get it ready?

### Trond
* The linguistic planning
* The shortening of the missing list isn't effective enough (20000)
* Time use: Trond and Sjur have done other things (articles, termdb, ...)
* Cooperation between the project and the Saami lg board and term committees on
  correctness issues. We need their lists, but we also need a more direct
  involvement from their side (after all, our program will decide what's
  correct)
* The overall project planning, schedules, milestones 
* Sometimes our weekly meetings are not focused enough, too much
  coffetableish...

### Sjur
* project plan & details, 
* more time on the project (= term db has been a problem)
* documentation
* more frequent physical meetings?
* contact with the outside world:
    - lang. technology (Oslo, Helsinki, other places)
    - normative instances (lang. council, etc)
    - the public, public relations, the man on the scooter
* get rid of the term db!!!

## Communication
* Make CVS send out check-in mails
* Use iChat more effeciently, also for speech and video conferencing
* The coworkers are urged to read the excellent monthly status reports
* Get divvun.no online, with more "public" info
* We would be helped with an "expert reference group", by suggestion consisting
  of: Pekka Sammallahti, Laila Palojärvi, Mikael Svonni and Per Jernsletten. We
  will ask them.
* Information flow between Divvun and the rest of GIO: Maaren has a one-minute
  briefing each Monday, and also communicates back to the rest of GIO, with
  help from Sjur.

## Tasks, have they been clearly enough defined?
* Børre: Collecting text, part of this work depends on personal contacts, and
  should be carried out by other persons as well as Børre.
* Tomi: the daily tasks in a longer perspective - that is, we need to have the
  long term plan as part of the documentation and planning.

## Responsibility
* Is the responsibility received the "right one", or is it too wide? For Børre,
  perhaps a feeling of it being too wide and not focused enough, e.g. when it
  comes to negotiations, etc.

  
## Feedback
* Good.

## Project goals and progression
* The organisation is up and going after the first half year, as it should be
* We need to get the plans and goals in place now

## Cooperation between the two projects
* Trond is very satisfied - the minuses are outweighted by the plusses
* Børre: there is only *one* project so far

## Improvements - action list
* Documentation
    - review the documentation infrastructure, and the menus from a usability PoV.
    - make documentation writing an activity for all of us.
* internal courses, in linguistics for programmers and in unix for linguists.
    - Linguistics:
        - send people on university courses; or
        - arrange an internal course(?)
    - In between ling and *nix:
        - internal xml course
    - Unix:
        - create a page with the top ten Unix commands
        - easy link to Trond's Unix crash course
* Plans, risks, etc:
    - finalize the project plan with goals and milestones, and publish it
    - do a proper risk analysis of essential parts of the project; course?
* Communication
    - Social contact:
        - half-an-hour small-talk once a week?
        - have group iChat sound conferencing on while working, such that it is
    possible to talk together while working?
        - a default text-chat going on all the time for all of us?
    - set up cvs mailings
    - Use iChat more effeciently, also for speech and video conferencing
    - The coworkers are urged to read the [excellent monthly status
   reports|http://divvun.no/adm/reports/monthoverview.html]
    - Get divvun.no online, with more "public" info
    - We would be helped with an "expert reference group", by suggestion consisting
   of: Pekka Sammallahti, Laila Palojärvi, Mikael Svonni and Per Jernsletten.
   We will ask them.
    - Information flow between Divvun and the rest of GIO: Maaren has a one-minute
   briefing each Monday, and also communicates back to the rest of GIO, with
   help from Sjur
    - better cooperation with the normative bodies

# Lule Saami project plan

The discussion on Lule Saami resulted in a first draft for both task list and
time scedule. Although quicly set up, it is detailed enough to get close to the
final plan.

1. Set up the infrastructure
##	utf-8
##	typos.fst, foreign.fst
##	common Makefile parts?
1. Go through the present transducer
##	Evaluate the present one
##	add inflectional
##	add derivational
##	compounding
1. Get the dictionary
1. Incorporate dictionary in the transducer
1. Get texts, term lists, make corpus
1. Test transducer against texts

... and then we are at the stage we have reached for sme today.

##  Persons allocated to this:
*	Tomi for 1
*	External tester on Sámediggi for some sensible task at some point in the
   future (goal: Involve the Lule Saami linguists in their own parser)
*	Thomas, Trond for 2
*	Børre for 3, 5
*	Trond, Børre, Tomi, Thomas... for 4
*	Thomas, Trond for 6

##  Rough time schedule
* Summer 05: 1, 2.1
* End of 05: Most of 2, 3, 4, 5
* Spring 06: Rest of 4, 5, 6
* End of 06: Overall testing, alpha smj speller and smj disambiguator...

##  Time schedule
* 1	End of june
* 2.1	End of june
* 2.2-2.4 Depends on outcome of 1a, and upon...
* 3	Depends upon Anders and GIO (june-sep). When do we want it?
* 4	Depends upon the match between dictionary and transducer
* 5	Done in parallel with other collection. When the trandsducer is ready
