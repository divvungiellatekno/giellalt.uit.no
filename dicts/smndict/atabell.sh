# list of command making xml document

DATO=`date +"%d.%m.%y."`

# a. finsmn dict adjs
 cat $GTHOME/words/dicts/finsmn/src/A_finsmn.xml|grep '<t '|tr '<' '>'|cut -d">" -f3 | egrep -v '(^-|-$)'| sort | uniq > t1

# b. smnfin dict adjs
 cat $GTHOME/words/dicts/smnfin/src/a_smnfin.xml $GTHOME/words/dicts/smnfin/src/Saami-suoma_ERRATA_03072015_smnfin.xml|grep '<l pos="A"'|tr '<' '>'|cut -d">" -f3 | egrep -v '(^-|-$)'|sort | uniq > t2

 # c. all adjectives
 #cat $GTHOME/langs/smn/src/morphology/stems/adjectives.lexc |tr "\!" "£"|cut -d"£" -f1|grep ";"|tr '[+:]' ' '| cut -d" " -f1|tr -d '[#^]'|sort|uniq > t1


# d. only oahpa adjectives
# cat $GTHOME/ped/smn/src/a_smnfin.xml | grep '<l ' | tr "<" ">" | cut -d ">" -f3 | sort -u > t4


DATO=`date +"%d.%m.%y."`

# Printing headers:

echo '<document><header><title>finsmn-adjektiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/adjfinsmntabell.xml
echo "" >> gen/adjfinsmntabell.xml
#echo "Päivämäärä: $DATO"  >> gen/adjfinsmntabell.xml
echo "<tr><th>  lemma  </th><th>  Sg Nom  </th><th>  Attr </th><th> Comp Sg Nom </th><th> Superl Sg Nom </th><th> Sg Acc </th><th> Sg Ill</th></tr>" >> gen/adjfinsmntabell.xml

echo '<document><header><title>Käänteinen lista - finsmn-adjektiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/adjfinsmntabellrev.xml
echo "" >> gen/adjfinsmntabellrev.xml
#echo "Päivämäärä: $DATO"  >> gen/adjfinsmntabellrev.xml
echo "<tr><th>  lemma  </th><th>  Sg Nom  </th><th>  Attr </th><th> Comp Sg Nom </th><th> Superl Sg Nom </th><th> Sg Acc </th><th> Sg Ill </th></tr>" >> gen/adjfinsmntabellrev.xml


echo '<document><header><title>smnfin-adjektiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/adjsmnfintabell.xml
echo "" >> gen/adjsmnfintabell.xml
#echo "Päivämäärä: $DATO"  >> gen/adjsmnfintabell.xml
echo "<tr><th>  lemma  </th><th>  Sg Nom  </th><th>  Attr </th><th> Comp Sg Nom </th><th> Superl Sg Nom </th><th> Sg Acc </th><th> Sg Ill</th></tr>" >> gen/adjsmnfintabell.xml

echo '<document><header><title>Käänteinen lista - smnfin-adjektiivien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/adjsmnfintabellrev.xml
echo "" >> gen/adjsmnfintabellrev.xml
#echo "Päivämäärä: $DATO"  >> gen/adjsmnfintabellrev.xml
echo "<tr><th>  lemma  </th><th>  Sg Nom  </th><th>  Attr </th><th> Comp Sg Nom </th><th> Superl Sg Nom </th><th> Sg Acc </th><th> Sg Ill </th></tr>" >> gen/adjsmnfintabellrev.xml


# Making the 4 columns
cat t1|sed 's/$/+A+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsgnom1
cat t1|sed 's/$/+A+Attr/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tattr1
cat t1|sed 's/$/+A+Comp+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tcomp1
cat t1|sed 's/$/+A+Superl+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsuperl1
cat t1|sed 's/$/+A+Sg+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tAcc1
cat t1|sed 's/$/+A+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tIll1

cat t2|sed 's/$/+A+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsgnom2
cat t2|sed 's/$/+A+Attr/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tattr2
cat t2|sed 's/$/+A+Comp+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tcomp2
cat t2|sed 's/$/+A+Superl+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsuperl2
cat t2|sed 's/$/+A+Sg+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tAcc2
cat t2|sed 's/$/+A+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tIll2

paste -d"£" t1 tsgnom1 tattr1 tcomp1 tsuperl1 tAcc1 tIll1 | sed 's/£/ <\/td><td> /g;' | sed 's/^/<tr><td> /'|sed 's/$/<\/td><\/tr> /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tadjforms1
paste -d"£" t2 tsgnom2 tattr2 tcomp2 tsuperl2 tAcc2 tIll2 | sed 's/£/ <\/td><td> /g;' | sed 's/^/<tr><td> /'|sed 's/$/<\/td><\/tr> /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tadjforms2

cat tadjforms1 >> gen/adjfinsmntabell.xml
cat tadjforms2 >> gen/adjsmnfintabell.xml
echo "</table></body></document>" >> gen/adjfinsmntabell.xml
echo "</table></body></document>" >> gen/adjsmnfintabell.xml

rm -f tattr*  tsgnom*  tcomp*   tsuperl* tAcc* tIll*

cat t1 | perl -nle 'print scalar reverse $_' > t1rev
cat t2 | perl -nle 'print scalar reverse $_' > t2rev

paste t1rev tadjforms1 | sort | cut -f2 | grep '[A-Za-z]' >> gen/adjfinsmntabellrev.xml
paste t2rev tadjforms2 | sort | cut -f2 | grep '[A-Za-z]' >> gen/adjsmnfintabellrev.xml

echo "</table></body></document>" >> gen/adjfinsmntabellrev.xml
echo "</table></body></document>" >> gen/adjsmnfintabellrev.xml

rm -f t?rev* tadjforms*
