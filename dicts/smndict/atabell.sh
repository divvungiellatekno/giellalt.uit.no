# list of command making jspwiki document

# a. all adjectives
cat $GTHOME/langs/smn/src/morphology/stems/adjectives.lexc |tr "\!" "£"|cut -d"£" -f1|grep ";"|tr '[+:]' ' '| cut -d" " -f1|tr -d '[#^]'|sort|uniq > t1

# b. dict adjs
 cat $GTHOME/words/dicts/smnfin/src/a_smnfin.xml|grep '<l '|tr '<' '>'|cut -d">" -f3 > t2


# c. only oahpa adjectives
# cat $GTHOME/ped/smn/src/a_smnfin.xml | grep '<l ' | tr "<" ">" | cut -d ">" -f3 | sort -u > t3


# Printing headers:

echo "!!!Sanakirja-adjektiivien taulukko - HUOM! työlista korjaamista varten" > gen/adjdicttabell.jspwiki
echo "" >> gen/adjdicttabell.jspwiki
echo "||  lemma  ||  Attr  ||  Sg Nom || Comp Sg Nom || Superl Sg Nom || Sg Acc || Sg Ill" >> gen/adjdicttabell.jspwiki

echo "!!!Käänteinen lista - Sanakirja-adjektiivien taulukko - HUOM! työlista korjaamista varten" > gen/adjdicttabellrev.jspwiki
echo "" >> gen/adjdicttabellrev.jspwiki
echo "||  lemma  ||  Attr  ||  Sg Nom || Comp Sg Nom || Superl Sg Nom || Sg Acc || Sg Ill " >> gen/adjdicttabellrev.jspwiki


# Making the 4 columns
cat t1|sed 's/$/+A+Attr/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tattr1
cat t1|sed 's/$/+A+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsgnom1
cat t1|sed 's/$/+A+Comp+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tcomp1
cat t1|sed 's/$/+A+Superl+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsuperl1
cat t1|sed 's/$/+A+Sg+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tAcc1
cat t1|sed 's/$/+A+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tIll1

cat t2|sed 's/$/+A+Attr/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tattr2
cat t2|sed 's/$/+A+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsgnom2
cat t2|sed 's/$/+A+Comp+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tcomp2
cat t2|sed 's/$/+A+Superl+Sg+Nom/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tsuperl2
cat t2|sed 's/$/+A+Sg+Acc/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tAcc2
cat t2|sed 's/$/+A+Sg+Ill/;'| lookup -q $GTHOME/langs/smn/src/generator-gt-desc.xfst |tr '\n' '™'|sed 's/™™/£/g;'|tr '£' '\n'|tr '™' '\t'|cut -f2,4,6,8,10,12,14,16|sed 's/.*+A.*/-/'|tr '\t' ',' > tIll2

paste -d"|" t1 tattr1 tsgnom1 tcomp1 tsuperl1 tAcc1 tIll1 | sed 's/|/ | /g;' | sed 's/^/| /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tadjforms1
paste -d"|" t2 tattr2 tsgnom2 tcomp2 tsuperl2 tAcc2 tIll2 | sed 's/|/ | /g;' | sed 's/^/| /'| sed 's/,/, /g;' | grep '[A-Za-z]' > tadjforms2

cat tadjforms1 >> gen/adjalletabell.jspwiki
cat tadjforms2 >> gen/adjdicttabell.jspwiki

rm -f tattr*  tsgnom*  tcomp*   tsuperl* tAcc* tIll*

cat t1 | perl -nle 'print scalar reverse $_' > t1rev
cat t2 | perl -nle 'print scalar reverse $_' > t2rev

paste t1rev tadjforms1 | sort | cut -f2 | grep '[A-Za-z]' >> gen/adjalletabellrev.jspwiki
paste t2rev tadjforms2 | sort | cut -f2 | grep '[A-Za-z]' >> gen/adjdicttabellrev.jspwiki

rm -f t?rev* tadjforms*
