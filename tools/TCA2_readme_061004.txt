TCA2 can be run either from the jar file
or with a command line from a command/terminal window.

Running from a command/terminal window is useful
if you suspect there are bugs in the program.
Any java runtime error messages will show
in the command/terminal window.
(There might also be messages from the program itself,
usually harmless ones.)

There is a bat file supplied for Windows users.
Running the bat file will normally bring up the Command window.
The bat file is also useful if you need to know the command line.

- - - - - - - - -

Recent changes:

- - - - - - - - -

2006-10-04

(1)

In later versions, when running more than one alignment in a row
(in skip 1-1 or automatic modes), the program shows progress
by continuously updating the boxes containing
aligned elements and unaligned elements.
In the current version this feature has been removed.
Progress is only indicated in the status line bottom left,
as numbers telling how many elements have been aligned so far,
out of the total number of elements.
Not until the program is finished
(e.g, when comming across a non-1-1 alignment in skip 1-1 mode)
is the rest of the window updated.

The change makes the program faster and less memory-hungry.
Before the change the program could easily run out of memory
on long, continuous runs, i.e., when running automatically
with a limit in the order of hundreds or more.

To the program author it looks like memory (heap space)
is not garbage collected well enough.
Garbage collection is normally done automatically in java.

(2)

Even with the change described in (1) the program
can run out of memory. There are some remaining
memory leak issues that need to be investigated.
In the meantime some useful changes
have been made to the program.
Together with advice below the changes will help the user
avoid serious consequences,

The program now constantly monitors available memory
and halts gracefully with a warning.

At that point, fiddling with the interface might trigger
garbage collection. Try for instance the Unalign button
followed by the Align button, or an Up button followed by
the corresponding Down button.

While doing this watch the new memory usage indicator
in the status line bottom right. If the figure drops after
playing around a bit with the buttons, one can restart
the alignment process with the Suggest button.

It is also recommended to start up the program with more memory
than it gets by default.
E.g, the following command line will give the program
128 MB of memory at startup, with a maximum of 512 MB.
(The default maximum might be 64 MB):

  java -Xms128m -Xmx512m -jar alignment.jar

Which values are possible might depend on the size of
the memory of one's computer.

(3)

The test for empty alignable elements, introduced in the
previous version, has been improved, and should now catch
any empty element. (Except the program still stops at
the first occurrence of an empty element.
Further empty elements in the file are not found and reported.)

- - - - - - - - -

2006-09-19 - 2006-09-22 - 2006-09-25

(1)

Later versions of the program have been slow (slower than usual).
A bug caused some calculations to be re-done a lot of times
instead of earlier results being re-used.

These calculations were anchor word/proper names/etc calculations
on 1-2 and 2-1 alignments with badly matching lengths, i.e,
cases the program considers to be hopeless candidates for alignment.
So not only were the calculations done again and again,
they were also unnecessary.

Doing these calculations made the program able to show
how well elements match word-wise, even with badly matching lengths.
Some users doing manual alignment might want that,
so the calculations weren't _completely_ useless.

In the current version these calculations aren't done at all,
and all the "manual" user sees is a message saying
the lengths match very poorly - no details about anchor word match etc.

(2)

In the middle row of boxes the program shows suggested alignments.
The user may manually change the alignments by clicking the elements
shown in the boxes. E.g, if a suggested 1-1 alignment is shown
a click on one of the elements will change the suggestion to
a 1-0 alignment + a 0-1 alignment. After clicking the user will see
the colour of one of the elements has changed.

The program has always had this functionality, but there was always
the danger a user would click and change alignments by accident.
As a security measure the new version of the program has
an "are you sure" message.

(3)

In earlier versions the last line of an alignable element sometimes
would not show. This was because of errors in the way the height
(the number of lines) needed to display the text was calculated.
This error has been corrected.

If the error still occurs, try to click the problematic element.
If that makes the element display correctly what you've seen
is an instance of a new, but less serious problem,
with a component not always refreshing properly.
The program author will try to look into this new problem later.

If the element does not display properly even after being clicked
please report the error to the author. There might be one piece of
final fine-tuning to do to get the last line always to display.

(4)

The program cannot align elements that don't contain any words.
Previous versions would stall when trying to align such elements.
The current version will in most cases issue an error message.

(5)

An error occurring when skipping already aligned elements
has been corrected.

(6)

A blunder in the Dice "phrase" matching introduced in
the previous version of the program has been corrected.

(7)

The current version of the program has a Windows look and feel
because the author doesn't like the default java metal look
and open/save dialogs.

(8)

The current version
- allows the user to save settings to a file from the Settings dialog
- allows the user to load settings from a file from the Settings dialog
- always looks for a file called tca2.cfg in the folder the program is run from,
  and if present loads settings from that file
- can load settings from file by using a -cfg command line option, i.e,

  java -jar alignment.jar -cfg=settingsfilename
  
  or
  
  alignment.jar -cfg=settingsfilename
  
Setting files are (utf-8) text files, and can be prepared
and maintained manually, but it is recommended to do it
from the Settings dialog.

(9)

The current version will display an error message if a text
contains an empty alignable element, e.g, a sentence without any words.
In earlier versions the program would halt and malfunction.

(Note: The test for empty elements might not be properly implemented
to cover all cases.)

(10)

The default values for the weights of the match methods
have been changed - for no scientific reason - to
- anchor words       - 1.0
- anchor phrases     - 1.6
- proper names       - 1.3
- dice words         - 1.3
- dice phrases       - 1.6
- numbers            - 1.3
- scoring characters - 1.3

(11)

Help | Help still doesn't give any help about the program
but now at least reports the program version, making support easier.

- - - - - - - - -

2006-04-18

(1)

The "Clear all data" button now works.
Its purpose is to clear the program of the current texts
making room for a new pair of texts to align.

The button can also be used if a wrong text has been read in.

(2) Logging

Logging has been changed. In the latest versions logging was always on, 
and the same file was re-used for the log, with the old log 
being overwritten each time the program was started anew. 
In this new version logging can be turned on and off at any time 
with the "Start logging"/"Stop logging" button. 
At startup logging is off. 
The first time logging is turned on the user is presented 
with a sensible suggestion for a log file name, 
derived from the names of the input files, 
and she gets a chance to change the suggested name and folder.

(3) Dice "phrase" matching

Dice matching has been extended in an attempt to cover compound words 
that are written as separate words in the other language. 
Earlier the Dice method compared all the words in one text 
with all the words in the other text. 
Now the words in one text are also compared 
with _pairs_ of consequtive words in the other text. 
The comparison of two consequtive words A and B in one text 
with a word C (a possible compound) in the other text, 
is done as two separate comparisons: Each of A and B must match C. 
But while normal one-to-one Dice matching looks at 
the number of matching character pairs in relation to 
the lengths of _both_ the words compared, 
in Dice phrase matching only the length of A or B is considered, 
and not C, since A and B are expected to match a _part_ of C 
and not the _whole_ of C.

As in normal one-to-one Dice matching all words 
must have a certain minimum length (settable from the Settings dialog) 
to be considered at all, so A and B will never match 
when either A or B is shorter than that minimum length.

Note one source of error in the Dice phrase matching method: 
While looking for matching character pairs 
both A and B are compared with the whole of C, 
in some cases yielding false matches. 
A better implementation might try to find the best way of 
dividing up C in substrings X Y with A matching X and B matching Y, or vice versa.

(4) New word-based matching method: number

A new word-based matching method has been added, 
where the program looks for words that are numbers - 
more precisely integers written purely with digits 
(e.g, "1", "2006", but not "3.14", "10,000", "2MB", "two"). 
Negative numbers (e.g, "-2") will also be matched, 
and be considered to be different from their unsigned versions ("2"),
unless "-" is defined as a special character to be stripped from words, 
in which case the program will not "see" the sign 
(e.g, "-2" will be seen as "2").

(5) Weighted match methods

The different kinds of match, e.g, an anchor word match versus a Dice match, 
now have weights that can be set from the Settings dialog. 
The weights should be set with values that reflect 
the confidence one has in each match method. 
E.g, if proper name matches in general are assumed to 
be correct somewhat more often than anchor word matches, 
one could set their weights to e.g 1.3 and 1 respectively.

Earlier versions of the program had no weighting, 
i.e, the weights were fixed at 1.

If several methods agree that two words are related, 
and the methods have different weights, the higher weight wins.

As in earlier versions - after all the weighted methods 
(anchor word, Dice, proper name, number, and special characters) 
have had their say the total match score might be increased (by 1 or 2), 
or decreased (reduced to 1/3), according to how well the sentence lengths match. 
This reward or punishment cannot be weighted. 
Bear that in mind when setting the weights for the weightable methods. 
The weights should probably be sort of centered around the value 1, like,
to be compatible with the length adjustment. :-)

Note that there is a special weight for a Dice phrase match, 
so a Dice phrase match can be set to a different 
(presumably higher) weight than a normal one-to-one Dice match. 
Likewise for an anchor "phrase" match, 
i.e, a match where one or both anchor words is a phrase. 
(Remember - an anchor word list can contain phrases as well as single words.)

(6) Word-based match methods overhauled; better common score calculated

The word-based match methods (anchor word, Dice, proper name, number) 
have been implemented in a more consistent manner. 
Also their results are pooled before a common score is reached, 
while earlier their individual scores simply were 
added together to make the common score.

As earlier both the individual and common scores 
can be viewed in the bottom middle box in the interface, 
along with other match information.

The main idea behind scoring for word-based method are "clusters". 
A cluster is a set of words (or phrases) the method think are related,
along with the relations between the words. 
E.g, for the anchor word method, one or more anchor word entries 
might more or less agree that two words in one text 
are related to three words in the other text. 
Each such cluster gets a score, and the scores of the individual clusters 
are added together to make the total score for the current method.

Different clusters can have different scores. 
Again consider the anchor word method.

First each cluster gets a basic score, equal to one anchor word match weight. 
If the cluster contains not only single anchor _words_ 
but one or more anchor _phrases_, the basic score is instead set to 
one anchor _phrase_ match weight (assuming that phrases have 
higher weight than single words).

Next and last there is some extra score for cluster _size_. 
The cluster in the example is two by three words in size. 
The larger dimension (three) is disregarded, yielding a size of two. 
A size of two makes the cluster one word larger than a minimum cluster. 
That extra word increases the score, not by a full weight 
but a certain percentage of the weight. 
The percentage is settable from the Settings dialog.

The common score is derived by looking at _all_ the word-based 
methods simultaneously. Then some of the clusters might merge, 
and the common score will be lower than the sum of the individual scores. 
To take a simple example: Several methods might agree that 
one particular word in one text is related to 
one particular word in the other text, 
and the two words not related to any other words. 
Each method regards the the two words as a one-by-one cluster. 
When looking at all the methods at once the clusters 
merge into one single one-by-one cluster. 
The methods might disagree about the weight assigned to the relation, 
but the method with the highest weight wins.

In earlier versions the common score for the word-based methods 
was calculated by adding the scores of the individual methods. 
E.g, the Dice and proper name methods would agree that 
"Bergen" and "Bergen" are the same word, assigning a score of 1 + 1 = 2. 
When comparing "Oslo" and "Oslo", however, the score would be only 1, 
because "Oslo" fell below the minimum length required by the Dice method 
(unless set to a lower value by the user).

(7) The order of anchor word matches listed

As earlier match information is shown in the bottom middle box 
in the interface, but the order of anchor word matches is changed. 
In earlier versions the matches were listed with one line 
per anchor word entry, in the same order as the entries 
occurred in the anchor word file. Now matches are listed in _cluster_ order, 
which sometimes breaks up the old order, 
namely when several anchor word entries agree on the same words. 
The clusters as such are not shown, however (but perhaps they should).

- - - - - - - - -

2006-03-31

(1) 'Newline' format - ancestor information

Some users might want more than just alignable elements
in their 'newline' format output files,
i.e, some information about the elements' "ancestry",
e.g, which paragraphs and divisions
the aligned sentences belong to.

The output from early versions of the program
contained alignable elements and nothing more.

With some later versions of the program
the output also contained information about all the elements'
ancestor elements, with the start tags
for all ancestors prepended to the element.
(This change to the 'newline' output format
might not have been communicated to all users, though.)

The current version of the program
offers the user various options:
- No ancestor information (default)
- All ancestor information
- Deny certain elements and attributes
- Allow only certain elements and attributes.

(2) New output format - "external"

A new output format - "external" - is introduced.
The output consist of _one_ file in utf-8 xml format,
containing no text and alignable elements,
only references or pointers into the input files.
Each alignment is represented as a <link> element
with a certain attribute listing
the id's of the aligned elements.

Some details about this format are not settled yet.

The new format's output file is saved
after the 'corresp' format files
and before the 'newline' format files.

(3) Output file names and extensions

When the user saves the alignment result
the program suggests names and extensions
for the output files.
In earlier versions of the program
the user could change settings that influenced
the suggested names and extensions.
This was never properly implemented,
e.g, resulting in 'newline' format files
being suggested with an xml extension.
In the current program version the suggestions
are more or less hardcoded, with a more suitable
'txt' extension for the 'newline' files.

(4) Bugs in manual alignment operations corrected

In the interface there is a "less" button
(= button with 'arrow down' symbol) for each text.
With these buttons the user can manually drop elements
from the suggested alignment(s),
returning the elements to the 'unaligned' area
at the bottom of the interface.

The programming for these buttons had two flaws
that have been corrected - flaws that might cause
internal confusion and loss of elements.
The first flaw could show itself when the button
was pressed one time too many,
i.e, after there were no more elements to drop.
The second one might occur when the sole element
of a 1-0 or 0-1 alignment was dropped.

- - - - - - - - -

2006-03-24

(1)

The program has been extended with an "Automatic" mode,
and the limit (see below) applies to the new "Automatic" mode
as well as the "Skip 1-1 mode".

Here is a full explanation of the program's modes:
+-----------------+-------------------------------------------+
|  Mode           | What happens when the user                |
|                 | presses the Suggest button                |
+-----------------+-------------------------------------------+
| "One at a time" | The program suggests one alignment        |
|                 | and waits for user feedback               |
+-----------------+-------------------------------------------+
| "Skip 1-1"      | The program does alignments automatically |
|                 | and doesn't wait for user feedback        |
|                 | until a non-1-1 alignment is reached,     |
|                 | or until the limit (see below) is reached |
+-----------------+-------------------------------------------+
| "Automatic"     | The program does alignments automatically |
|                 | and doesn't stop for user feedback        |
|                 | unless the limit (see below) is reached   |
+-----------------+-------------------------------------------+
The user can set a maximum limit for the number of automatic alignments
the program should perform before waiting for user feedback.
The limit is relevant for the "Skip 1-1" and "Automatic" modes.

(2)

While the program runs automatically ("Skip 1-1" and "Automatic" modes)
the user can see the aligned elements disappear from the "unaligned"
boxes at the bottom of the interface
and appear in the "aligned" boxes at the top.

(3)

In the interface alignable elements show in grey or coloured cells.
The text of the elements might wrap, and the cells should have heights
accommodating an integer number of lines.
A bug that sometimes caused cells to come out with a fractional height
has been corrected.

(Regarding the cells' height there is a flaw that has _not_ been corrected.
The calculation of the cells' height might miss,
causing cells to have one line too many, or in rare circumstances,
one line too few, hiding the final part of the element's text.)

(4)

There is a new "Clear all data" button,
but its functionality has not been implemented.
Its purpose is to clear the program of the current texts
making room for a new pair of texts to align.

- - - - - - - - -

2006-02-23

The program accepts input files with any encoding, e.g, UTF-8,
and produces output files with the same encoding as the input files.
The encoding must of course be specified in the XML header of the input files.

The anchor file must be UTF-8. Other encodings will not work.
(The anchor file is still a text file, not an XML file, and contains no heading,
so there is no easy and safe way for the program to decide which encoding is used.)

- - - - - - - - -

2006-02-24

The program produces a log containing information about each alignment,
consisting of the aligned elements, and information about how well the elements match,
the latter taken from the middle bottom box of the interface.

For each element in the 'newline' format output files
a chain of parent element start tags are shown as well.

- - - - - - - - -

2006-02-28

An error in the settings dialog corrected.
The error concerned the parameters
"Relevant elements" and "Relevant ancestors of relevant elements"
(top boxes of the settings dialog).
If the user deleted tags the error caused the tags to reappear.

