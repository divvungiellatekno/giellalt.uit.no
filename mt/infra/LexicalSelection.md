## Guokte vejolaš jorgalusa

1. In cases where more than one translation is ok, remove the less general (or less common) ones
1. You are allowed to leave two translations only in the following case:
    1. You are able to state explicitly when to use one, and when to use the other, e.g.
        1. This verb is translated to X for human subjects but to Y for non-human subjects
        1. This adjective is translated to X when it modifies words for food, but to Y when it does not
        1. ..
    1. In that case, you do the following:
        1. Keep **both** lines
        1. Open the file `apertium-sme-smn.sme-smX.metalrx`, and make a rule.
        1. If the file  `apertium-sme-smn.sme-smX.metalrx` does not exist, use  `apertium-sme-smn.sme-smX.lrx`
        1. Note that if we are not able to formalise the difference, we should just keep one pair.

Omd.

```
    <e><p><l>láhčit<s n="n"/><s n="tv"/></l><r>orniđ<s n="n"/></r></p></e>
    <e><p><l>láhčit<s n="n"/><s n="tv"/></l><r>lääččiđ<s n="n"/></r></p></e>
```

## lrx-fiillaid struktuvra

Sátneválljennjulgadusat čálát dan fiilii: `apertium-sme-smn.sme-smn.metalrx`

Dáppe lea metalrx-fiilla ovdamearka. Default lea *láhčit = orniđ*
(1.0 > 0.5). Jos láhčit-vearbba máŋŋel boahtá `sem_furn`, de mis lea *lääččiđ*
(0.5 + 0.6 = 1.1 > 1.0).

```
  <rule weight="1.0">
    <match lemma="láhčit">
      <select lemma="orniđ"/>
    </match>
  </rule>


  <rule weight="0.5">
    <match lemma="láhčit">
      <select lemma="lääččiđ"/>
    </match>
  </rule>

  <rule weight="0.6">
    <match lemma="láhčit">
      <select lemma="lääččiđ"/>
    </match>
      <or>
        <match tags="n.sem_furn.*"/>
      </or>
  </rule>
```
