# carapace specs

Specs YAML de complétion pour des commandes non supportées nativement par carapace-bin.

## Fichiers

| Fichier | Commande | Description |
|---|---|---|
| `git-annex.yaml` | `git-annex` | Complétion complète : sous-commandes, flags, remotes dynamiques |

## Format

```yaml
name: ma-commande
description: description courte

persistentflags:
  --flag: description du flag

commands:
  - name: sous-commande
    description: description
    flags:
      --from=: source remote
    completion:
      flag:
        from: ["$execute(git remote)"]
      positionalany: ["$files"]
```

Documentation : https://carapace-sh.github.io/carapace-spec/
