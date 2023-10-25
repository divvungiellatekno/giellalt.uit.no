# Problems when adding nouns to the speller

Examples of bugs that behave differently depending on whether nouns are included in the speller or not. The three last cases are not as bad as they look, as those numerals are really nouns. But the top three cases **do not involve nouns at all**, and should behave the same all the time.

|   Classification of issue:		| Examples:									| Bug ID's:		| Without nouns | With nouns
| --- | --- | --- | --- | ---
|  infl num not accepted			| 1983:s, 1992-93:s								| 423,508,644		| good				 | bad
|  non ex words sugg/acc			| viesot, luotkko, suolo, vihttanuppelotčoarvvat| 461,619,803,909	| good				 | bad
|  number cmps dont work (Num+A)	| 10-jahkásačča									| 611,633			| good				 | bad
|  does not recognize nubbelohki	| nubbelohki									| 597				| bad				 | good
|  numeral attr:s on lot			| guoktelot										| 599				| bad				 | good
|  duhát words missing			| ovcciduhát									| 610				| bad				 | good

In one way or another, this looks like a bug in the PLX engine. Tomi will investigate further.
