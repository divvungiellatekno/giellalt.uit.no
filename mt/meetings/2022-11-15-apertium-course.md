# 15.11.2022

https://giellalt.github.io/mt/smenob/TransferProblems.html

For all of examples, the sentence in CG or stream format with some indication of which phrase is important to the question would be helpful.

- how to write a rule from scratch
  - can do
- how to inflect parts of multiword expressions:
    -- joatkkaskuvlla = weiterführende Schule (case inflection)
    SOURCE: Sullii 7 oahppi 10 oahppis čađahit joatkkaskuvlla oahpu viđa jagis dan rájes go vuohččan álget joatkkaskuvlii, 6 proseanta leat ain oahpus, ja 23 proseanta eai oaččo duođaštusa/fágareivve dahje heitet gaskan (heaitin) viđa jagi áigodagas.
    TARGET: Ungefähr 7 Schüler von 10 Schülern bestehen eine fünfjährige Ausbildung der weiterführenden Schule seit sie zuerst in einer weiterführende Schule anfangen, 6 Prozent  sind  noch in der Ausbildung, und 23 Prozent bekommen keine Bekräftigung/den Meisterbrief oder hören mittendrin ( aufhören ) in der fünf Jahres Periode auf.
    - is this a pair of phrases where one part bears the inflection and the rest are fixed? this source language to target language
      - I mean, what is the structure of the MWE in each language?
- how to split verbs and put them in the right position:
    -- heitet = aufhören (hören mittendrin (aufhören) in der fünf Jahres Periode auf)
    - should be doable (might be messy, depending on how German is set up)

      - eg:


        echo aufhören | lt-proc deu.automorf.bin

    ^aufhören/aufhören<vblex><sep><inf>/aufhören<vblex><sep><ger><nom>/aufhören<vblex><sep><ger><dat>/aufhören<vblex><sep><ger><acc>/aufhören<vblex><sep><fs><pri><p1><pl>/aufhören<vblex><sep><fs><pri><p3><pl>/aufhören<vblex><sep><fs><prs><p1><pl>/aufhören<vblex><sep><fs><prs><p3><pl>$


     echo hören auf | lt-proc deu.automorf.bin

    ^hören auf/aufhören<vblex><sep><fm><pri><p1><pl>/aufhören<vblex><sep><fm><pri><p3><pl>/aufhören<vblex><sep><fm><prs><p1><pl>/aufhören<vblex><sep><fm><prs><p3><pl>/hören<vblex><sep><fm><pri><p1><pl># auf/hören<vblex><sep><fm><pri><p3><pl># auf/hören<vblex><sep><fm><prs><p1><pl># auf/hören<vblex><sep><fm><prs><p3><pl># auf$


     echo hören xyz auf | lt-proc deu.automorf.bin

    ^hören/hören<vblex><inf>/hören<vblex><ger><nom>/hören<vblex><ger><dat>/hören<vblex><ger><acc>/hören<vblex><pri><p1><pl>/hören<vblex><pri><p3><pl>/hören<vblex><prs><p1><pl>/hören<vblex><prs><p3><pl>$ ^xyz/*xyz$ ^auf/auf<pr><dat>/auf<pr><acc>$

- how to do lexical selection if a word has more than one meaning
-- for example "lea" - 1. es  ist vs. 2. es gibt (Place adverb OR Sem/Plc Noun in locative)
SOURCE: Váikkuhit dan ahte mánáidgárddiin gos leat sámi mánát, lea kvalitatiivvalaš sámi sisdoallu
TARGET: Beeinflussen dass in den Kindergärten wo saamische Kinder sind, qualitativer saamischer Inhalt ist
    - in cases that require syntax to disambiguate or just in general? - both
-- noun: ohcan 1. Suchen (searching) 2. Bewerbung (application) - genitive modifier semantic category can be the decisive factor, or the verb (e.g. write an application)
SOURCE: Giellaprošeavttaid ohcamat leat lassánan daid maŋemus jagiid.
TARGET: Die Bewerbungen für Sprachprojekte sind gestiegen die letzten Jahre.
-- noun: oktavuohta 1. Zusammenhang 2. Verbindung 3. Beziehung
-- dán oktavuohta.lokative > in diesem Zusammenhang, (Máttásápmelaččain leat lagaš oktavuođat riikkarájáid rastá.) human.lokative + copula > Beziehung, (Sámediggedieđáhusa sámi dáidaga ja kultuvrra birra barggu oktavuođas lea evttohuvvon 4 vuoruhansuorggi, gos okta dáin lea kulturealáhusaid árvoháhkama ja ovdáneami birra.) work.genitive > Zusammenhang
SOURCE:  Dán oktavuođas sáhttá leat áigeguovdilin lágidit gallestallamiid, skuvlamátkkiid ja leairaskuvlla. Nu besset oahppit deaivvadit eará sámegielagiiguin, ja oahppat veaháš árbevirolaš sámi ealáhusaid birra.
TARGET: In diesem Zusammenhang kann es aktuell sein Besuche, Schulausflüge und Schullandheime zu organisieren. So können die Schüler andere Saamischsprachige treffen, und ein bißchen über traditionelle Lebensunterhalte der Saamen lernen.
-- nuppi either translated as 1. anderer (other) 2. zweiter (second)
SOURCE: Nuppi oasi dahket guokte eŋgelasgillii almmuhuvvon artihkkala ja okta sámegillii almmuhuvvon artihkkala.
TARGET: Der andere Teil tun zwei Englisch  veröffentlicht eines Artikels und eine Saamisch  veröffentlicht einen Artikel.
-- (I'll look for examples) jos = 1. ob (if) 2. wenn (when) 3. falls (if)
    verbs that are doubting choose 1. ob (ask, doubt, not know)
    expressing that something happens at the same time 2. wenn
SOURCE: Jos Sámediggi galgá juksat mihttomeari ahte das leat gelbbolaš ja movttidahttojuvvon bargit, lea deaŧalaš sáhttit fállat bargiide gilvalanvejolaš bálká- ja bargoeavttuid.
OUTPUT: Ob #das Saamisches Parlament soll erreichen das Ziel dass es hat kompetente und  motiviert #werden  die Arbeitnehmer, #sein wichtig  können  #anbieten  in die Arbeitnehmern *gilvalanvejolaš das Einkommen und die Arbeit#-Bedingungen.
TARGET: Wenn das saamische Parlament das Ziel erreichen soll dass es kompetente und  motivierte Arbeitnehmer gibt, ist es wichtig den Arbeitnehmern ein wettbewerbsfähiges Einkommen und Arbeitsbedingungen bieten zu können.
- how to deal with words that have different parts of speech in the languages
    - can do, though definitely easier with a concrete example
- how to deal with different auxiliaries in German: (there is a group with haben and another one with "sein" in present perfect)

    SOURCE: Sullii 2 oahppi 3 oahppis geat leat heaitán/eai álgán joatkkaskuvlla ohppui, leat bargagoahtán dađistaga, dan čájehit maiddái eará guorahallamat.

    Ungefähr 2 Schüler von 3 Schülern die aufgehört haben /keine Ausbildung der weiterführenden Schule anfangen haben, sind  haben allmächlich angefangen zu arbeiten, das zeigen  auch andere Untersuchungen.

    -- leat heaitán = aufgehört haben

    Giellaprošeavttaid ohcamat leat lassánan daid maŋemus jagiid.

    Die Bewerbungen für Sprachprojekte sind die letzten Jahre gestiegen.

    -- leat lassánan = sind gestiegen

    - what determines the selection here? - I guess it needs to be defined for each German verb

- noun phrases from premodifier to postmodifier constructions (genitive.noun noun > noun preposition noun)

    SOURCE: Giellaprošeavttaid ohcamat leat lassánan daid maŋemus jagiid.

    Die Bewerbungen für Sprachprojekte sind die letzten Jahre gestiegen.

    -- Giellaprošeavttaid ohcamat = Die Bewerbungen für Sprachprojekte

    - can do

- reordering
-- NP internal (genitive.noun nominative.noun verb genitive.noun adjective nominative.noun > nominative.noun vgenitive.noun verb adjective nominative.noun genitive.noun)
SOURCE: Sámedikki bargit leat doaimma deaŧaleamos resurssat.
#das Saamisches Parlament die Arbeitnehmer es #geben wichtigste Ressourcen der Verwendung.
TARGET: Die Arbeitnehmer des saamischen Parlamentes sind die wichtigsten Ressourcen der Verwendung.

    - can do

-- VP (moving verb to the end in certain clauses): it is important to Aux.Inf Main.Inf Adverbial complex object > it is important  Adverbial complex object Main.Inf Aux.Inf
SOURCE: Jos Sámediggi galgá juksat mihttomeari ahte das leat gelbbolaš ja movttidahttojuvvon bargit, lea deaŧalaš sáhttit fállat bargiide gilvalanvejolaš bálká- ja bargoeavttuid.
OUTPUT: Ob #das Saamisches Parlament soll erreichen das Ziel dass es hat kompetente und  motiviert #werden  die Arbeitnehmer, #sein wichtig  können  #anbieten  in die Arbeitnehmern *gilvalanvejolaš das Einkommen und die Arbeit#-Bedingungen.
TARGET: Wenn das saamische Parlament das Ziel erreichen soll dass es kompetente und  motivierte Arbeitnehmer gibt, ist es wichtig den Arbeitnehmern ein wettbewerbsfähiges Einkommen und Arbeitsbedingungen bieten zu können.


- expletive subject constructions where one language has the subject and the other one doesn't (and where it is not based on the verb)
lea buore dálki odne - es ist schönes Wetter heute

    - is the proper subject based on previous sentences (anaphora resolution) or something else?

- relative sentences (word order, ...)

    SOUCE: Sámediggi ii sáhte juksat iežas politihkalaš mihttomeriid, jos das eai leat movttidahttojuvvon bargit geain lea alla gelbbolašvuohta.

    TARGET: Das saamische Parlament kann die eigenen politischen Ziele nicht erreichen, wenn es keine motivierten Arbeitnehmer gibt die eine hohe Kompetenz haben.

    - as in relative clauses?

- definiteness vs. non-definiteness of noun phrases

    - so, your source and target disagree about whether the NP should be definite?

- translating derivations in a systematic way:
    "-goahtit" start to do something
    passives - Der/Pass > werden + verb.translation
SOURCE: Dat lea buorre mearka, ja danne álggahuvvo sierra ovdánahttindoarjjaortnet giellaguovddážiid várás.
TARGET: Es ist ein gutes Zeichen, und deshalb werden eigene Entwicklungstützrichtlinien für Sprachzentren initiiert.
    causatives
    - maybe - Apertium thus far has generally treated such things as purely lexical, but you could probably manage something lsx
- adding commata according to the rules of the target language (for example before "dass" in German)
- translation of grammatical case to preposition and lexical selection for that depending on different factors a) semantic category b) valency c) ...
Language + illative most often preposition "auf" (Sámegillii>auf ..) unless there are particular verbs like "translate into" > "in"  (eŋgelasgillii>ins ..)
SOURCE: Sámegillii almmuhuvvon artihkal lea dán čoakkáldahkii maiddái jorgaluvvon eŋgelasgillii.
TARGET: Der auf Saamisch veröffentlichten Artikel ist für diese  Sammlung auch ins Englische übersetzt.
- translating nominalizations as subclauses
-- noun object nominalization.illative > noun object "zu" infinitive (beroštumi sámegiela nannemii > Interesse das Saamische zu bewahren)
SOURCE: Sámediggi vásiha stuora beroštumi sámegiela nannemii ja ovdánahttimii.
TARGET: Das saamische Parlament erfährt ein großes Interesse das Saamische zu bewahren und zu entwickeln.
nannemii    nannet+V+TV+Der/NomAct+N+Sg+Ill    0,000000
nannemii    nannen+N+Sg+Ill    0,000000

Previous list of issues from sme-nob (might have to be reviewed):
    https://giellalt.github.io/mt/smenob/TransferProblems.html
    https://giellalt.github.io/mt/smenob/SolvedTransferProblems.html



