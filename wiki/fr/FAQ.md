---
lang: fr
layout: wiki
permalink: /wiki/FAQ
title: FAQ
---

# Jamulus FAQ
 {:.no_toc}

<details markdown="1">

<summary>Table of contents</summary>

* TOC
 {:toc}

</details>

**For common problems and their solutions when using Jamulus, see the [Troubleshooting](/wiki/Client-Troubleshooting) page.**


### Y a-t-il un métronome, une synchronisation ou un autre moyen de rester dans le temps ?

Non. Les musiciens sur un serveur Jamulus jouent simplement en temps réel ensemble comme ils le feraient en personne. Si vous souhaitez disposer d'un signal temporel, il existe des solutions de métronome partagé sur Internet que vous pouvez essayer, mais il est probablement préférable de minimiser la latence afin que personne n'ait un retard global supérieur à environ 30-50 ms.

### Comment puis-je savoir si je peux rejoindre un serveur ? Existe-t-il des règles ?

In general, if somebody sets up a public server they accept that anyone can play on it. Jamulus has no password protection or other authentication mechanisms. However, some servers may state their policies in the welcome message you will see in the chat window.

Vous pouvez également créer un serveur privé sur Jamulus et donner aux autres votre adresse pour qu'ils s'y connectent. Consultez [cette page pour plus d'informations](/wiki/Running-a-Server).

### Pourquoi ne devrais-je pas utiliser un équipement sans fil ?

Votre capacité à jouer en rythme avec les autres musiciens dépend principalement de la latence (retard) de votre signal sonore. Si le retard global est supérieur à 50 ms, il est généralement trop difficile de jouer en rythme, sauf si vous vous entraînez à le faire. Certains musiciens affirment qu'ils peuvent jouer en rythme avec des retards allant jusqu'à 70 ms en jouant en avance sur le rythme. Mais au-delà, cela devient trop difficile, à moins que le synchronisme ne soit pas un facteur important dans la musique.

Il est donc logique de minimiser les sources de retard ou autres problèmes liés au signal. Même le wi-fi rapide est généralement trop variable pour être utilisé pendant de longues périodes avec Jamulus, et les casques et micros Bluetooth introduisent généralement des latences d'environ 50 ms ou plus.

### Pourquoi ne devrais-je pas écouter mon propre signal ?

Pour la même raison que vous devez minimiser le retard de votre signal afin de jouer en temps voulu, vous devez vous assurer que vous jouez sur votre propre son que les autres musiciens entendent. Vous trouverez plus d'informations à ce sujet, ainsi qu'un moyen de tester votre installation pour vous assurer que vous respectez cette "règle d'or" [ici](/wiki/Client-Troubleshooting#vous-avez-tous-un-son-correct-mais-il-est-difficile-de-jouer-ensemble).

Bien sûr, si vous jouez d'un instrument acoustique ou si vous êtes chanteur, il sera difficile d'exclure votre son "local". Mais vous devriez au moins essayer de le faire, par exemple en utilisant un casque fermé, réglé aussi fort que possible pour masquer votre propre son. Vous pourrez ainsi vous concentrer sur le mixage qui vous parvient du serveur.

### Ai-je besoin d'une connexion Internet rapide ?

For most people on standard broadband (e.g. 10 Mbit/s down and 1 Mbit/s up) you will have no problems. For those running servers at home, depending on how many people join, you may encounter issues if your upstream bandwidth is lower than about 5 Mbit/s.

### Dois-je faire tourner un serveur ?

Non. Si vous souhaitez simplement vous connecter aux serveurs d'autres personnes, tout ce dont vous avez besoin est un client. Lisez ceci si vous pensez avoir besoin de [faire tourner votre propre serveur](/wiki/Running-a-Server).

### Comment fonctionne Jamulus (en général) ?

<img src="{{site.url}}/assets/img/fr-screenshots/diagram-overview.png" loading="lazy" alt="Diagramme montrant le fonctionnement de Jamulus">


Jamulus fonctionne sur le principe client-serveur. L'audio de chaque musicien est envoyé à un serveur, où il est mixé et traité. Ensuite, l'audio est renvoyé à chaque client. Si un serveur est rendu public et enregistré sur un répertoire, ses informations seront diffusées à tous les clients.

### Pourquoi Jamulus ne fournit-il pas de support vidéo ?

L'ajout du support vidéo ajoute beaucoup de complexité. Vous pouvez utiliser d'autres logiciels comme Jitsi ou Zoom si vous souhaitez voir les autres lorsque vous jouez (ou avoir un "public"), mais la vidéo sera nettement en retard sur l'audio de Jamulus.


## Server FAQ

### Why do public servers not need port forwarding?

Normally, network address translation (NAT) firewalls prevent incoming requests initiated from outside the local network. Inbound traffic is only possible for packets relating to an outbound request (strictly speaking, “related” and “established” packets to an initial outbound connection). In public server mode, when your Jamulus server connects to a Directory Server it of course initiates an outbound connection. From then on, the Directory Server sends (established/related) connection “pings” (not ICMP pings) to your server at regular intervals to keep the relevant NAT port(s) open on your router/firewall.

However, in private mode, clients have to **initiate** connections into the server’s network. NAT firewalls prevent this, so you need to tell them to allow incoming connection requests on the Jamulus port using port forwarding.


