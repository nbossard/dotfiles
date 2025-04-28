# Rôles

Ici ce sont les rôles que j'ai définis pour "Aichat".
Voir la référence : <https://github.com/sigoden/aichat/wiki/Role-Guide>.

A ne pas confondre avec les agents, voir pour cela le clone perso du repo llm-functions.

## Rôles pour les git hooks

cf [analyse_commit](analyse_commit.md)

### Mise en place

Modifier votre fichier ".git/hooks/pre-commit" et ajoutez:

```bash
## IA check
git diff --staged -U10 | aichat -r analyse_commit
```

## Rôles pour les linters

Ce sont les fichiers nommés "linter*.md"

### Mise en place

#### Sous VSCODE

TODO

#### Sous Vim ou Neovim

S'appuie sur le plugin vim ALE (Asynchronous Lint Engine).
Aller dans le dossier de ALE sous dossier ale_linters et créer un fichier "aichatnicolinter"

```lua
" Author: nicolas BOSSARD
" Description: lint using aichat
" rappel:
" %s ==> filename
" %e ==> executable
" %t ==> temporary file

call ale#linter#Define('javascript', {
\   'name': 'aichatnicolinter',
\   'executable': 'aichat',
\   'command': 'cat %t > /dev/null 2>&1 && (echo "FILENAME=%s" && cat -n %s) | %e --role linter_js',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})

```
