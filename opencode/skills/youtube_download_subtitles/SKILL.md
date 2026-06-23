---
name: youtube_download_subtitles
description: ALWAYS load this skill when user wants to retrieve subtitles of a youtube video
---

Quand tu dois télécharger les sous-titres d'une vidéo youtube, par exemple quand l'utilisateur a suivi une conférence
et a pris des notes qu'il veut améliorer, dans ce cas utilise l'outil "yt-dlp".
Cet outil est déjà disponible sur l'ordinateur local.

Sample call:
```bash
yt-dlp --write-auto-sub --sub-lang fr --skip-download "https://www.youtube.com/watch?v=w0Da5JtihFA"
```

Résultat de l'éxécution, qui a ici bien fonctionnée :
```
[youtube] Extracting URL: https://www.youtube.com/watch?v=w0Da5JtihFA
[youtube] w0Da5JtihFA: Downloading webpage
[youtube] w0Da5JtihFA: Downloading android vr player API JSON
[youtube] w0Da5JtihFA: Downloading player 69e2a55d-main
[youtube] [jsc:deno] Solving JS challenges using deno
[youtube] w0Da5JtihFA: Downloading m3u8 information
[info] w0Da5JtihFA: Downloading subtitles: fr
[info] w0Da5JtihFA: Downloading 1 format(s): 399+251
[info] Writing video subtitles to: Votre second cerveau IA sans perdre votre âme [w0Da5JtihFA].fr.vtt
WARNING: The extractor specified to use impersonation for this download, but no impersonate target is available. If you encounter errors, then see  https://github.com/yt-dlp/yt-dlp#impersonation  for information on installing the required dependencies
[download] Destination: Votre second cerveau IA sans perdre votre âme [w0Da5JtihFA].fr.vtt
[download] 100% of  361.28KiB in 00:00:00 at 2.17MiB/s
```

Cette commande a créé un fichier vtt.
Voici pour exemple l'extrait du début de ce fichier :

```vtt
WEBVTT
Kind: captions
Language: fr

00:00:00.440 --> 00:00:04.710 align:start position:0%

Bon,<00:00:01.480><c> merci.</c><00:00:02.440><c> Bonjour</c><00:00:02.879><c> et</c><00:00:03.360><c> à</c><00:00:03.600><c> toutes</c><00:00:04.319><c> et</c><00:00:04.56
0><c> à</c>

00:00:04.710 --> 00:00:04.720 align:start position:0%
Bon, merci. Bonjour et à toutes et à


00:00:04.720 --> 00:00:07.030 align:start position:0%
Bon, merci. Bonjour et à toutes et à
tous.<00:00:05.680><c> Merci</c><00:00:05.920><c> d'être</c><00:00:06.240><c> là</c><00:00:06.600><c> pour</c><00:00:06.799><c> cette</c>

00:00:07.030 --> 00:00:07.040 align:start position:0%
tous. Merci d'être là pour cette


00:00:07.040 --> 00:00:09.549 align:start position:0%
tous. Merci d'être là pour cette
session.<00:00:08.320><c> On</c><00:00:08.480><c> va</c><00:00:08.639><c> parler</c><00:00:08.960><c> aujourd'hui</c><00:00:09.360><c> de</c>

00:00:09.549 --> 00:00:09.559 align:start position:0%
session. On va parler aujourd'hui de
...

```

Produire ensuite un fichier txt fusionné en utlisant le script bash de ce skill ./vtt2txt.sh :

```txt
Bon, merci. Bonjour et à toutes et à
tous. Merci d'être là pour cette session.
On va parler aujourd'hui de

``

