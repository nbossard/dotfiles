# README

Firefox config file (`user.js`).

## Structure

| Fichier                | Rôle                                                        |
| ---------------------- | ----------------------------------------------------------- |
| `homepage_urls.txt`    | Liste des URLs de la page d'accueil, une par ligne          |
| `user.js.template`     | Template du fichier `user.js` avec placeholder `%%HOMEPAGE%%` |
| `Makefile`             | Génère `user.js` à partir des deux fichiers ci-dessus       |
| `user.js`              | **Fichier généré** — ne pas éditer manuellement             |

## Workflow

### Modifier les URLs de la page d'accueil

Editer `homepage_urls.txt` : une URL par ligne, les lignes commençant par `#` sont des commentaires.

Puis régénérer `user.js` :

```bash
make
```

### Installer (créer le symlink vers le profil Firefox)

```bash
make install
```

Crée un symlink depuis le profil Firefox actif (`dtihh7z6.default-release`) vers `user.js`.

### Nettoyer les fichiers intermédiaires et user.js

```bash
make clean
```
