# carapace

Configuration personnalisée pour [carapace](https://carapace-sh.github.io/carapace-bin/), le moteur de complétion multi-shell.

## Structure

```
carapace/
└── specs/          # Specs YAML de complétion pour des commandes non supportées nativement
```

## Lien symbolique requis

Le dossier `specs/` doit être lié vers le répertoire de config carapace :

```zsh
ln -s ~/dotfiles/carapace/specs "$HOME/Library/Application Support/carapace/specs"
```

## Ajouter un nouveau spec

Créer un fichier `nom-commande.yaml` dans `specs/`. Il sera chargé automatiquement par carapace.

Documentation du format : https://carapace-sh.github.io/carapace-spec/
