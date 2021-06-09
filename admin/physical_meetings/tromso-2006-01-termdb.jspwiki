#  TermDB meeting memo

Reorganizing application code

## Query

We skipped the Query module this time, and focused on the editors.

## Editors

Code organisation after refactoring:

```
risten/termedit/          - terminology editors
                xxx.xq    - common files
                xslt/     - common xslt files
                xquery/   - common xquery files
                css/      - common css files
                SD-terms/ - editor scripts/processing specific to the
                            SD-terms collection
                         xxx.xq    - SD-term files
                         xslt/     - SD-term xslt files
                         xquery/   - SD-term xquery files
                         css/      - SD-term css files, overrides
                                     definitions in the common file
                             SD-terms.css
                propnames/ - editor scripts/processing specific to
                             the propnames collection
                         xxx.xq    - propnames files
                         xslt/     - propnames xslt files
                         xquery/   - propnames xquery files
                         css/      - propnames css files
       dictedit/        - dictionary editors (unspecified for the time
                          being, but generally following the layout of
                          the dictionary eXist collections, and the
                          principles for the term editors above)
                xxx.xq  - common files
```

Tasks:
* refactor xquery code (**Tomi**)
* refactor XSLT code (**Saara**)
* try to solve the parallel editing bug (**Sjur**)
* CSS refactoring (**Børre**)
* rewrite the editor front page, such that it only contains a collection selector (listing
  only collections writable for the user), and moves to the real search interface when
  the collection has been selected

NB!!! Please ASK if you don't understand the code!!!

## Code cleanup

Tasks:
* agree on a standard HTML (final form - variations in presentation moved to CSS,
  variations in content/structure included in the output moved to collection-specific XSLT)
* agree on a standard basic XML structure for all term collections
* define the basic queries we want to perform
