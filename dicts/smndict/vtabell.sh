# list of command making jspwiki document

# a. all verbs
cat $GTHOME/langs/smn/src/morphology/stems/verbs.lexc |tr "\!" "£"|cut -d"£" -f1|grep ";"|tr '[+:]' ' '| cut -d" " -f1|tr -d '[#^]'|sort|uniq > t1

# b. dict verbs
cat $GTHOME/words/dicts/smnfin/src/v_smnfin.xml|grep '<l '|tr '<' '>'|cut -d">" -f3 > t2

# c. only oahpa verbs
#cat $GTHOME/ped/smn/src/v_smnfin.xml | grep '<l ' | tr "<" ">" | cut -d ">" -f3 | sort -u > t3

DATO=`date`

# Printing headers:

echo "!!!Kaikkien verbien taulukko - HUOM! työlista korjaamista varten" > gen/verballetabell.jspwiki
echo "" >> gen/verballetabell.jspwiki
echo "Päivämäärä: $DATO" >> gen/verballetabell.jspwiki

echo "||  lemma  ||  Inf  ||  Prs Sg1 || Prs Sg3 || Prs Du1 || Prs Du3 || Prs Pl3 || Prt Sg1 || Ger || PrsPrc || Der/NomAct " >> gen/verballetabell.jspwiki

echo "!!!Käänteinen lista: Kaikkien substantiivien taulukko - HUOM! työlista korjaamista varten" > gen/verballetabellrev.jspwiki
echo "" >> gen/verballetabellrev.jspwiki
echo "Päivämäärä: $DATO" >> gen/verballetabellrev.jspwiki
echo "||  lemma  ||  Inf  ||  Prs Sg1 || Prs Sg3 || Prs Du1 || Prs Du3 || Prs Pl3 || Prt Sg1 || Ger || PrsPrc || Der/NomAct " >> gen/verballetabellrev.jspwiki

echo "!!!Sanakirjan verbien taulukko - HUOM! työlista korjaamista varten" > gen/verbdicttabell.jspwiki
echo "" >> gen/verbdicttabell.jspwiki
echo "Päivämäärä: $DATO" >> gen/verbdicttabell.jspwiki
echo "||  lemma  ||  Inf  ||  Prs Sg1 || Prs Sg3 || Prs Du1 || Prs Du3 || Prs Pl3 || Prt Sg1 || Ger || PrsPrc || Der/NomAct " >> gen/verbdicttabell.jspwiki

echo "!!!Käänteinen lista: Sanakirjan verbien taulukko - HUOM! työlista korjaamista varten" > gen/verbdicttabellrev.jspwiki
echo "" >> gen/verbdicttabellrev.jspwiki
echo "Päivämäärä: $DATO": >> gen/verbdicttabellrev.jspwiki
echo "||  lemma  ||  Inf  ||  Prs Sg1 || Prs Sg3 || Prs Du1 || Prs Du3 || Prs Pl3 || Prt Sg1 || Ger || PrsPrc || Der/NomAct " >> gen/verbdicttabellrev.jspwiki


# Making the 7 columns
cat t1|sed 's/$/+V+Inf/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1inf
cat t2|sed 's/$/+V+Inf/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2inf
#cat t3|sed 's/$/+V+Inf/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3inf

cat t1|sed 's/$/+V+Ind+Prs+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prssg1
cat t2|sed 's/$/+V+Ind+Prs+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prssg1
#cat t3|sed 's/$/+V+Ind+Prs+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prssg1

cat t1|sed 's/$/+V+Ind+Prs+Sg3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prssg3
cat t2|sed 's/$/+V+Ind+Prs+Sg3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prssg3
#cat t3|sed 's/$/+V+Ind+Prs+Sg3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prssg3

cat t1|sed 's/$/+V+Ind+Prs+Du1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prsdu1
cat t2|sed 's/$/+V+Ind+Prs+Du1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prsdu1
#cat t3|sed 's/$/+V+Ind+Prs+Du1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prsdu1

cat t1|sed 's/$/+V+Ind+Prs+Du3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prsdu3
cat t2|sed 's/$/+V+Ind+Prs+Du3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prsdu3
#cat t3|sed 's/$/+V+Ind+Prs+Du3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prsdu3

cat t1|sed 's/$/+V+Ind+Prs+Pl3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prspl3
cat t2|sed 's/$/+V+Ind+Prs+Pl3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prspl3
#cat t3|sed 's/$/+V+Ind+Prs+Pl3/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prspl3

cat t1|sed 's/$/+V+Ind+Prt+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prtsg1
cat t2|sed 's/$/+V+Ind+Prt+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prtsg1
#cat t3|sed 's/$/+V+Ind+Prt+Sg1/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prtsg1

cat t1|sed 's/$/+V+Ger/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1ger
cat t2|sed 's/$/+V+Ger/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2ger
#cat t3|sed 's/$/+V+Ger/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3ger

cat t1|sed 's/$/+V+PrsPrc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1prsprc
cat t2|sed 's/$/+V+PrsPrc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2prsprc
#cat t3|sed 's/$/+V+PrsPrc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3prsprc

cat t1|sed 's/$/+V+Der1+Der\/NomAct+N+Sg/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t1deract
cat t2|sed 's/$/+V+Der1+Der\/NomAct+N+Sg/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t2deract
#cat t3|sed 's/$/+V+Der1+Der\/NomAct+N+Sg/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8|sed 's/.*+V.*/-/'|tr '\t' ',' > t3deract

paste -d"|" t1 t1inf t1prssg1 t1prssg3 t1prsdu1 t1prsdu3 t1prspl3 t1prtsg1 t1ger t1prsprc t1deract | sed 's/|/ | /g;' | sed 's/^/| /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tverbforms1
paste -d"|" t2 t2inf t2prssg1 t2prssg3 t2prsdu1 t2prsdu3 t2prspl3 t2prtsg1 t2ger t2prsprc t1deract | sed 's/|/ | /g;' | sed 's/^/| /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tverbforms2
#paste -d"|" t3 t3inf t3prssg1 t3prssg3 t3prsdu1 t3prsdu3 t3prspl3 t3prtsg1 t3ger t3prsprc t1deract | sed 's/|/ | /g;' | sed 's/^/| /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tverbforms3

cat tverbforms1 >> gen/verballetabell.jspwiki
cat tverbforms2 >> gen/verbdicttabell.jspwiki
#cat tverbforms3 >> gen/verboahpatabell.jspwiki

rm -f t?inf t?prssg1 t?prssg3 t?prsdu1 t?prsdu3 t?prspl3 t?prtsg1 t?ger t?prsprc t?deract

cat t1 | perl -nle 'print scalar reverse $_' > t1rev
cat t2 | perl -nle 'print scalar reverse $_' > t2rev
#cat t3 | perl -nle 'print scalar reverse $_' > t3rev

paste t1rev tverbforms1 | sort | cut -f2 | grep '[A-Za-z]' >> gen/verballetabellrev.jspwiki
paste t2rev tverbforms2 | sort | cut -f2 | grep '[A-Za-z]' >> gen/verbdicttabellrev.jspwiki
#paste t3rev tverbforms3 | sort | cut -f2 | grep '[A-Za-z]' >> gen/verboahpatabellrev.jspwiki

rm -f t1 t2 t1rev t2rev tverbforms* # t3 t3rev 
