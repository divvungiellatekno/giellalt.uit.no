Webdict compilation
===================

This text documents the compilation process of the web dictionaries.

*A NOTE OF CAUTION:*

Error messages from the script are misleading. The typical error is to forget the instruction 


# The files

The online files themselves are stored in the relevant *var* catalogue for displaying
online files on *gtweb.uit.no*. They should be identical to the files in*$GTHOME/apps/dicts/apertiumdict/*, so keep the two catalogues in synch. The
*gtweb.uit.no* files are for the net, and the ones in *apps/dicts* are for
offline use.

# The conversion procedure

The files are converted from the original dictionary files,
`$GTHOME/words/dicts/LANG1LANG2/`, via the following procedure:

You need the Apertium dixtools:

1. download it from
 [wiki.apertium.org/wiki/Apertium-dixtools](http://wiki.apertium.org/wiki/Apertium-dixtools),
 and save it somewhere on your machine (outside the GTHOME tree)
1. install it via the following commands:
    1. cd apertium-dixtools/
    1. ant jar
    1. sudo ant install

Then convert the Giellatekno xml format into Apertium xml format
(we assume you stand in `$GTHOME/words/dicts/scripts/`):

(For an example of commands, see below)

## 1. Collect the entries in a single file

Collect all relevant entries in a single file (this script does only that) by typing the following command (where `INPUT_DIR` is `../LANG1LANG2/src/`):

```
java -Xmx2048m -Dfile.encoding=UTF8 net.sf.saxon.Transform -it:main collect-dict-parts.xsl inDir=INPUT_DIR/ > PATH_TO_OUTPUT_FILE
```

Exampla:

```
java -Xmx2048m -Dfile.encoding=UTF8 net.sf.saxon.Transform -it:main \
collect-dict-parts.xsl inDir=../smenob/src/ \
> inndir/smenob.xml
```


Different filters for different language pair are possible/needed. Filtering takes place both in *collect-dict-parts.xsl* and *gtdict2simple-apertiumdix.xsl* so before using these scripts check both your input and the code to assure the output you expect.

## 2. Convert the gt format into the apertium xml format

The output file from last command shall be the INPUT_FILE here, hence called *inndir* in the command above.
    
   **Note that the lines BETWEEN the first line and the <r> node must be deleted from the INPUT_FILE**, otherwise the xsl script declares it "missing".

For the next command may now either give the  `inFile` and `outDir` variables on the command line, or edit them in the file.

The command with variables on the command line:

`java net.sf.saxon.Transform -it:main gtdict2simple-apertiumdix.xsl inFile=FILE.xml outDir=OUT_DIR`

Continuing the above example, we get:

`java net.sf.saxon.Transform -it:main gtdict2simple-apertiumdix.xsl inFile=inndir/smenob.xml outDir=utdir`

For command with edited variables, change tha values for *inFile* and *outDir* and run:

`java -Xmx2048m -Dfile.encoding=UTF8 net.sf.saxon.Transform -it:main gtdict2simple-apertiumdix.xsl`

## 3. Convert the apertium xml format into apertium webdict format

In order to get the autocopletion behaviour of the dictionary (type 2-3 letters) we need the *lr-trie* format. To get this, compile the file using the apertium tools describet above, with this command  (`INPUT_FILE` is last command's output):

`apertium-dixtools dix2trie INPUT_FILE lr LANG1-LANG2-lr-trie.xml`

To continue the *smenob* example, and assuming the Tromsø svn file structure, the command will be:
 
`apertium-dixtools dix2trie utdir/smenob.xml lr ../../../apps/dicts/apertium_dict/dics/sme-nob-lr-trie.xml`

The resulting file should then be copied from the `$GTHOME/apps/dicts/apertiumdict/` catalogue into the relevant catalogue for displaying online files on gtweb.

