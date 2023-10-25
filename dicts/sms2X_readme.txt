Incoming raw files go into ~inc/

This file is mostly for communicating current todos and questions; proper documentation has moved to https://giellalt.uit.no/dicts/SkoltSaami2X.html


=====
LEXICOGRAPHY
=====
…to be completed and moved into the proper documentation
<e meta="xxx"> = for meta see below
-><lg>
--><l pos="xxx"> for pos see above
--><mg excluded="oahpa;OTHER_APP/>
---><sources><book name="xxx" lesson="xxx"/> = for oahpa
---><sem
---><xxx>

=====
Preliminary conventions: Skolt Sámi apostrophes
=====
Conventions used preliminary for the present file by M.Rießler (like in the xfst). Note that KOTUS standardized U+00B4 ACUTE ACCENT as the Skolt Sámi palatalization (http://scripta.kotus.fi/www/verkkojulkaisut/julk6/Omin_sanoin.pdf). However, Skolt Sámi writers in Sevettijärvi seem not to follow this standard today, but use the modifier letter Prime.

ˊ = 02CA MODIFIER LETTER ACUTE ACCENT ("pehmennysmerkki", suprasegmental palatalization affecting the whole "palatalization foot")
!! e.g. 'to eat' poorrâd+V+Ind+Prs+Pl3: påˊrre
spellrelax needed (with typograhically similar letters)

ˈ = 02C8 MODIFIER LETTER VERTICAL LINE ("vahvanasteenmerkki", extra long geminate, used by P.Sammallahti in dictionaries)
!! e.g. 'to trust' veârrad+V+Ind+Prs+Pl3: veârˈra
spellrelax needed (with or without the letter)

ʼ = 02BC MODIFIER LETTER APOSTROPHE ("erotusmerkki", a syllable break, marking also a new "palatalization foot") 
!! e.g. 'to be heard' kollʼjed 
spellrelax needed (with or without the letter)

!! example of all three at once:
!! 'hot, burning' puõˊlli+A+Sg+loc: puõˊlˈlʼjest
!! puõˊ[02B9]lˈ[02C8]lʼ[02BC]jest

=====
Preliminary conventions: other Skolt Sámi orthography
=====
ẹ = (second, short segment of a diphthong) is used like in the 1991 dictionary, but for looking up in the dictionary/Oahpa! we need spellrelax (ẹ ~ e) 

<l> = always the first variant used by the 1991 dictionary, i.e. the "main Suonikylä form"

Other phonological variants (of unclear dialectal origin) are listed in a separate file with a link to the main lemma 

=====
Preliminary conventions: media
=====
Audiofiles live at the KSDP-archive. Links to audiofiles go under <lg> (because they are representations of the lemma, but not of the meaning). The future aim is to compile dictionaries with audio representations of the single lemmata.

=====
Preliminary conventions: other orthography
=====
* English default is "American"
* Russian uses ё, but for looking up in the dictionary/Oahpa! we need spellrelax (ё ~ е) 

=====
meta
=====
Here is the list of the attribute values for the attribute 'meta'
on the e-element in the xml files:

01 - this is a list of sms entries with multiple translations collected by Kimberly Mäkäräinen (http://www.uta.fi/~km56049/same/skolt/koltansaame.html).

02 - 

03 - word list from teaching materials under development by the Project "Skolt Sámi Culture across Borders" (http://www.skoltSámi.com) building on an already existing Finnish version, which is extended with Russian [Eino Koponen] and Norwegian [Michael Rießler] translations; each lesson of this materials gets its own attribute ("phon" is from the phonological explanations and exercises, "dict" is from the word list)

04 - entries added manually by Michael Rießler; these are mostly from field- or other notes and will serve to test the most appropriate structure for the "common" dictionary database; also entries with other meta-values are converted as soon as the original information is considerably extended

05 - a 226-word list with Sámi cognates, etymologies and English/Finnish translations imported from the BEDLAN project (http://kielievoluutio.uta.fi) with which Michael Rießler collaborates. The list was originally created by Jyri Lehtinen. It includes the 207 meanings from the different Swadesh lists along with further 19 meanings from the so-called Leipzig-Jakarta list (see http://wold.livingsources.org/). Obs! Note that the sme/sju equivalents are often inprecise and have to be checked carefully because the original wordlist is about etymological relations rather than translations.

06 - word list from teaching materials by Satu Moshnikoff et al. 1998: "Pââibužškooul sääˊmǩiõll: lookkâmǩeˊrjj"

07 - list of plants with Russian, Finnish, Latin translation, provided by Natalia Vaskova (SAKK course 2012/13)

08 - sms wordlist of almost 5000 entries with multiple translations and links to audio files stored at TLA (http://tla.mpi.nl), the wordlist was compiled by Espen Sommer Eide (http://www.languagememory.org) in collaboration with KSDP

09 - Added words from the Saami parliament webpage, top 20 or so from the lemmata not in the dictionary already. (svn revision: 80649, author: trond)

10 - a few lemmas imported from contlex

===========================
