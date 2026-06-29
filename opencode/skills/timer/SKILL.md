---
name: timer
description: Load this skill when the user asks to start a timer, countdown, or needs a time-based notification. Launches timers with visual countdown (clock-rs), macOS notifications (terminal-notifier), and audio alerts (say).
---

# Skill: timer

## Description

Ce skill permet de lancer des timers avec affichage visuel et notifications audio/visuelles à la fin.

## Quand utiliser ce skill

Chargez ce skill lorsque l'utilisateur demande :
- de démarrer un timer
- de lancer un compte à rebours
- de chronométrer une activité
- de recevoir une notification après un certain temps

## Outils disponibles

### clock-rs

`clock-rs` est un utilitaire de timer en ligne de commande qui affiche un décompte visuel.

Installation (si nécessaire) :
```bash
cargo install clock-rs
```

Usage :
```bash
clock-rs timer --seconds <secondes> -k
```
Note: -k (pour "kill") est nécessaire pour que rs-clock s'arrête, et que les autres applications s'enchainent.

### terminal-notifier

`terminal-notifier` envoie des notifications macOS natives.

Installation (si nécessaire) :
```bash
brew install terminal-notifier
```

Usage :
```bash
terminal-notifier -message "Message" -title "Titre"
```

### say

`say` est un outil natif macOS pour la synthèse vocale.

Usage :
```bash
say "Message à prononcer"
```

## Méthode de travail

### Lancer un timer dans un nouveau shell wezterm

Pour lancer un timer sans bloquer la session courante, utiliser `wezterm cli spawn` :

```bash
wezterm cli spawn -- bash -c "clock-rs timer --seconds <DURÉE_EN_SECONDES> && terminal-notifier -message '<MESSAGE>' -title '<TITRE>' && say '<MESSAGE_VOCAL>'"
```

**Paramètres à adapter :**
- `<DURÉE_EN_SECONDES>` : durée du timer en secondes (ex: 1800 pour 30 minutes)
- `<MESSAGE>` : message de la notification visuelle
- `<TITRE>` : titre de la notification
- `<MESSAGE_VOCAL>` : message prononcé à voix haute

### Conversions de durée courantes

- 5 minutes = 300 secondes
- 10 minutes = 600 secondes
- 15 minutes = 900 secondes
- 20 minutes = 1200 secondes
- 25 minutes = 1500 secondes (Pomodoro)
- 30 minutes = 1800 secondes
- 45 minutes = 2700 secondes
- 1 heure = 3600 secondes
- 1h30 = 5400 secondes
- 2 heures = 7200 secondes

### Exemples d'utilisation

**Timer de 25 minutes (Pomodoro) :**
```bash
wezterm cli spawn -- bash -c "clock-rs timer --seconds 1500 -k && terminal-notifier -message 'Pomodoro terminé - Prenez une pause !' -title 'Timer Pomodoro' && say 'Pomodoro terminé, prenez une pause'"
```

**Timer de 30 minutes pour lecture de mails :**
```bash
wezterm cli spawn -- bash -c "clock-rs timer --seconds 1800 -k && terminal-notifier -message '30 minutes écoulées - Fin de lecture des mails' -title 'Timer Mails' && say 'Trente minutes écoulées'"
```

**Timer de 5 minutes pour pause café :**
```bash
wezterm cli spawn -- bash -c "clock-rs timer --seconds 300 -k && terminal-notifier -message 'Pause terminée - Retour au travail' -title 'Timer Pause' && say 'Pause terminée'"
```

**Timer de 2 heures pour focus profond :**
```bash
wezterm cli spawn -- bash -c "clock-rs timer --seconds 7200 -k && terminal-notifier -message 'Session de travail terminée' -title 'Timer Focus' && say 'Session de travail terminée'"
```

## Réponse à l'utilisateur

Après avoir lancé le timer, toujours indiquer :
1. La durée configurée
2. L'heure à laquelle le timer sonnera
3. Le type de notification qui sera envoyée
4. Le pane ID wezterm retourné (pour référence)

Exemple de réponse :
```
✅ Timer lancé avec succès !

Le timer de 30 minutes (1800 secondes) tourne dans un nouveau shell wezterm (pane ID: 23).

Vous serez notifié à 15h01 avec :
- L'affichage du décompte via clock-rs pendant les 30 minutes
- Une notification visuelle "30 minutes écoulées - Fin de lecture des mails"
- Une alerte vocale "Trente minutes écoulées"

Bonne lecture de vos mails ! 📧
```

## Limitations

- Nécessite `wezterm` comme terminal
- Nécessite macOS pour `say` et `terminal-notifier`
- L'utilisateur doit avoir installé `clock-rs` et `terminal-notifier`
