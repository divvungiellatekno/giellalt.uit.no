# Meeting with Brendan 27.3.2025

Anders, Brendan, Børre, Flammie, Sjur

Tasks in priority order:

- finish TTS (project contract):
    - API server __DONE__
    - mobile
- fix grammar checker server (se, nb, ga) (maintenance contract) __DONE__
    - update server
- API server (maintenance): <api-giellalt.uit.no>
    - ASR server
    - hyphenation
    - documentation __DONE__
    - dictionaries
    - MT
- Infra/CI/CD:
    - kill Taskcluster (free project)
    - make API server get updates from Páhkat automatically (maintenance?)
    - allow for nightly/dev channel alternative in API server (maintenance?)
    - CI like setup for corpus
- Borealium:
    - update deps
    - fix issues
    - speller/grammar/hyphenation/etc text box ("apps", like TTS)
- ARM for Windows
- hyphenation for Adobe stuff
- finish grammar checker integration (project contract):
    - MS Word
    - command line tool (testing, debugging) (possibly maintenance contract)
- Erzya/Moksha/Kildin:
    - make sure everything works in Windows 10 AND 11
    - also Plains Cree
- Divvun Manager improvements (maintenance/new project?):
    - one-click installer for macOS
    - more robust user experience
    - use Pontoon for localisation
- improve divvunspell (new project):
    - tunable position weights
    - better (integrated) support tools for debugging and testing
- improve mobile keyboards (new project):
    - next morpheme prediction
    - next word prediction
    - word completion
    - faster and smoother (better feel)
    - dictation (cf API server / ASR below)
    - self learning error correction model

Medium/long-term whish list:

- hfst-pmatch/tokeniser rewrite in Rust

## Follow-up

- meeting with Anders, Brendan, Børre: API server continuation
- Zulip
- GH Issues
