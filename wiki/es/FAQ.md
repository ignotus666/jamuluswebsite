---
lang: es
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


### ¿Hay un metrónomo, sincronización o alguna otra manera de mantener el tiempo?

No. Los usuarios de un servidor Jamulus simplemente tocan juntos en tiempo real como si estuvieran en persona. Si quieres una señal de tiempo, entonces hay soluciones de metrónomos compartidos en Internet que puedes probar, pero probablemente sea mejor minimizar la latencia para que nadie tenga un retardo total de más de unos 30-50 ms.

### ¿Cómo sé si puedo unirme a un servidor? ¿Hay normas?

In general, if somebody sets up a public server they accept that anyone can play on it. Jamulus has no password protection or other authentication mechanisms. However, some servers may state their policies in the welcome message you will see in the chat window.

También puedes montar un servidor privado en Jamulus y dar tu dirección a otras personas para que se conecten. Echa un vistazo a [esta página para más información](/wiki/Running-a-Server).

### ¿Por qué no debería utilizar dispositivos inalámbricos?

El que puedas o no tocar manteniendo el tiempo con otras personas depende principalmente de cuánta latencia (retardo) tienes en tu señal de audio. En general, un retardo total mayor de 50 ms hace que sea difícil tocar en sincronización a menos que entrenes para hacerlo. Algunos músicos dicen que pueden tocar sincronizados con retardos de hasta 70 ms, tocando por delante del ritmo. Pero mucho más que eso se vuelve demasiado difícil, a menos que la sincronización no sea un factor importante para la música.

Por tanto tiene sentido minimizar cualquier fuente de retardo u otros problemas con la señal. Inluso la Wi-Fi rápida suele ser demasiado variable para usarla durante periodos largos con Jamulus, y los auriculares y micrófonos Bluetooth suelen introducir latencias de hasta 50 ms o más.

### ¿Por qué no debería escuchar mi propia señal?

Por la misma razón por la que necesitas minimizar el retardo de tu señal para tocar en sincronización, tienes que asegurarte de que tocas escuchando el audio que oyen los demás. Para más información sobre esto, y modos de probar tu configuración para asegurarte de que obedeces la “Regla de Oro” [ver aquí](/wiki/Client-Troubleshooting#todos-suenan-bien-pero-es-difícil-tocar-todos-juntos-manteniendo-el-tiempo).

Por supuesto, si tocas un instrumento acústico o cantas, va a ser difícil excluir tu sonido "local". Pero debes al menos intentar hacerlo, por ejemplo utilizando auriculares cerrados con el volumen subido para tapar tu propio sonido. Esto te permitirá concentrarte en la mezcla que vuelve del servidor.

### ¿Necesito una conexión rápida de Internet?

For most people on standard broadband (e.g. 10 Mbit/s down and 1 Mbit/s up) you will have no problems. For those running servers at home, depending on how many people join, you may encounter issues if your upstream bandwidth is lower than about 5 Mbit/s.

### ¿Necesito ejecutar un servidor?

No. Si solo tienes intención de conectarte a los servidores de otros, lo único que necesitas es un cliente. [Lee esto si crees que debes ejecutar tu propio servidor](/wiki/Running-a-Server).

¿Cómo funciona Jamulus (en general)?

<img src="{{site.url}}/assets/img/es-screenshots/diagram-overview.png" loading="lazy" alt="Diagrama mostrando cómo funciona Jamulus">


Jamulus funciona bajo el principio del cliente/servidor. El audio de todos se envía a un servidor, donde se procesa. Después, el audio se envía de vuelta a cada cliente. Si un servidor es público y está registrado en un servidor de directorio, su información será emitida a todos los clientes.

### ¿Por qué Jamulus no ofrece soporte para vídeo?

El soporte para vídeo añade mucha complejidad. Puedes utilizar otro software como Jitsi o Zoom si quieres ver a otros mientras tocas (o para tener un "público"), pero el vídeo irá bastante por detrás del audio de Jamulus.


## Server FAQ

### Why do public servers not need port forwarding?

Normally, network address translation (NAT) firewalls prevent incoming requests initiated from outside the local network. Inbound traffic is only possible for packets relating to an outbound request (strictly speaking, “related” and “established” packets to an initial outbound connection). In public server mode, when your Jamulus server connects to a Directory Server it of course initiates an outbound connection. From then on, the Directory Server sends (established/related) connection “pings” (not ICMP pings) to your server at regular intervals to keep the relevant NAT port(s) open on your router/firewall.

However, in private mode, clients have to **initiate** connections into the server’s network. NAT firewalls prevent this, so you need to tell them to allow incoming connection requests on the Jamulus port using port forwarding.


