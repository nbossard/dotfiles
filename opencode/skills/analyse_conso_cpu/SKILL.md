---
name: analyse_conso_cpu
description: Analyser la consommation CPU et GPU de la machine macOS Apple Silicon. Identifier les processus gourmands en ressources.
---

# Analyse consommation CPU / GPU (macOS Apple Silicon)

## Commandes

### Top processus par CPU
```bash
ps aux -r | head -20
```

### Top processus par mémoire
```bash
ps aux -m | head -20
```

### Monitoring GPU en temps réel (nécessite sudo)
```bash
sudo powermetrics --samplers gpu_power -i 5000 -n 1
```

### Vue complète CPU/GPU/ANE/mémoire (si installé)
```bash
sudo asitop
```

## Piège macOS : WindowServer et Safari

Sur macOS, **Safari** délègue son rendu GPU au processus système **WindowServer** (via WebKit).
Contrairement à Chrome/Obsidian qui ont un processus `Helper (GPU)` visible, Safari n'apparaît pas directement comme consommateur GPU dans `ps`.

Si **WindowServer** consomme beaucoup de CPU/GPU, vérifier en priorité :
1. Safari (onglets lourds, vidéos, animations)
2. Nombre de fenêtres/espaces ouverts
3. Animations système (Dock, Mission Control)

## Notes
- Machine : Apple M3 Pro (6E + 6P + 18 GPU), 36 GB RAM
- `btop` montre le % GPU global mais pas quel processus le consomme
- `ps aux -r` trie par CPU, pas par GPU -- il faut croiser les infos
