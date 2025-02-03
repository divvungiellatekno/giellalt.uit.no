# Closed github repo bot access

## What?

Private repositories in the `giellalt` organization cannot be cloned or pulled
by an anonymous user using the `git clone https://github.com/giellalt/REPO`
address.

We have automated processes running on servers that need access to private 
repositories. Closed dictionaries, corpora, etc. This also goes for scripts
running on Azure, or as part of a github action, etc. In this document, all
such automated use, is called **bots**.

In order for our **bots** to be able to access these repos, we have a git
config setting that replaces the https-address of the remote with a string
that contains the **Personal Access Token**, which gives access to the
repositories.


## Personal Access Token

Getting the Personal Access Token is done as demonstrated in the guide at
https://github.blog/security/application-security/introducing-fine-grained-personal-access-tokens-for-github/

Which is this site: https://github.com/settings/personal-access-tokens/new

Remember to set the **Resource Owner** to the organization that contains the
repositories needed by the bot - usually _giellalt_.


## The setting

The command to run to set the config in git is:

    git config --global url."https://token:github_pat_XXXXXXXXXXXXXX@github.com/giellalt".insteadOf "https://github.com/giellalt"

Where `XXXXXXXX` is replaced by the actual token, of course.


## Resources

- https://coolaj86.com/articles/vanilla-devops-git-credentials-cheatsheet/
- https://coolaj86.com/articles/vanilla-devops-git-credentials-ultimate-guide/
- https://stackoverflow.com/questions/35942754/how-can-i-save-username-and-password-in-git
- https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables
- https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage

