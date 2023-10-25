# Proper noun lexicon

## What?

* logs? useful, please add!
* dump the lang-xml files to local files when compiling (if newer than yesterday)
* batch editing of a selection? yes, but at best such that one can mark exceptions
* source language to indicate which language a name is typically used with/in
<entry id="Helsingfors" type="secondary">
* (non-)application (speller, disamb, IR, etc) <appl ...>
* link/merge/group two (or more IDs) => button in c-record entry edit (with a search option/multiple choice list)
* during the initial conversion from lexc, remove ^, # and 0 from the IDs? Only the center/concept ID, the ID of the language entries should still contain these characters. This will make it easier to search the concept IDs and use them for merging and lookup purposes, and by keeping these chars in the language IDs, we don't loose any information that would be needed to be retained in another place, thus we only reduce the file size, we won't increase it.
* hide / display ^ during browsing? (not in the entry display)
* future: choose what info to display in the language browser, to keep the number of fields down. This will make it easy to browse also when there is more info for each language, and keep the info amount down in each given session. All the info will always be displayed in the entry display

## How?

* search by language (using the language files, not the common file)
    - done
* when adding a new lang to an existing record, display the existing languages

## Bugs

* make searches work as expected: Bj* returns Am^bjørg
    - done using regular expressions: "^Bj*" (without quotes) will match as expected
* change existing records: not yet possible!

## Conversion

* add default smj (sma, nob, nno?) entries
* exclude '^', '#' and '0' from the center IDs
* add an initially emtpy <log/> element as last child of <entry> (<comment> elements can
  then just be appended to the log element); should be added to both the center / concept
  file, and to the language files.
* add a `last-update` attribute to the root element, to keep a timestamp on the
  document; the timestamp should either be an integer of the form `YYYYMMDDHHMMSS`, or a
  datetime string in standard format; the value should be the time of the conversion

```
======= termcenter.xml =========

<dict last-update="">

Before merge:

<entry id="Bb">
  <sem>ORG</sem>
  <langentry lang="sme" ref="Bb">
</entry>

<entry id="DNA">
  <sem>ORG</sem>
  <langentry lang="sme" ref="DNA">
  <langentry lang="nob" ref="DNA">
</entry>

After merge:

<entry id="Bb">
  <sem>ORG</sem>
  <langentry lang="sme" ref="Bb">
  <langentry lang="sme" ref="DNA">
  <langentry lang="nob" ref="Bb">
  <langentry lang="nob" ref="DNA">
</entry>

<entry id="Helsinki">
  <sem>plc</sem>
  <langentry lang="sme" ref="Helsset">
  <langentry lang="swe" ref="Helsingfors">
  <langentry lang="nob" ref="Helsingfors">
  <langentry lang="fin" ref="Helsinki">
</entry>

======= terms-sme.xml =========

<entry id="Helsset">
  <infl lexc="NIILLAS"/>  <== (today: NIILLAS-plc)
  <senses>
    <sense ref="Helsset"/>
  </senses>
</entry>

<entry id="Helsingfors" type="secondary">
  <appl incl="disamb, IR" excl="speller"/>         (use only one?)
  <infl lexc="BERN"/>
  <senses>
    <sense ref="Helsingfors"/>
  </senses>
</entry>

<entry id="Helsinki" type="secondary">
  <infl lexc="NYSTØ"/>
  <senses>
    <sense ref="Helsinki"/>
  </senses>
</entry>

<entry id="Bb">
  <infl lexc="NYSTØ"/>
  <senses>
    <sense ref="Bb"/>
  </senses>
</entry>

<entry id="DNA">
  <infl lexc="BERN"/>
  <senses>
    <sense ref="DNA"/> => ref="Bb" after merge
  </senses>
</entry>

======= terms-nob.xml =========

<entry id="Helsingfors">
  <infl lexc="NAMN"/>
  <senses>
    <sense ref="Helsingfors"/>
  </senses>
</entry>

<entry id="Bb">
  <infl lexc="NFORK"/>
  <senses>
    <sense ref="Bb"/>
  </senses>
</entry>

<entry id="DNA">
  <infl lexc="NFORK"/>
  <senses>
    <sense ref="DNA"/> => ref="Bb" after merge
  </senses>
</entry>

=========================
```
