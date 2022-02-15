# Lingvistmøte

Til stades: Inga, Maja, Sjur, Thomas

Saker:
* twol og omlyd i sma-adjektiv

# Twol og omlyd i sma-adjektiv

Det finst ca 40 adjektiv med omlyd i SMA. Dei blir i dag koda i LexC, som gjer at dei aller fleste adjektiva får kvart sitt leksikon, og det er ingen abstraksjon over omlyd og bøyingsklasse. Dette er eit forsøk på å sjå om det er mogleg å setja opp eit system som kan gje slik abstrahering.

*  omlyd i ie-stammer
* Umlaut doesn't hold for some ie-stem-verbs vedtedh > *vidtim (but:vedtim)
olution is a lex for these words, without %^iUML for these forms
* oeh -oeh/an

Adjektiv med omlyd:

|   Lemma  | PosAttr | PosPred | PosIll | Comp | Superl
| --- | --- | --- | --- | --- | ---
|  buerie    | ue-ie  |  ue-ie   | ua - an | ue    | öö
|  leevles   | ee-es  |  ee-es   | ee-asse | ie    | öö
|  leevles   | yö-es  |  ee-es   | yö-asse | ie    | öö
|  leevles   | öö-es  |  ee-es   | öö-asse | ie    | öö
|  leevles   | ïe-es  |  ïe-e    | ea-an   | ie    | öö
|  söökes    | öö-es  |  öö-es   | ua-an   | ue    | öö
|  sööjmes   | öö-es  |  öö-es   | ua-an   | öö    | öö
|  sööjmes   | ee-es  |  ee-es   | ua-an   | ue    | ee
|  smaave    | aa-e   |  aa-e    | aa-ese  | aa/ae | aa
|  plaave    | aa-e   |  aa-e    | aa-ese  | aa/ae | aa
|  snaare    | aa-e   |  aa-e    | aa-ese  | aa/ae | aa
|  orre      | o-e    | o-e      | u-ese   | u     | u
|  noere     | oe-e   | oe-e     | oe-se   | ue    | öö
|  stoere    | oe-e   | oe-e     | oe-se   | ue    | öö
|  nåake     | åa-e   | åa-e     | åa-se   | -     | -
|  gïsse     | ï-e    | ï-e      | ï -se   | i     | i
|  gamte     | a-e    | a-e      | a-ese   | a     | a
|  gamte     | a-e    | a-e      | a-ese   | e     | e
|  rïektes   | ïe-es  | ea-oe    | ea-ose  | -     | -
|  kruana    | ua-a   | ua-a     | ua-ese  | ue/åa | ue/åa
|  veelkes   | ee-es  | ee-es    | ea-an   |  ie   | ee
|  veelkes   | ee-es  | ee-es    | ee-sasse|  ie   | ee
|  rööpses   | öö-es  | öö-es    | ua-an   | ue    | öö
|  sneehpes  | ee-es  | ee-es    | e-asse  | ae, ee| ee ? pred: snååhpehke
|  geehpes   | ee-es  | ee-es    | ea-an   | ie    | ee
|  geerve    | ee-e   | ee-e     | ee-se   | ïe    | ee  ?
|  traeptsie | ae-ie  | aa-an    | aa-an   |  -    |  -
|  traeptsie | ea-oeh | aa-an    | aa-an   |  -    |  -
|  saetnies  | ae-ies | aa-an    | aa-an   |  -    |  -
|  suvhtjies | u-ies  | å-an     | å-an    |  -    |  -
|  haerries  | ae-ies | aa-an    | aa-an   |  -    |  -
|  haeltjies | ae-ies | aa-an    | aa-an   |  -    |  -
|  såebries  | åe-ies | åa-an    | åa-an   |  -    |  -
|  pliejhkies| ie-ies | ea-an    | ea-an   |  -    |  -
|  gijmies   | i-ies  | æ-an     | æ-an    |  -    |  -
|  gijmies   | æ-ah   | æ-oen    | æ-an    |  -    |  -
|  gijmies   | æ-as   | æ-a      | æ-an    |  -    |  -
|  gijmies   | æ-oeh  | æ-oe     | æ-an    |  -    |  -
|  gijmies   | æ-oes  | æ-oe     | æ-an    |  -    |  -
|  vilnjies  | i-ies  | æ-an     | æ-an    |  -    |  -
|  njerries  | e-ies  | a-an     | a-an    |  -    |  -
|  skiemtjies| ie-ies | ea-an    | ea-an   |  -    |  -
|  mujvies   | u-ies  | u-ie     | å-an?   |  -    |  -
|  staeries  | ae-ies | aa-an    | aa-an   |  -    |  -
|  hujnies   | u-ies  | å-an     | u-an    |  -    |  -
|  hujnies   | u-ies  | å-oen    | å-oen   |  -    |  -
|  hujnies   | u-ies  | å-an     | a-an    |  -    |  -
|  hujnies   | u-ies  | u-ie     | a-an    |  -    |  -
|  gieries   | ie-ies | ea-hke   | ea-asse | ea-a-kåbpoe | ea-a-kommes
|  båeries   | åe-ies | åe-ies?  | voerese?| åa-a-såbpoe | åa-a-sommes

Problemadjektiv:
|   Lemma  | PosAttr | PosPred | PosIll | Comp | Superl
| --- | --- | --- | --- | --- | ---
|  gïevte ?
|  tjoevkes ?
|  åehpies | åe-ies | åe-ies | - gieries -gearehke, aeblehts -aebliehtadtje | - | -

Mange variablar:
* ikkje berre ie-stammar?
* omlyd frå attr til pred
* omlyd frå positiv til komparativ/superlativ
* valfri omlyd
* ulike sett med attr- og pred-endingar
* gradbøying eller ikkje?
* likestava vs ulikestava

Arbeidet er ikkje ferdig, og vil halda fram seinare.
