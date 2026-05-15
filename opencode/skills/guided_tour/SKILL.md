---
name: guided_tour
description: Load this tol when user asks for a guided tour of the source code of an application.
---

Crée un tour guidé interactif du code source de ce projet en markdown.
Ce tour guidé sera visible dans l'application "obsidian".

Commence le fichier par un disclaimer similaire à celui-ci:
```markdowns
> [!warning]
> Génération par IA.
> Ce guided tour a été généré par IA, le 2026-05-13 avec Opencode et le skill "guided_tour"

```

Le nom par défaut du fichier à créer qui contiendra le tour guidé est GUIDED_TOUR.md à la racine du projet.

## Précisions sur la fraicheur des versions

Dans la section "Architecture technique" en plus de les lister et de donner leur numéro de version, ajoute pour chaque composant la date de sortie de cette version et compare ce numéro de version avec la dernière version disponible.

## liens

### Format des liens externes

Inclue des liens vers le code vers les bons fichiers aux bonnes lignes dans vscode. Les liens dans obsidian ressemblent à ça : [**api/main.py:1**](vscode://file/home/kvtj8816/MesDevs/llm/gtia-fps/asgard/src/asgard/api/main.py:1)
### Format des liens internes au projet

Si tu dois faire un lien du document principal de guided tour vers un autre fichier du projet utilise des liens au format markdown traditionnel, pas un wikilink.
Exemple CORRECT :
```markdown
[express](./doc/express.js)
```
Exemple INCORRECT :
```markdown
[[express]]
```
### Format des liens internes au document

Voici un exemple de lien interne au document valide, c'est à dire supporté par obsidian, note les espaces qui sont des %20 et les icones nécessaires aussi dans les liens:

```txt
## 📋 Table des matières

1. [🏗️ Vue d'ensemble du projet](#🏗️%20Vue%20d'ensemble%20du%20projet)
2. [🚀 Point d'entrée - L'application](#🚀%20Point%20d'entrée%20-%20L'application)

---

## 🏗️ Vue d'ensemble du projet

lorem ipsum


---

## 🚀 Point d'entrée - L'application

sin dolores


```


## Code mort

Lorsque tu décris une partie du programme, vérifie qu'il ne s'agit pas de "code mort", c'est à dire inusité. Si c'est le cas alors soit minimaliste sur leur description et précise qu'il s'agit de code mort.

## librairies externes

Lorsque le code repose sur des librairies externes, même traditionnelles, ne considère pas que l'utilisateur les connait.
Suis la procédure suivante :
- Vérifie d'abord dans la description du projet s'il y a un document qui les décrit, dans ce cas crée un lien vers ce document.
    Par exemple si le projet utilise le web framework "express" et qu'il y a un dossier "doc" avec un document "express.md" crée un ou des liens vers ce document
- S'il n'existe pas demande à l'utilisateur s'il les connait et s'il souhaite que tu les crées

Si tu crées ces documents externes entièrement, ajoute le disclaimer "généré par IA" décrit ci-dessus.

## test

Lorsque tu décris la partie test donne des métriques sur la couverture de test.
