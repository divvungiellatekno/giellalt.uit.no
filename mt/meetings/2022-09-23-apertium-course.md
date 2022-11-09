23.09.2022

- Intro-teaching
- week outline
- dates and time plan
- dates 10./11.12. travelling, 12.-16.12. course, 17. travelling
- budget: 
    -- Bloomington - IND shuttle $30
    -- Taxi Tromsø 600
    -- flights (IND (Indianapolis) and returning to MSP (Minneapolis)) 8000–12000 NOK (cheapest on skyscammer)
    -- buss 270 (7-dagers billett)  
    -- hotel - Smarthotel Tromsø + breakfast - NOK 7443  (6 nights)
    -- food 660x6 = 3960
    -- totals: ~20000-24000 NOK
    
CASE AGREEMENT:
    
Sullii 7 oahppi 10 oahppis čađahit joatkkaskuvlla oahpu viđa jagis.
approximately.adv 7 student.gen.sg 10 student.loc.sg pass.inf high.school.gen.sg education.acc.sg five.gen.sg year.loc.sg

 
This is what we get:
 
Ungefähr 7 Schüler in 10 Schüler bestehen der weiterführende Schule  die Ausbildung  fünf in dem Jahr.
approximately.adv 7.num student.n.sg.nom in.pr 10.num student.n.sg.nom ?.vblex.inf the.det.def.sg.gen furtherleading.adj school.n the.det education.n five. in.pr the.det year.n.sg.nom



NP.Nom okta guolli - num.Nom.sg n.Nom.sg
NP.Acc ovtta guoli - num.Acc.sg n.Acc.sg
NP.Gen ovtta guoli - num.Gen.sg. n.Gen.sg
NP.ill ovtta guollái - num.Gen.sg n.Ill.sg
NP.Loc ovtta guolis - num.Gen.sg n.Loc.sg
NP.Com ovttain guliin - num.Com.sg n.Com.sg
NP.Ess oktan guollin - num.Ess(.sp) n.Ess(.sp)



NP.Nom guokte guoli - num.Nom.sg n.Gen.sg
NP.Acc guokte guoli - num.Acc.sg n.Acc.sg
NP.Gen guovtti guoli - num.Gen.sg. n.Gen.sg
NP.ill guovtti guollái - num.Gen.sg n.Ill.sg
NP.Loc guovtti guolis - num.Gen.sg n.Loc.sg
NP.Com guvttiin guliin - num.Com.sg n.Com.sg
NP.Ess guoktin guollin - Ess Ess

5 types of rules:
    1. tag order rule (colon)
    2. reduction rule (arrow)
    3. rules for defining attributes  (equal sign)
    4. tag rewrite rule (bigger than)
    5. 

gender = m f nt ;
number = sg du pl ; (rules or lists) # 3 
number > number : du pl ; # 4
case = nom gen dat acc loc ess ill com;  # 3
NP: _.number.case; (underscore is pos tag in a slightly looser sense) # 1
n: _.gender.number.case;
num: _;
(case > case: loc acc, ill dat ;  # 4)

one_lem = "1" "okta" ;

! default<NP><pl><nom>{ 7 student 10 student } (comment !)

NP -> num n num n.*.loc (put * if tags are not adjacent to each other)
      [$number=(if (1.lem/sl incl one_lem) sg else pl),
       $case=(if ((1.lem/sl not incl one_lem) and (1.case = nom)) nom
              else 2.case)] (2.case - case of word two)
      { 1 _ %2 _ von@pr _ 3 _ 4[case=dat,number=(if (3.lem/sl incl one_lem) sg else pl)] } ; (put the first word first, put a space there, put the second word second, % copy all relevant tags, @ means we are creating a word explicitly, sl source language)
      
      ! von@pr => ^von<pr>$
      ! %2 = 2[case=$case,number=$number]
      
⏚ daniel@computer-name-here:~/apertium $ rtx-comp sd.rtx sd.bin
⏚ daniel@computer-name-here:~/apertium $ echo '^7<num><arab><sg><nom><@SUBJ→>/7<num><arab><sg><nom><@SUBJ→>$ ^oahppi<n><nomag><sem_hum><sg><gen><@Num←>/Schüler<n><m><nomag><sem_hum><sg><gen><@Num←>$ ^10<num><arab><sg><loc><attr><@→N>/10<num><arab><sg><loc><attr><@→N>$ ^oahppi<n><nomag><sem_hum><sg><loc><@Num←>/Schüler<n><m><nomag><sem_hum><sg><loc><@Num←>$' | rtx-proc sd.bin
^7<num>$ ^Schüler<n><m><pl><nom>$ ^von<pr>$ ^10<num>$ ^Schüler<n><m><pl><dat>$

⏚ daniel@computer-name-here:~/apertium … ta/apertium-deu master(+10/-0)+ ± echo '^7<num>$ ^Schüler<n><m><pl><nom>$ ^von<pr>$ ^10<num>$ ^Schüler<n><m><pl><dat>$' | lt-proc -g deu.autogen.bin 
7 Schüler von 10 Schülern


  # 2 ($ case tag from noun phrase is copied from the numeral)

"okta"

This is what we want:
 
Ungefähr 7 Schüler von 10 Schülern bestehen die Ausbildung der weiterführenden Schule in fünf Jahren.

approx.adv 7.num student.n.sg.nom von.pr 10.num student.n.sg.dat pass.vblex.inf the.det.def.sg.no education.n. (the.det..gen or of.pr?) furtherleading.adj school.n in.pr five.num the.det year.n.dat

We are struggling with adapting the articles and attributive adjectives to the cases, finding the correct prepositions and translate cases to prepositional phrases or cases.
 
 
Second one:
 
Sámedikki bargit leat doaimma deaŧaleamos resurssat.
 
this is what we get:
das Saamisches Parlament die Arbeitnehmer es geben wichtigste Ressourcen der Verwendung
 
this is what we want:
Die Arbeitnehmer des samischen Parlamentes sind die wichtigsten Ressourcen der Verwendung.



