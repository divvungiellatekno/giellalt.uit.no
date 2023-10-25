# list of command making xml document


# a. finsmn nouns
 cat $GTHOME/words/dicts/finsmn/src/N_finsmn.xml|grep '<t '|tr '<' '>'|cut -d">" -f3 | egrep -v '(^-|-$)'| sort | uniq > t1

# b. smnfin nouns
 cat $GTHOME/words/dicts/smnfin/src/a_smnfin.xml $GTHOME/words/dicts/smnfin/src/Saami-suoma_ERRATA_03072015_smnfin.xml|grep '<l pos="N"'|tr '<' '>'|cut -d">" -f3 | egrep -v '(^-|-$)'|sort | uniq > t2


# c. only oahpa nouns
# cat $GTHOME/ped/smn/src/n_smnfin.xml | grep '<l ' | tr "<" ">" | cut -d ">" -f3 | sort -u > t3

DATO=`date +"%d.%m.%y."`

# Printing headers:

# Alphabetically
#finsmn
echo '<document><header><title>finsmn-substantiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/nounfinsmntabell.xml
echo "" >> gen/nounfinsmntabell.xml
echo "Päivämäärä: $DATO" >> gen/nounfinsmntabell.xml
echo "<tr><th>  lemma  </th><th>  Nom Sg  </th><th>  Gen Sg </th><th> Ill Sg </th><th> Loc Sg </th><th> Ess </th><th> Nom Pl </th><th> Acc Pl </th><th> Ill Pl </th></tr>" >> gen/nounfinsmntabell.xml

#smnfin
echo '<document><header><title>Käänteinen lista: finsmn-substantiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/nounfinsmntabellrev.xml
echo "" >> gen/nounfinsmntabellrev.xml
echo  "Päivämäärä: $DATO" >> gen/nounfinsmntabellrev.xml
echo "<tr><th>  lemma  </th><th>  Nom Sg  </th><th>  Gen Sg </th><th> Ill Sg </th><th> Loc Sg </th><th> Ess </th><th> Nom Pl </th><th> Acc Pl </th><th> Ill Pl </th></tr>" >> gen/nounfinsmntabellrev.xml

# Reversed
# finsmn
echo '<document><header><title>smnfin-substantiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/nounsmnfintabell.xml
echo "" >> gen/nounsmnfintabell.xml
echo "Päivämäärä: $DATO" >> gen/nounsmnfintabell.xml
echo "<tr><th>  lemma  </th><th>  Nom Sg  </th><th>  Gen Sg </th><th> Ill Sg </th><th> Loc Sg </th><th> Ess </th><th> Nom Pl </th><th> Acc Pl </th><th> Ill Pl </th></tr>" >> gen/nounsmnfintabell.xml

#smnfin
echo '<document><header><title>Käänteinen lista: smnfin-substantiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/nounsmnfintabellrev.xml
echo "" >> gen/nounsmnfintabellrev.xml
echo "Päivämäärä: $DATO" >> gen/nounsmnfintabellrev.xml
echo "<tr><th>  lemma  </th><th>  Nom Sg  </th><th>  Gen Sg </th><th> Ill Sg </th><th> Loc Sg </th><th> Ess </th><th> Nom Pl </th><th> Acc Pl </th><th> Ill Pl </th></tr>" >> gen/nounsmnfintabellrev.xml






# Making the 7 columns
cat t1|sed 's/$/+N+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1sgnom
cat t2|sed 's/$/+N+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2sgnom
#cat t3|sed 's/$/+N+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3sgnom

cat t1|sed 's/$/+N+Sg+Gen/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1sggen
cat t2|sed 's/$/+N+Sg+Gen/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2sggen
#cat t3|sed 's/$/+N+Sg+Gen/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3sggen

cat t1|sed 's/$/+N+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1sgill
cat t2|sed 's/$/+N+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2sgill
#cat t3|sed 's/$/+N+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3sgill

cat t1|sed 's/$/+N+Sg+Loc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1sgloc
cat t2|sed 's/$/+N+Sg+Loc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2sgloc
#cat t3|sed 's/$/+N+Sg+Loc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3sgloc

cat t1|sed 's/$/+N+Ess/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1ess
cat t2|sed 's/$/+N+Ess/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2ess
#cat t3|sed 's/$/+N+Ess/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3ess

cat t1|sed 's/$/+N+Pl+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1plnom
cat t2|sed 's/$/+N+Pl+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2plnom
#cat t3|sed 's/$/+N+Pl+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3plnom

cat t1|sed 's/$/+N+Pl+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1placc
cat t2|sed 's/$/+N+Pl+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2placc
#cat t3|sed 's/$/+N+Pl+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3placc

cat t1|sed 's/$/+N+Pl+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t1plill
cat t2|sed 's/$/+N+Pl+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t2plill
#cat t3|sed 's/$/+N+Pl+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+N.*/-/'|tr '\t' ',' > t3plill



paste -d"£" t1 t1sgnom t1sggen t1sgill t1sgloc t1ess t1plnom t1placc t1plill | sed 's/£/ <\/td><td> /g;' | sed 's/^/<tr><td> /'|sed 's/$/<\/td><\/tr> /'| sed 's/,/, /g;' | grep '[A-Za-z]' > t1nounforms
paste -d"£" t2 t2sgnom t2sggen t2sgill t2sgloc t2ess t2plnom t2placc t2plill | sed 's/£/ <\/td><td> /g;' | sed 's/^/<tr><td> /'|sed 's/$/<\/td><\/tr> /'| sed 's/,/, /g;' | grep '[A-Za-z]' > t2nounforms



cat t1nounforms >> gen/nounfinsmntabell.xml
cat t2nounforms >> gen/nounsmnfintabell.xml

echo "</table></body></document>" >> gen/nounfinsmntabell.xml
echo "</table></body></document>" >> gen/nounsmnfintabell.xml

rm -f  t? t?sgnom t?sggen t?sgill t?sgloc t?ess t?plnom t?placc t?plill 

cat t1 | perl -nle 'print scalar reverse $_' > t1rev
cat t2 | perl -nle 'print scalar reverse $_' > t2rev
#cat t3 | perl -nle 'print scalar reverse $_' > t3rev

paste t1rev t1nounforms | sort | cut -f2 | grep '[A-Za-z]' >> gen/nounfinsmntabellrev.xml
paste t2rev t2nounforms | sort | cut -f2 | grep '[A-Za-z]' >> gen/nounsmnfintabellrev.xml

echo "</table></body></document>" >> gen/nounfinsmntabellrev.xml
echo "</table></body></document>" >> gen/nounsmnfintabellrev.xml

rm -f t1 t2 t1rev t2rev t?nounforms # t3 t3rev 
