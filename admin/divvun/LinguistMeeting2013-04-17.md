# Lingvistmøte 17.4.2013

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* propernoun-konvertering og -tilpassing

# Propernoun-konvertering og -tilpassing

Det er tre oppgåver:
* avklara lingvistikken
* tilpassa/oppdatera konverteringsskriptet
* sjekka at alle leksikon er (korrekt) definerte

## Avklara lingvistikken

Problemområde: i-finale namn. Nokre døme:

```
Aakenusjärvi:Aakenus^järvi ACCRA-plc ;
Ahomäki:Aho^mäki ACCRA-sur ;
Akureyri ACCRA-plc ;
Vivi ACCRA-fem ;
Vivvi ACCRA-fem ;
Åsli:Ås^li ACCRA-fem ;
Översti:Över^sti ACCRA-sur ;
Øfsti:Øf^sti ACCRA-sur ;
Ørnhøi:Ørn^hø DUBAI-sur ;
Østli:Øst^li ACCRA-sur ;
```

I SME blir alle bøygde som likestava, dvs ved å leggja på ein -s i lokativ,
uavhengig av uttalen hjå den enkelte. I SMA og SMJ bør dei delast i to, etter kva slags stavingstype dei fell inn under (likestava og ulikestava).

I SMA mener Maja det er klart, da i-navn må bli ODD, de vil tilsvare -ije-stammen i sørsamisk. HVis det skulle være EVEN, med -ie-stamme, blir det en omlydsregel som ikke passer til NAVN, f.eks navntet 'Vivi’- skulle da bli 'Vævan'(som høres helt rart ut!:-). Maja mener at i-navn får samme paradigme som 'rovkije'. 'rovkije' kan høres ut som et likestavelsessubstantiv 'rovkie', men det er egentlig et ODD-substantiv 'rovkije'.  Men, denne kan være litt vrien, fordi -ss- i illativ, kan nesten høres ut som enkel -s- jfr. diskusjonen om "skiebtjeles" :-)

I SMJ bøyes noen som like og noen som odd. De fleste er odd. 

SMJ-klassifisering:
```
Aakenusjärvi:Aakenus^järvi ACCRA-plc ; ! odd jij (järvis *järvij ?järvijij)
Ahomäki:Aho^mäki ACCRA-sur ;           ! odd aj/jij
Akureyri ACCRA-plc ;                   ! odd aj
Vivi ACCRA-fem ;                       ! even Vivij
Vivvi ACCRA-fem ;                      ! odd Vivvijij
Åsli:Ås^li ACCRA-fem ;                 ! odd aj
Översti:Över^sti ACCRA-sur ;           ! odd Øverstiaj
Øfsti:Øf^sti ACCRA-sur ;               ! odd Øfstiaj
Ørnhøi:Ørn^hø DUBAI-sur ;              ! odd aj
Østli:Øst^li ACCRA-sur ;               ! odd aj

Aakenusjärvi
Aakenusjärvia
Aakenusjärviav 
Aakenusjärvijin
Aakenusjärvijis/Aakenusjärvis
Aakenusjärvijijn

```

SMA-klassifisering: OK   rivgu --> rovkije
```                 ie - 
Aakenusjärvi:Aakenus^järvi ACCRA-plc ; ! ODD  -EVEN     Sølvi -> Selvie -> Selvijasse
Ahomäki:Aho^mäki ACCRA-sur ;           ! ODD
Akurey-ri ACCRA-plc ;                   ! ODD
Vivi ACCRA-fem ;                       ! odd  
Vivvi ACCRA-fem ;                      ! odd
Ås-li:Ås^li ACCRA-fem ;                 ! EVEN - 
Över-sti:Över^sti ACCRA-sur ;           ! EVEN  - tid -tïjje
Øfs-ti:Øf^sti ACCRA-sur ;               ! EVEN  - ijese
Ørnhøi:Ørn^hø DUBAI-sur ;              ! odd
Øst-li:Øst^li ACCRA-sur ;               ! som politi - EVEN _ lïjjese
```

## Konverteringsskript

Det ligg i:
```
src/scripts/smi-sm[aj]-conversion.pl
```

## Sjekka og tilpassa leksikon

Vi ventar til lingvistikken er klar.
