8.3.2021

meattáhusmerken/GramDivvun
Duommá, Linda ja Ritva 

3.3.2021
13:05-

meattáhusmerken/GramDivvun
Duommá, Linda ja Ritva 

11:05-12:00

* geahččat yaml teasttaid ja mo dat doibmet ja čilget dan Ritvai 
    ** rádji juste njuolggadusii lea 75% precision
* Duommá muitala iežas ohcanstrategijjaid birra 
    ** korpas smártta ohcan
    ** dál leat moaddelot duhát cealkaga
* GramDivvun váttisvuođat (Wordas)

* ođđa feailatyhppat:
    - rahkadit yaml fiilla: new-error-types.notfixed.yaml
    - yaml formahta:
    - "Árktalaš ráđi jođiheapmi lea dán vuoru dan dáfus hárvenaš {}¥{leamaš}, ahte ságadoalliriikka báiki lea guhtta jagi maŋŋálaga davviriikkaid hálddus. " #SYN MISSING: Ii fuomáš/máhte lasihit váldovearbba "leamaš": lea leamaš 
    - lang-sme/tools/grammarcheckers/tests/
.yaml, notfixed.yaml

ps-011_arktalas_parlamentarihkkariid_coakkamis.correct.txt
--------------------------------

    1. Dánmárkku olgoáššiidministtar Lene Espersen muitalii čoakkáma álggus Dánmárkku árktalaš ráđi ságadoalli áigodaga ulbmiliin.
* NB!! FALSE POSITIVE: GramDivvun evttoha divodusaid sátnái "olgoáššiidministtar" vaikko DÁKKO II LEAT MEATTÁHUS!! (Dat lea čállon riekta!) --- disambigueren

    1. Lene Espersen muitalii čoakkáma álggus Dánmárkku árktalaš ráđi ságadoalli áigodaga ulbmiliin. 
* CAP: Ii fuomáš divvut "Árktalaš ráđi": stuorra ovdabukstáva

    1. Árktalaš ráđi jođiheapmi lea dán vuoru dan dáfus hárvenaš, ahte ságadoalliriikka báiki lea guhtta jagi maŋŋálaga davviriikkaid hálddus. 
* SYN MISSING: Ii fuomáš/máhte lasihit váldovearbba "leamaš": lea leamaš 
--- Linda: dása lea váttis čállit njuolggadusa?

    1. Ságadoallivuohta sirdása Norggas Dánmárkui, mas dat sirdása Ruŧŧii jagi geahčen.
* NB!! FALSE POSITIVE: GramDivvun evttoha divodusaid sátnái "Ságadoallivuohta" vaikko DÁKKO II LEAT MEATTÁHUS!! (Dat lea čállon riekta!) #fixed - lasihuvvon

    1. Dánmárku sávvá gávdnat iežas jođihanáigodaga áigge čovdosa ođđa bissovaš dárkojeddjiid váldimii árktalaš ráđđái. 
* CAP: Ii fuomáš divvut "Árktalaš ráđi": stuorra ovdabukstáva

    1. Eatnamat dego Kiinná, Lulli-Korea ja Japana ja organisašuvnnat dego Eurohpá uniovdna leat viggame árktalaš ráđi bissovaš dárkojeaddjin. 
* Ii fuomáš divvut "Eurohpá Uniovdna", "Árktalaš ráđi": stuorra ovdabukstáva #fixed - lasihuvvon

    1. Válden ovdan dan, ahte mot árktalaš ráđđái sáhttá váldit dárkojeddjiid, mat eai gudnejahte olmmošvuoigatvuođaid ja álgoálbmogiid vuoigatvuođaid ja mot árktalaš ráđi váldegaskavuođaid, politihka ja olmmošvuoigatvuohtalinnjái geavalii dákkár ođđa dárkojeddjiid mielde. 
* CAP: Ii fuomáš divvut "Árktalaš ráđđái", "árktalaš ráđi": stuorra ovdabukstáva
* KASUS: Ii fuomáš divvut "vuoigatvuođaid": vuoigatvuođaide - valeansa
* KASUS: Ii fuomáš divvut "politihka": politihkkii - valeansa
- bija fal yaml fiillii

    1. Evttohin, ahte ođđa dárkojeaddjit eai galggale váldojuvvot mielde muđuid go dakkár organisašuvnnat, main lea gaskavuohta árktalaš guvlui dego EU ja Unesco. 
* CAP: Ii fuomáš divvut propernoun/ACR "UNESCO": stuorra bustávat #fixed

    1. Dánmárkku olgoáššiidministtar dajai dása, ahte sii dollet geažos áigge ovdan olmmošriektegažaldagaid ja čujuhii maid Norgga olgoáššiidministtar Størei.
* KASUS: Ii fuomáš divvut "olgoáššiidministtar": olgoáššiidministtarii
* NB!! Evttoha boasttu divodusaid: olgogáššiidministtar, olgoáššuidministtar, jnv.   #fixed - lasihuvvon

    1. Ođđa lahtut galggale váldojuvvot danin, vai ságastallan árktalaš guovlluin ii sirdásivčče eará forumiidda muhto bisolii árktalaš ráđi kontevsttas. 
* CAP: Ii fuomáš divvut "Árktalaš ráđi": stuorra ovdabukstáva

nps-009_soadis_dacca_calmmis_ja_muorra_iezamet_calmmis.correct.txt
---------------

    1. Jus lea okta maid mii sápmelaččat leat máilmmi čeahpimussan, de lea vuoigatvuođaid gáibidit. 
* REL-C/KASUS: Ii fuomáš divvut "maid": mas - valeansa

    1. Beaivvalaččat oidnojit min polihkkarat tv:s hoahkame álgoálbmotrivttiid, ILO 169 ja ON deklarašuvnnaid birra.
* Gávdná, muhto ii máhte divvut "á": Beaivválaččat fixed
* SUOPMAN: Evttoha dušše: "politihkkarat" (v1) vaikko mun háliidivččen čállit "politihkkárat" (v2) iežan suopmana mielde!! fixed
* GOALLOSSÁTNI. Ii fuomáš divvut "ON-deklarašuvnnaid": goallossátni 

    1. Lávejit nu máilmmi fiidnat orrome diet doahpagat.
* INF: Ii fuomáš divvut "orrome": orrut

    1. Gaskkariikkalaččat ja solidaralaččat. 
* Gávdná, muhto ii máhte divvut "á": solidáralaččat fixed

    1. Olmmoš dego govahalla ahte mii sápmelaččat doarrut ovttas buot eará máilmmi vealahuvvon olbmuiguin, báhadahkkiid vuoigatmeahttunvuođaid vuostá.
* Ii fuomáš divvut "á": govahallá fixed

    1. Muhto duohtavuođas eat beroš eará das mii iežamet náhpečoali birra dáhpáhuvvá. 
* MISSING CS: Ii fuomáš divvut/lasihit "go": eará go

    1. Ahte ruovttogilis ain galgá sámegiella gullot, ja ahte lagamus jávrris galgat beassat bivdit. 
* GOALLOSSÁTNI: Ii fuomáš divvut "u": ruovttugilis  #bidjan errorth

    1. Aŋkke ii gullo balljo mihkkege lullisámegiela seailluheami birra gosttege.
* Gávdná, muhto ii máhte divvut "á": bálljo fixed

    1. Jus seamma lei dáhpáhuvvat davvisámegielagiid ektui, vuortnun ahte sámepolitihkkarat ledje lágidit nealgudanstreaikka Kárášjoga márkanbáikkis. 
* Ii fuomáš divvut "á": sámepolitihkkárat. #"sámepolitihkkarat" lea njuolga, iige merkejuvvo sjat

    1. Dat golmmas galget gokčat sámi beroštumiid mat fátmmastit Sáltoduoddaris gitta Svahke Sijittii Hedmarkkus. 
* NB!! Evttoha boasttu divodusaid! Ii máhte evttohit SMA-báikenama "Sijtii". #bidjan erroth
* NB!! FALSE POSITIVE: Gávdná ("gokčat"), muhto ii máhte divvut, vaikko DÁKKO II LEAT MEATTÁHUS!! (Dat lea čállon riekta!) #fixed

    1. Dien gaskka lea 70 miilla, ja gokča badjel beali Sámeguovllu.
* Ii fuomáš divvut "á": gokčá #fixed
* NB!! GramDivvun evttoha divvut: "Sámeguovllu" => "Sámiguovllu", vaikko dat ii leat mielde # "Sámiguovllu" lea norm Error Mark-up:s. Goabbá lea riekta? ==> Muhtun sánit leat lekiskaliserejuvvon -i-), default lea almmatge -e-. 

Goallossánit: 
nuoraidskuvlaoahppit 
vs. Deanu nuoraidskuvlla oahppit 

*doalvvušin 

dolvvošin: diftoŋa njuolgá

    1. Jus Norgga Stuoradikkis {livččii seamma vuoigatmeahttunlaččat juohkit áirasiid go Sámedikkis, de árvidan ahte Finnmárkkus livččii dušše okta áirras mii beasalii dušše juohke nuppi vahkku diggái searvat. 
* vuoigatmeahttumit. #bidjan errorth
* Evttoha boasttodivodusaid: ... (máŋga!)
* KOND2: Ii fuomáš/máhte divvut: "...lei seamma vuoigatmeahttumit juohkit..."

    1. Muhto vaikko soaita váttis jahkit, de lea sámejoavku mii lea ain rašit dilis.
* Gávdná, muhto ii máhte divvut "á": soaitá

    1. Muhto vaikko soaita váttis jáhkkit, de lea sámejoavku mii lea ain rašit dilis. Dárjilsámegiella lea máilmmi gávccadin eanemus áitojuvvon giella. 
* Gávdná, muhto ii máhte divvut "á": soaitá #fixed

    1. Jus mii sápmelaččat livččiimet beroštit vuoigatmeahttunvuođain Sámis, de livččiimet bidjat buot iežamet návccaid dien guvlui. 
* KOND2: Ii fuomáš/máhte divvut: "...leimmet beroštit..." ja "...leimmet bidjat..." #diet leat normhámit
Ritva: sihkku dáid correct-fiillas

    1. Leimmet sáddet olles giellačeahppeveaga dohko, mat livčče stensiillaid ja eará oahpponeavvuid ráhkadit bivastatgálluid.
* Ii fuomáš divvut "i": giellačeahppiveaga #bijan errorth
* KOND2: Ii fuomáš/máhte divvut: "...ledje stensiillaid ja eará oahpponeavvuid ráhkadit..." =norm

    1. Sámi tv-ođđasat ges livčče sin barggu birra muitalit beaivvalaččat, ja mii earát livččiimet dárjjilsápmelaččaid dili digaštallat gievkkanbeavdegáttiin miehta sámi.
* KOND2: Ii fuomáš/máhte divvut: "...ledje sin barggu birra muitalit..." = norm
* Ii fuomáš divvut "á": beaivválaččat #fixed
* KOND2: Ii fuomáš/máhte divvut: "...leimmet dárjilsápmelaččaid dili digaštallat..." #norm

    1. Biilalihkosvuohta ruovttogilis, gos moattis lápmašuvvet, lea miha dehaleabbo go nealgekatastrofa Afriikas gos duhahat duššet. 
* Biilalihkohisvuohta #bidjan errotrh
* NB!! Evttoha boasttu divodusaid: Biilalihkkosvuohta, Fiilalihkkosvuohta, Tiilalihkkosvuohta, Diilalihkkosvuohta, Miilalihkkosvuohta
= Mearkkaša ahte ii máhte lashihit: -his (lih-ko-his-vuoh-ta)
* GOALLOSSÁTNI: Ii fuomáš divvut "u": ruovttugilis #bidjan errorth
* Gávdná, muhto ii máhte divvut "á": duháhat #fixed

    1. Danin lea davvisápmelažžii deháleabbo ahte ruovttosuohkan jorgala buot áššebáhpiriid sámegielas dárogillii, vaikko ii oktage rievtti mielde loga daid, go ahte rašes sámegielsuopmanat gádjojuvvojit jávkamis. 
* GOALLOSSÁTNI:Ii fuomáš divvut "u": ruovttusuohkan #bidjan errorth

    1. Soaita leat lunddolaš, iige gánnahivččii) eddot. 
* Gávdná, muhto ii máhte divvut "á": Soaitá.  #fixed

    1. Muhto jus nu, de fertešii maid dohkkehit ahte dáččat geat orrot guhkkin eret Sámis meannudit sápmelaččaid seamma vuogi mielde, go mii ieža meannudit eará sápmelaččaid.
* SYN MISSING: Ii fuomáš lasihit sáni, mii váilu: "Muhto jus leaš nu,"
* MORFOSYN/ KASUS: Ii fuomáš divvut boasttokásusa: meannudit + kom "sápmelaččaiguin" ja "sápmelaččaiguin"
= Mearkkaša ahte akk geavahuvvo kom sajis.
Ritva lasiha 

    1. Vai leago nu ahte mii oaidnit soađđasa dáčča čalmmis, muhto eat oainne muora iežamet čalmmis
* Gávdná, muhto ii máhte divvut "á": soaddása. #fixed

GOALLOSSÁNIT: 
Manne čállo "e": "sámegielas" ja "sámerádios", muhto divvu "i": "sámiguovllus" (divvu "sámeguovllus"). 
Leago njuolggádus dasa goas goas galgá "e" ja goas "i"? 

nps-007_oddaaigasas_boaresolbmot.correct.txt
------------

    1. Álo livččii juoga maid galggašii dahkat ja hoidet, ja álo lea juoga mii báhca dagatkeahtta. 
* Ii fuomáš divvut "á": báhcá #fixed

    1. Muhto hárve lea asttu, ja áigegárživuohta deadda.  #fixed --> deaddá
* Ii fuomáš divvut "á": deaddá. Dasa lassin čájeha áibbas eará cealkaga (gč. screenshot) 

    1. Sis leat rievttit mat rihkkojuvvojit, ja dáidá dušše diehtemeahttunvuohta mii dahka ahte gielda ii gártta lágalaš bárttiide.   #fixed --> dahká
* Ii fuomáš divvut "á": dahká. Dasa lassin čájeha áibbas eará cealkaga (gč. screenshot) = den første setningen i avsnittet. 

    1. Go Ánde Somby, Ole Henrik Magga, Ragnhild Nystad ja Trond Biti ollejit boarrasiid siidii, de bohtet diehttelasat gozihit ahte lágat ja olmmošvuoigatvuođat čuvvojuvvojit bienastat bitnii. 
* Gávdná, muhto ii máhte divvut "á": (gen.pl) boarrásiid  #fixed

    1. Ja jus eai devdojuvvo, de bohtet dakkár rigeara dahkat ahte sii geat dalle soitet njunnožit leat, bohtet vuorjjahuvvot dassažii go leat duhtaduvvon. 
* njunnožit => njunnožat  #njunnožat lea boastut ---> njunnošat/njunnohat. #bijan errorth
* NB!! Evttoha boasttu divodusaid: njunnežit, njunnošit

    1. Ja jus eai devdojuvvo, de bohtet dakkár rigeara dahkat ahte sii geat dalle soitet njunnožit leat, bohtet vuorjjahuvvot dassažii go leat duhtaduvvon. 
* Ii fuomáš divvut "á": dassážii.  #fixed

    1. Sin ii sáhte coggat orohagaide gos biegga bossu seinniid čađa, dehe sáddet buohcceviesuide gos gártet feaskariin orrut dehe eai beasá sámástit. 
* Ii máhte divvut "á": feaskáriin  #fixed

* "Njuike" dasto ruovttoluotta juhkosa vuosttaš cealkagii, dego doppe livččii meattáhus, evttotkeahttá makkárge divodusa. 

    1. Jus su bijalii feaskarii orrut go boarrasiid siidii ollešii, iige beasalii sámi kultuvrra dikšut.
* Ii máhte divvut "á": feaskárii #fixed
* Dát seamma cealkka iđistii vel golbmii GramDivvumis makkárge meattáhus divodusaiguin. Dat lea hui ártet geavaheaddji mielas. 
(* Easka dán golmma maŋŋá, de evttoha divvot čuovvovačča: boarrasiid => boarrásiid)
* KOND: Ii fuomáš divvut konditionála: neg + conneg = -le; (iige) beasale
- Ritva lasiha 

    1. Boađalii go son dan dohkkehit.
* Ii fuomáš divvut "á": Boađálii #fixed

    1. Trond Biti boahtá ILO konvenšuvnna nummár169 doallat gieđas, ja čeargut suohkanstivrrain ahte buot álgoálbmogiin lea riekti doalahit iežaset árbevieruid
* GOALLOSSÁTNI: Ii fuomáš divvut "ILO-konvenšuvnna": goallossátni 
* Gávdná "nummár169", muhto ii máhte divvut dan guovtti sátnin. 

    1. Jago eambbo smiehtan, de in jáhke Biti oba dohkkehivččiige njeallječiegat lanjasge orrut, muhto gáibidivččii ahte suohkan ásahivččii jorba lanjaid sápmealaččaide mat heivejit álgoálbmot jurddašeapmái. 
* Gávdná "Jago", muhto ii máhte divvut dan guovtti sátnin. bidjan errorth
* Ii fuomáš divvut CS: "..de in jáhke ahte Biti.."
* Ii fuomáš divvut "njealječiegat": guovddáškonsonánta #errorth bidjan
* Ii fuomáš divvut "álgoálbmoga": gen attr   ---> álgoálbmotjurddašeapmái.  bidjan goallossáni

tools/grammarcheckers/errordata/ahte-not-fs.txt

    1. Son bearráigeahčča ahte giellaláhka čuvvojuvvo, ja ahte bargiin lea čielga sámegiella.
* Ii máhte divvut "á": bearráigeahččá #fixed

    1. Dastto boahta čielgasit gáibidit ahte buot bargu galga lágiduvvot árbevirolaš máhtu mielde.
* Ii fuomáš divvut "Dasto": guovddáškonsonánta. #Dastto lea norm

    1. Buot biebmoráhkadeapmi ferte mánu rievdama čuovvut, ja plánaid ferte heivehit luonddumearkkaide ja almanahkkii.
* almmenáhkkái #bidjan errorth
* Evttoha boasttu divodusaid: albmanahkkái, alvanahkkái, allanahkkái
* NB!! Go deaddilin "ignore", de fáhkka iđistedje eambbo evttohusat (?!)

    1. Eará mii maid boahtá dagahit stuorat hástalusaid boahttevaš boaresolbmuid ektui, lea jus hovkkiduvvojit. 
* Ii fuomáš divvut "á": stuorát  #real-word-error

    1. Lea oainnat nu ahte hovkkiiduvvon olbmot sáhttet boarrasiid siiddas bijádit, ohcat dološ duvdagiid.
* Gávdná "boarrasiid", muhto ii máhte divvut "á": boarrásiid (gen.pl) #fixed
* Ii fuomáš divvut: "duovdagiid" #real-word-error

    1. Soai daidiba olgoriikkii dollet jus gávdnaba vuogas liibba. 
* Gávdná "daidiba", muhto ii máhte divvut: "á" #fixed

    1. Soai eaba boađe váillahit meahcceduvdagiid, muhto stuoragávpogiid ja dehalaš čoahkkimiid. 
* Ii fuomáš divvut diftoŋŋa: meahcceduovdagiid #bidjan errorth

    1. Sii geat dalle barget boarrasiid siiddas fertejit ráhkkanit, amas eai ribat diekkariid čalmmis. 
* Gávdná "boarrasiid", muhto ii máhte divvut "á": boarrásiid (gen.pl) EDIT! "  #fixed
Maŋŋá boahtte cealkaga (Lea nu ahte dáčča..), de Gram divvun "njuike ruovttoluotta" dán cealkagii, ja divvu dán. 
* Gávdná "diekkariid", muhto ii máhte divvut "á" #fixed

    1. Lea nu ahte dáčča dávjá hoahka boarrasiidbáru birra. 
* Ii fuomáš divvut "á": hoahká  #bidjan errorth
* Gávdná "boarrasiidbáru", muhto ii máhte divvut "á"  #fixed

    1. Dan sii gal leat ánssašan iige gánnat dan biehkut.
* Gávdná "ánssašan", muhto ii máhte divvut "á" #fixed
* Gávdná "gánnat", muhto ii máhte dan divvut.  #fixed

nps-008_biehkuma_vahat.correct.txt
-----------------------------------------

    1. Olusiin, eandalii dáppe lulde, lea dat govva ahte sápmelaš lea riehpu, gii stuoraservodaga vealaheami dihte ii nákce váldit ovddasvástádusa iežas dillái. 
* Ii fuomáš divvut: "dilis". "dillái" fixed

    1. Dávjá go ieža juoga ládje meaddit, de dadjat ahte ii leat min sivva go nuo ja ná manna.
* Gávdná, muhto ii máhte divvut "manná" (ii máhte evttohit divodusa).  bidjan errorth
* Dasa lassin GramDivvun orru čujuheamin dasa ahte meattáhus lea dan cealkagis, mii álgá "Olusiin...", nammamassii ovddit cealkagis. Dat ii leat áddehahtti geavaheaddjái. Manne ii sáhte baicce čujuhit njuolgga dan cealkagii gos meattáhus lea? 
Duommá: Sjur diehtá dán sullasaš meattáhusa birra

    1. Ja jus goitge soaita leat min sivva, de gávdnojit álo juogalagan dološ sivvá mainna sáhtte čilget ahte manne manái nu go manái.
* Gávdná, muhto ii máhte divvut "soaitá", (ii máhte evttohit divodusa).  fixed bidjan "sivvá" errorth
* Dasa lassin GramDivvun orru čujuheamin dasa ahte meattáhus lea dan cealkagis, mii álgá "Olusiin...", nammamassii ovddit cealkagis. Dat ii leat áddehahtti geavaheaddjái. Manne ii sáhte baicce čujuhit njuolgga dan cealkagii gos meattáhus lea? 
* Ii fuomáš divvut: gávdnojit => gávdno 
- Kommentára: Kongrueansameattáhus.. dákkár ii leat mielde vel, dat leat váldon eret.
Ráhkadit yaml-fiilla? Ohcat dákkár meattáhusaid ja lasihit daid dohko. 
syn-number-congruence-subj-verb

    1. Oaffar ferte nuppis bivdit veahki jus háliideaš dili nuppástuhttit, nugo mii sápmelaččat álo leat šaddan dáččas jearrat lobi ja gáibidit rivttiid, eatge leat ieža sáhttan mearridit iežamet lágáid. 
* Gávdná "sáhttan", muhto ii máhte divvut dan. fixed
* NB!! FALSE POSITIVE: Evttoha "šaddá" vaikko cealkagis lea jo rivttes vearbála: leat šaddan.  fixed

    1. Gieskkat gullen NSR-jođiheaddji Aili Keskitalo dolkan neaktimis oaffarrollas, ja geavaheames oaffara gulahallanvugiid – biehkut ja váidalit. 
* Gávdná "Gieskkat", muhto ii máhte divvut dan.   bidjan errorth

    1. Dien čuoččuhussii ii liiko Aili Keskitalo, guhte lohká ahte sápmelaš han álo gárta biehkut ja váidalit. 
* Ii fuomáš divvut: gárta => gártá  real-word-error > gárta+N+Sg+Nom = map

    1. Dán áigasaš nuorain leat buorit birgejumit ja oahput, ja leat ovttadássasaččat juohkelagan arenain. 
* Gávdná "áigasaš", muhto ii máhte divvut dan: "á".  fixed
* Gávdná "ovttadássasaččat", muhto ii máhte divvut dan: "á".  fixed

    1. Danin liikojin jámas go soapmásat dál leat árvališgoahtan ahte livččii áigi heaittihit ortnega mii dahka sámi nuoraide álkibun beassat doavtteohppui. 
* Gávdná "árvališgoahtan", muhto ii máhte divvut dan: "á". fixed
* Gávdná "dahka", muhto ii máhte divvut dan: "á". fixed

    1. Jus buohccan, de siđan doaktara guhte máhttá dálkkodit ja máhtta vástidit dávddaid birra – leačča dál sápmelaš dehe pakistanalaš.
* Gávdná "buohccan", muhto ii máhte divvut dan: "á". fixed
* Gávdná "máhtta", muhto ii máhte divvut dan: "á". fixed
* Ii fuomáš divvut: doaktara => doaktára  fixed

    1. Muhto Aili Keskitalo cealkamuš vuoseha goitge ahte eat vuos riekta dieđet moht galgat oaffarrollas beassat earranassii.
* Gávdná "cealkamuš", muhto ii máhte divvut dan: "á". fixed
* Gávdná "earranassii", muhto ii máhte divvut dan: "á". fixed

    1. Oaffara gulahallanvuohki lea oainnat biehkut, ja dađi eambbo mii biehkut dađi váddaseappo lea beassat eret eará rollii. 
* CS: Mađi ... dađi: Ii fuomáš divvut vuosttaš "dađi", mii galgá leat: mađi. --- biijan min other-errors fillii
* 1. Gávdná "váddaseappo", muhto ii máhte divvut dan: "á". fixed
* 2. Ii fuomáš divvut dássemolsašumi (nom.sg): váddáseabbo

"<váddaseappo>"
        "váttis" Ex/A Err/Orth Sem/Dummytag Der/Comp A <BE-Ill-Ani> <TH-Inf> Err/Orth v1 Sg Acc Err/Spellrelax <W:0.0> SUBSTITUTE:5115 SUBSTITUTE:5162 @<OBJ MAP:23770:IfNoTransV> &typo ADD:8895:Err/Orth-any
typo
        "váttis" Ex/A Sem/Dummytag Der/Comp A <BE-Ill-Ani> <TH-Inf> v1 Sg Acc <W:0.0> SUBSTITUTE:5115 SUBSTITUTE:5162 @<OBJ MAP:23770:IfNoTransV> &typo &SUGGEST ADD:8895:Err/Orth-any COPY:8904:Err/Orth-any
váttis+Ex/A+Der/Comp+A+v1+Sg+Acc        váddáseappo
        "váttis" Ex/A Err/Orth Sem/Dummytag Der/Comp A <BE-Ill-Ani> <TH-Inf> Err/Orth v1 Sg Gen Err/Spellrelax <W:0.0> SUBSTITUTE:5115 SUBSTITUTE:5162 @ADVL> MAP:23180:r520 &typo ADD:8895:Err/Orth-any
typo
        "váttis" Ex/A Sem/Dummytag Der/Comp A <BE-Ill-Ani> <TH-Inf> v1 Sg Gen <W:0.0> SUBSTITUTE:5115 SUBSTITUTE:5162 @ADVL> MAP:23180:r520 &typo &SUGGEST ADD:8895:Err/Orth-any COPY:8904:Err/Orth-any
váttis+Ex/A+Der/Comp+A+v1+Sg+Gen        váddáseappo
        "váttis" Ex/A Sem/Dummytag Der/Comp A <BE-Ill-Ani> <TH-Inf> v1 Sg Acc Err/Spellrelax <W:0.0> SUBSTITUTE:5115 SUBSTITUTE:5162 @<OBJ MAP:23770:IfNoTransV> &typo ADD:8895:Err/Orth-any
typo
        "váttis" Ex/A Sem/Dummytag Der/Comp A <BE-Ill-Ani> <TH-Inf> v1 Sg Gen Err/Spellrelax <W:0.0> SUBSTITUTE:5115 SUBSTITUTE:5162 @ADVL> MAP:23180:r520 &typo ADD:8895:Err/Orth-any
typo

    1. Sii geat háliidit njunnošii sámi servodaga stivret, fertejit diekkar lagan árvvuid ovdanbuktit. 
* GOALLOSSÁTNI: Gávdná "diekkar lagan", muhto ii máhte divvut dan: "diekkárlágan".  bidjan errorth

    1. Nuorat eai háliit oaffariid min stivret, muhto dakkáriid mat ieža máhttet nuppastuhttit ja máilmmi doalvut viidaseappo.
* Gávdná "nuppastuhttit", muhto ii máhte divvut dan: "á". fixed
* Gávdná "viidaseappo", muhto ii máhte divvut dan: "á". fixed

    1. Muhto aŋkke joakta oaffara gulahallanvugiin.
* joakta bidjan errorth
* NB!! Evttoha boasttu divodusaid: loakta, jukta, loaktá, hoaktá, poasta

HUND VS PENGAR:
bena bednag- hund;
biednik biednig- sg. mynt, slant; pl. pengar; 

    1. Árvideames danin go mii sápmelaččaa nu guhkka leat hárjanan dien vuohkái. 
* Gávdná "guhkka", muhto ii máhte divvut dan: "á".  divvu ná: guhkká --- biján yaml fiillii

    1. Dalle lea mihá álkibun váidalit ahte nubbi lea jalla, almma čujuhit ahte maid lei baicca galgat bargat. 
* Ii fuomáš divvut: álkibun => álkit advearba iige adjektiiva

    1. Muhto mun balan sakka ahte min politihkkarat eai duođas oba hálitge ovddasvástadusa. 
* Gávdná "politihkkarat", muhto ii máhte divvut dan: "á". "politihkkarat" - hápmi lea njuolga ja dál dat dovdá nai
* NEG: Ii fuomáš divvut conneg: hálit => háliit hmm.... real word error...hmmm....hálit        hálihit+V+TV+Ind+Prs+ConNeg        0,000000.  válddán go eret dán ConNeg hámi ollát?

    1. Gii bat čovdosiid háliida gávdnat, go nubbái sáhttá čujuhit váttisvuođaid ja vuordit son daid gálga. 
* Ii fuomáš divvut: gálga => gálgá fixed

    1. Mun jáhkán gullat eambbo ahte’ eambbo biehkuma, mađi eambbo ovddasvástadusa šadda sáhka ahte sámi servodat sáhtta oažžut. 
* NB!! Divvu "aht'", muhto ii sihko apostrofamearkka teavsttas: ahte'

"<ahte>"
        "ahte" CS <W:0.0> @CVP MAP:13507:r11 SELECT:13525:r990 #5->5
* **"ahte" CC <W:0.0> @CVP @CNP MAP:13510:r12 SELECT:13525**: r990
* **"ahte" CC Err/Orth <W:0.0> @CVP @CNP MAP:13510:r12 SELECT:13525**: r990
* **"ahte" CS Err/Orth Err/Spellrelax <W:0.0> REMOVE**: 2152
* **"áhtat" V TV Ind Prs Du1 Err/Spellrelax <W:0.0> REMOVE**: 2152
* **"áhtat" V TV Ind Prt Pl3 Err/Spellrelax <W:0.0> REMOVE**: 2152
* **"áhtti" N Sem/Dummytag Sg Gen Allegro Err/Spellrelax <W:0.0> REMOVE**: 2152
"<’>"
        "’" PUNCT RIGHT <W:0.0> #6->6

aht’
aht’        aht’+?        inf ---- Duommá sáhttágo lásihit? leago norbma?

nps-006_ihpil.correct.txt
--------

    1. Goitge lean ollu eivákto, muhto lea veaha dan dihte go liikon dasa, ja go olmmoš diehtá ahte lea iešválljejuvvon aktonasvuohta, ahte gámnojit alternatiivvat: Dalle ii leat nu várálaš eivákto leahkit.
* GramDivvun ii dovdda "iešválljejuvvon" ja sivvan lea go dat ii gávdno leksikonas. Rivttes sátni lea "iežasválljejuvvon." Mo dán sáhttá divvut?   hmmm.... --- Err/orthet????

    1. Muhto iešdobdu lea loktejuvvon, ja dat lea dagahan ahte in leat lanjas čiehkádan dan vahku nugo ovddes vahku. 
* Galggašii leat "čiehkádallan". Eahpesihkar dan birra mo dán sáhtášii divvut. - dalle go lea "vahku" dahje eará Sem/Time duration
* "ovddes" galggašii leat "ovddit", muhto echo addá: "ovddeš" (lea lexical error). Eahpesihkar dan birra mo dán sáhtášii divvut. --- doaibmá dal

    1. Jáhkán lea studeanttaleaika, muhto munnje han orru jáhkehahtti; nu measta dagalin mannan vahku, muhto in dál šat leat nu váivvis.
* Ii nagot divvut missing-CS meattáhusa: "Jáhkán ahte" --- valeansa! love it
* In dieđe gullágo dát GramDivvumii, muhto error mark-up:s goallossáni vuosttaš oassi lea divvojuvvon genitiivvas nominatiivan (studeantaleaika) - GramDivvun aŋkke ii divo dákkár meattáhusaid. Muhto galggašiigo?  bidjan errorth

    1. Leat máŋga olgoriikkalačča mu lobus, ja lea buorre vejolašvuohta munnje beassat eŋgelasgielan hárjehallat.
* In dieđe mii "lobus/lohpu" lea, eaige sátnegirjjit ge. GramDivvun ii diehttelasat de sáhte divvut sáni.  bidjan lohpu  Sem/Build-room
* "eaŋgelasgielan" lea boastut, muhto GramDivvun ii dieđe maid galga evttohit dasa.  bidjan errorth

    1. Ja miellagiddevaš hájat leat gievkkanáimmus ovttelit..
* "oktilit" ii evttohuvvo.  bidjan errorth
