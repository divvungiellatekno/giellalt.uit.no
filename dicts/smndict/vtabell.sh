# list of command making xml document

# a. finsmn verbs
cat $GTHOME/words/dicts/finsmn/src/V_finsmn.xml|grep '<t '|tr '<' '>'|cut -d">" -f3 | egrep -v '(^-|-$)'| sort | uniq > t1

# b. smnfin verbs
cat $GTHOME/words/dicts/smnfin/src/v_smnfin.xml $GTHOME/words/dicts/smnfin/src/Saami-suoma_ERRATA_03072015_smnfin.xml|grep '<l pos="V"'|tr '<' '>'|cut -d">" -f3 | egrep -v '(^-|-$)'|sort | uniq > t2



# c. only oahpa verbs
#cat $GTHOME/ped/smn/src/v_smnfin.xml | grep '<l ' | tr "<" ">" | cut -d ">" -f3 | sort -u > t3

DATO=`date +"%d.%m.%y."`

# Printing headers:

# Alphabetically
#finsmn
echo '<document><header><title>finsmn-verbien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/verbfinsmntabell.xml
echo "" >> gen/verbfinsmntabell.xml
#echo "Päivämäärä: $DATO" >> gen/verbfinsmntabell.xml
echo "<tr><th>  lemma  </th><th>  Inf  </th><th>  Prs Sg1 </th><th> Prs Sg3 </th><th> Prs Du1 </th><th> Prs Du3 </th><th> Prs Pl3 </th><th> Prt Sg1 </th><th> Ger </th><th> PrsPrc </th><th> Der/NomAct </th></tr>" >> gen/verbfinsmntabell.xml

#smnfin
echo '<document><header><title>Käänteinen lista: finsmn-verbien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/verbfinsmntabellrev.xml
echo "" >> gen/verbfinsmntabellrev.xml
echo  "Päivämäärä: $DATO" >> gen/verbfinsmntabellrev.xml
echo "<tr><th>  lemma  </th><th>  Inf  </th><th>  Prs Sg1 </th><th> Prs Sg3 </th><th> Prs Du1 </th><th> Prs Du3 </th><th> Prs Pl3 </th><th> Prt Sg1 </th><th> Ger </th><th> PrsPrc </th><th> Der/NomAct </th></tr>" >> gen/verbfinsmntabellrev.xml

# Reversed
# finsmn
echo '<document><header><title>smnfin-verbien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/verbsmnfintabell.xml
echo "" >> gen/verbsmnfintabell.xml
echo "Päivämäärä: $DATO" >> gen/verbsmnfintabell.xml
echo "<tr><th>  lemma  </th><th>  Inf  </th><th>  Prs Sg1 </th><th> Prs Sg3 </th><th> Prs Du1 </th><th> Prs Du3 </th><th> Prs Pl3 </th><th> Prt Sg1 </th><th> Ger </th><th> PrsPrc </th><th> Der/NomAct </th></tr>" >> gen/verbsmnfintabell.xml

#smnfin
echo '<document><header><title>Käänteinen lista: smnfin-verbien taulukko - HUOM! työlista korjaamista varten</title></header><body><table class="ForrestTable">' > gen/verbsmnfintabellrev.xml
echo "" >> gen/verbsmnfintabellrev.xml
echo "Päivämäärä: $DATO" >> gen/verbsmnfintabellrev.xml
echo "<tr><th>  lemma  </th><th>  Inf  </th><th>  Prs Sg1 </th><th> Prs Sg3 </th><th> Prs Du1 </th><th> Prs Du3 </th><th> Prs Pl3 </th><th> Prt Sg1 </th><th> Ger </th><th> PrsPrc </th><th> Der/NomAct </th></tr>" >> gen/verbsmnfintabellrev.xml



# Making the 7 columns
cat t1|sed 's/$/+V+Inf/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1inf
cat t2|sed 's/$/+V+Inf/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2inf
#cat t3|sed 's/$/+V+Inf/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3inf

cat t1|sed 's/$/+V+Ind+Prs+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prssg1
cat t2|sed 's/$/+V+Ind+Prs+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prssg1
#cat t3|sed 's/$/+V+Ind+Prs+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prssg1

cat t1|sed 's/$/+V+Ind+Prs+Sg3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prssg3
cat t2|sed 's/$/+V+Ind+Prs+Sg3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prssg3
#cat t3|sed 's/$/+V+Ind+Prs+Sg3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prssg3

cat t1|sed 's/$/+V+Ind+Prs+Du1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prsdu1
cat t2|sed 's/$/+V+Ind+Prs+Du1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prsdu1
#cat t3|sed 's/$/+V+Ind+Prs+Du1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prsdu1

cat t1|sed 's/$/+V+Ind+Prs+Du3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prsdu3
cat t2|sed 's/$/+V+Ind+Prs+Du3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prsdu3
#cat t3|sed 's/$/+V+Ind+Prs+Du3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prsdu3

cat t1|sed 's/$/+V+Ind+Prs+Pl3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prspl3
cat t2|sed 's/$/+V+Ind+Prs+Pl3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prspl3
#cat t3|sed 's/$/+V+Ind+Prs+Pl3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prspl3

cat t1|sed 's/$/+V+Ind+Prt+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prtsg1
cat t2|sed 's/$/+V+Ind+Prt+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prtsg1
#cat t3|sed 's/$/+V+Ind+Prt+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prtsg1

cat t1|sed 's/$/+V+Ger/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1ger
cat t2|sed 's/$/+V+Ger/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2ger
#cat t3|sed 's/$/+V+Ger/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3ger

cat t1|sed 's/$/+V+PrsPrc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prsprc
cat t2|sed 's/$/+V+PrsPrc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prsprc
#cat t3|sed 's/$/+V+PrsPrc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prsprc

cat t1|sed 's/$/+V+Der1+Der\/NomAct+N+Sg/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1deract
cat t2|sed 's/$/+V+Der1+Der\/NomAct+N+Sg/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2deract
#cat t3|sed 's/$/+V+Der1+Der\/NomAct+N+Sg/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-norm.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3deract

paste -d"£" t1 t1inf t1prssg1 t1prssg3 t1prsdu1 t1prsdu3 t1prspl3 t1prtsg1 t1ger t1prsprc t1deract | sed 's/£/ <\/td><td> /g;' | sed 's/^/<tr><td> /'|sed 's/$/<\/td><\/tr> /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tverbforms1
paste -d"£" t2 t2inf t2prssg1 t2prssg3 t2prsdu1 t2prsdu3 t2prspl3 t2prtsg1 t2ger t2prsprc t1deract | sed 's/£/ <\/td><td> /g;' | sed 's/^/<tr><td> /'|sed 's/$/<\/td><\/tr> /'|  sed 's/,/, /g;' | grep '[A-Za-z]' > tverbforms2
#paste -d"|" t3 t3inf t3prssg1 t3prssg3 t3prsdu1 t3prsdu3 t3prspl3 t3prtsg1 t3ger t3prsprc t1deract | sed 's/|/ | /g;' | sed 's/^/| /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tverbforms3


cat tverbforms1 >> gen/verbfinsmntabell.xml
cat tverbforms2 >> gen/verbsmnfintabell.xml
echo "</table></body></document>" >> gen/verbfinsmntabell.xml
echo "</table></body></document>" >> gen/verbsmnfintabell.xml


rm -f t?inf t?prssg1 t?prssg3 t?prsdu1 t?prsdu3 t?prspl3 t?prtsg1 t?ger t?prsprc t?deract

cat t1 | perl -nle 'print scalar reverse $_' > t1rev
cat t2 | perl -nle 'print scalar reverse $_' > t2rev
#cat t3 | perl -nle 'print scalar reverse $_' > t3rev

paste t1rev tverbforms1 | sort | cut -f2 | grep '[A-Za-z]' >> gen/verbfinsmntabellrev.xml
paste t2rev tverbforms2 | sort | cut -f2 | grep '[A-Za-z]' >> gen/verbsmnfintabellrev.xml
#paste t3rev tverbforms3 | sort | cut -f2 | grep '[A-Za-z]' >> gen/verboahpatabellrev.xml

echo "</table></body></document>" >> gen/verbfinsmntabellrev.xml
echo "</table></body></document>" >> gen/verbsmnfintabellrev.xml


rm -f t1 t2 t1rev t2rev tverbforms* # t3 t3rev 
