In Korp you may perform quite advanced corpus serches.

# Searching with dependency relations

**Task:** You want to search for all sentences with nouns in Illative that have the verb *liikot* as their dependency mother.

**Procedure:** Write the string below into the *CQP search* interface in Korp.

The search string is as follows (here, it is put on 3 lines):

```
a:[msd="N.*.Ill"]
[]{0,10}
b:[lemma="liikot" & msd="V.*"]::a.dephead=b.ref
```

Explanation:

This group of commands 

```
[lemma="liikot" & msd="V.*"]
```

identifies the verb, by giving lemma and part of speech.

```
[]{0,10}
```

this gives zero or more whatever inbetween the two expressions

then the noun, its grammatical specification (singular or plural)
and its dependency relation.

```
[msd="N.*.Ill" & deprel="OBJ"]
```

Then you have to bind these groups to some variable names, 
the syntax is name:expression, as follows:

```
b:BUNDLE
a:BUNDLE
```

then you state the joint condition

```
::a.dephead=b.ref
```

which declares that the dependeny head of a shall be 
the ref value of b. In our context, the dependency
head of the illative noun shall be the value of
the verb *liikot*.
