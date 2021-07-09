---
lang: es
layout: wiki
permalink: /wiki/Software-Manual
title: 'Manual del Software'
---
# Manual de Usuario de Jamulus
 {:.no_toc}

Este manual documenta la aplicación del cliente de Jamulus para su uso por parte de músicos y cantantes para utilizar el software con el fin de conectarse a un servidor.

<details markdown="1">

<summary>Tabla de contenidos</summary>

* TOC
 {:toc}

</details>

# Ventana Principal


<figure>
	<img src="{{site.url}}/assets/img/es-screenshots/main-screen-medium.png" style="border: 5px solid grey;" loading="lazy" alt="Image of the Jamulus main window">
	<figcaption>Tu mezcla local cuando te conectas a un Servidor</figcaption>
</figure>

## LEDs de retardo y buffer

**Retardo** muestra el estado de la latencia de audio actual:

<figure><img src="{{site.url}}/assets/img/es-screenshots/led-green.png" style="float:left; margin-right:10px;" loading="lazy" alt="Imagen del símbolo de un LED verde"></figure>

**Verde** - El retardo es perfecto para una jam session

<figure><img src="{{site.url}}/assets/img/es-screenshots/led-yellow.png" style="float:left; margin-right:10px;" loading="lazy" alt="Imagen del símbolo de un LED amarillo"></figure>

**Amarillo** - Una sesión aún es posible pero quizá sea más difícil tocar

<figure><img src="{{site.url}}/assets/img/es-screenshots/led-red.png" style="float:left; margin-right:10px; clear: both;" loading="lazy" alt="Imagen del símbolo de un LED rojo"></figure>

**Rojo** - El retardo es demasiado grande para tocar

**Buffers** muestra el estado actual del flujo de audio. Si está **rojo**, hay interrupciones en el flujo de audio. Esto puede ser causado por alguno de los siguientes problemas:

- El jitter buffer de red no es lo suficientemente grande para el jitter actual de la red/interfaz de audio.
- El retardo de buffer de la tarjeta de audio (tamaño buffer) tiene un valor demasiado bajo (ver ventana de Configuración).
- La tasa de subida o bajada is demasiado alta para tu ancho de banda de internet.
- La CPU del cliente o del servidor está al 100%.


## Entrada

Shows the level of the two stereo channels for your audio input. Make sure not to clip the input signal to avoid distortions of your sound (the LEDs will indicate clipping when it occurs).

## Botón de Silenciarme Yo

Corta tu flujo de audio al servidor de modo que te escucharás y verás tus propios niveles de audio, pero otros músicos no. Ten en cuenta que otros músicos no sabrán si te has silenciado.

## Efecto Reverb

Adds reverb to your local mono audio channel, or to both channels in stereo mode. The mono channel selection and the reverberation level can be modified. For example, if a microphone signal is fed in to the right audio channel of the sound card and a reverb effect needs to be applied, set the channel selector to the right and move the fader upwards until the desired reverb level is reached.


## Chat

Opens the chat window. Text entered is sent to all connected clients. If a new chat message arrives and the Chat dialogue is not already open, it will open automatically for all clients.

## Botón Conexión/Desconexión

Opens a dialogue where you can select a server to connect to. If you are connected, pressing this button will end the session.

<figure><img src="{{site.url}}/assets/img/es-screenshots/connection-setup-window.png" style="border: 5px solid grey;" loading="lazy" alt="Imagen de la ventana de conexión del servidor"></figure>

La ventana de Configuración de Conexión muestra una lista de servidores disponibles junto con el número de usuarios conectados y el número máximo de los mismos soportado. Los operadores de servidores los registran en listas (mayormente definidas por género, aunque algunas pueden referirse a ubicación o a todos los géneros). Utiliza el menú desplegable de Lista para elegir un género, haz clic sobre el servidor al que te quieres unir y otra vez sobre el botón de Conectar para conectarte. También puedes hacer doble clic sobre el nombre del servidor. Los servidores permanentes (aquellos que llevan más de 24 horas en la lista) se muestran en negrita.

Puedes filtrar la lista por nombre de servidor o ubicación. Para solo mostrar los servidores ocupados, escribe el caracter "#".

Si conoces la dirección IP o URL de un servidor, puedes conectarte a él utilizando el campo de Nombre/Dirección del Servidor. Se puede añadir un número de puerto opcional tras la dirección IP o URL utilizando dos puntos como separador, por ej. `jamulus.ejemplo.org:22124`. El campo también mostrará una lista de los servidores utilizados recientemente.

## Mezclador de audio del servidor

<figure><img src="{{site.url}}/assets/img/es-screenshots/mixer-channles.png" style="float:left; margin-right:10px; margin-bottom:20px; border: 5px solid grey;" loading="lazy" alt="Imagen de un par de controles del mezclador de audio del servidor"></figure>

La ventana del mezclador de audio muestra a cada usuario conectado al servidor (incluyéndote a ti). Los faders te permiten ajustar el nivel de lo que escuchas sin afectar a lo que escuchan los demás.

El vúmetro muestra el nivel de entrada en el servidor - esto es, el sonido enviado.

Si has configurado tu Canal de Audio a Estéreo o Salida Estéreo en tu Configuración, también verás un control de paneo (shift-clic para resetearlo).

Si ves un icono de "mute" sobre un usuario, significa que esa persona no puede escucharte. Puede que te hayan silenciado, aplicado 'solo' a uno o más usuarios sin incluirte a ti, o han bajado tu fader en su mezcla a cero.

### Grp button

Defines a group of audio channels. Moving the fader of one member of the group moves the faders of all the others Up to 8 groups can be defined.

### Mute button

Prevents users being heard in your local mix. Be aware that when you mute someone, they will see a "muted" icon above your fader to indicate that you cannot hear them. Note also that you will continue to see their VU meters moving if sound from the muted user is reaching the server. Your fader position for them is also unaffected.

Note that muting your **own** channel simply means you will not hear your signal from the server (and is not advised as it can lead to you becoming out of time with other players). This is therefore not the same as using "[Mute Myself](#mute-myself-button)".

### Solo button

Allows you to hear one or more users on their own. Those not soloed will be muted. Note also that those people who are not soloed will see a "muted" icon above your fader.

Los usuarios se muestran de izquierda a derecha en el orden en el que se conectan. Puedes cambiar el orden utilizando la opción Editar en el menú de la aplicación.

Puedes agrupar faders utilizando el botón de "grupo". Si mueves el fader de cualquier miembro del grupo, los demás faders del grupo también se moverán en la misma proporción. Puedes aislar un canal del grupo temporalmente con shift-clic-arrastrar.

Si el operador del servidor ha habilitado la grabación, verás un mensaje sobre el mezclador indicando que estás siendo grabado.




# Configuración

## Mi Perfil

Desde el menú de Ver, selecciona "Mi Perfil..." para establecer tu Alias/Nombre, mostrado debajo de tu fader en la ventana principal del cliente de Jamulus.

<figure><img src="{{site.url}}/assets/img/es-screenshots/settings-profile.png" style="border: 5px solid grey;" loading="lazy" alt="Imagen de la ventana de perfil"></figure>

Si se establece un instrumento y/o un país, los iconos de estas selecciones también se mostrarán bajo tu fader. El nivel de habilidad cambia el color de fondo de la etiqueta del fader y la ciudad se muestra en el tooltip de la etiqueta:

<figure><img src="{{site.url}}/assets/img/es-screenshots/profile-tooltip.png" style="width:30%;" loading="lazy" alt="Imagen de un tooltip mostrando información del perfil"></figure>


### Skin

Esto aplicará un skin a la ventana principal, algunos de los cuales están diseñados para acomodar conjuntos grandes de usuarios.

### Filas de canales en el mezclador

Esto establece el número de filas mostrado en el mezclador de audio, para su uso con conjuntos grandes.


## Configuración Audio/Red

<figure><img src="{{site.url}}/assets/img/es-screenshots/settings-network.png" style="border: 5px solid grey;" loading="lazy" alt="Imagen de la ventana de perfil"></figure>

### Dispositivo

En el sistema operativo de Windows, el driver ASIO (tarjeta de sonido) se puede seleccionar utilizando Jamulus. Si el driver ASIO no es válido se mostrará un mensaje de error y el anterior driver válido será seleccionado. En macOS, se puede seleccionar el hardware de entrada y salida.

### Mapeo canales entrada/salida

<figure><img src="{{site.url}}/assets/img/es-screenshots/channel-mapping.png" style="float:left; margin-right:10px; margin-bottom:20px;" loading="lazy" alt="Imagen del mapeo de canales de entrada y salida"></figure>

Si el dispositivo de audio ofrece más de un canal de entrada o salida, son visibles las configuraciones para el _Mapeo de Canales de Entrada y de Salida_. Para cada canal de entrada/salida (canal Izquierdo y Derecho) de Jamulus se puede seleccionar un canal diferente de la tarjeta de audio.


### Canales de Audio

Selects the number of audio channels to be used for communication between client and server.

**Note**: It is preferable to run separate client instances per voice/instrument, with each client given its own ini file, rather than using this built-in mono pair to stereo mixer.

There are three modes available:

Los modos **Mono** y **Estéreo** utilizan uno y dos canales de audio respectivamente.

**Entrada-mono/Salida-estéreo**: La señal de audio enviada al servidor es mono pero la señal que vuelve es estéreo. Esto es útil si la tarjeta de audio tiene un instrumento en un canal de entrada y un micrófono en el otro. En ese caso las dos señales de entrada pueden combinarse en un canal mono pero la mezcla del servidor se escucha en estéreo.

Activar el modo estéreo aumentará la tasa de envío de datos. Asegúrate de que la tasa de subida no excede el ancho de banda disponible en tu conexión a internet.

En el caso del modo estéreo, no estará disponible la selección de canal para el efecto de reverb en la ventana principal puesto que en este caso el efecto se aplicará a ambos canales.

### Calidad del Audio

Cuanto mayor la calidad del audio, mayor la tasa de subida del audio. Asegúrate de que tu tasa de subida no excede el ancho de banda de tu conexión a Internet.

### Retardo del Buffer

El retardo del buffer es un parámetro fundamental en Jamulus. Este parámetro tiene un impacto sobre muchas propiedades de la conexión. Hay soporte para tres tamaños de buffer:

- **64 samples** Provides the lowest latency but does not work with all sound cards.
- **128 samples** The preferred setting. Should work for most available sound cards.
- **256 muestras** Solo debería usarse con un ordenador muy lento o con una conexión a internet muy lenta.

Algunos drivers de tarjetas de audio no permiten cambiar el retardo de buffer desde dentro de Jamulus. En este caso la configuración del retardo de buffer se deshabilita y hay que cambiarlo utilizando el driver de la tarjeta de sonido. En Windows, pulsa el botón de Configuración ASIO para acceder al panel de configuración.

En Linux, utiliza la herramienta de configuración de JACK para cambiar el tamaño del buffer.

El retardo del buffer tiene un impacto en el estado de la conexión, la tasa de subida y el retardo total. Cuanto menor sea el buffer, mayor la probabilidad de que el indicador de estado esté en rojo (caídas de audio), mayor la tasa de subida y menor el retardo total.

Por tanto la configuración del buffer es un compromiso entre calidad de audio y retardo total.



### Jitter Buffer

El jitter buffer compensa el jitter de la red y la tarjeta de sonido. El tamaño de este buffer tiene por tanto un impacto sobre la calidad del flujo de audio (el número de caídas de la señal) y el retardo total (a mayor buffer, mayor retardo).

El tamaño del jitter buffer se puede establecer manualmente para el cliente local y para el servidor remoto. Para el jitter buffer local, las caídas del flujo de audio se indican mediante la luz debajo de los faders del jitter buffer. Si la luz se vuelve roja, significa que ha habido una interrupción del flujo de audio.

Por tanto la configuración del jitter buffer es un compromiso entre calidad y retardo total.

Si se activa la casilla de Auto, los jitter buffers del cliente local y del servidor remoto se configuran automáticamente basándose en mediciones del jitter de la red y la tarjeta de audio. Si se activa esta opción, los faders quedan deshabilitados (no pueden moverse con el ratón).

### Activar Buffers Red Pequeños

Permite soporte para paquetes de audio por red muy reducidos. Solo se utilizan si el retardo del buffer de la tarjeta de audio es menor de 128 muestras. Cuanto menores los buffers de red, menor la latencia de audio. Pero al mismo tiempo, aumenta la carga de red y la probabilidad de caídas de audio también aumenta.

### Mediciones

El Ping es el tiempo que requiere el flujo de audio para viajar desde el cliente al servidor y volver. Este retardo lo determina la red y debería ser de unos 20-30 ms. Cuando este retardo es mayor de unos 50 ms, empieza a ser más notable y te puedes encontrar con que es más difícil mantener la sincronización con los demás, aunque sigue siendo posible cuando te acostumbras. Los factores como el tempo, el instrumento utilizado o el aislamiento de los auriculares pueden tener un impacto en el retardo con el que te manejas. Las causas más probables de un retardo alto son que la distancia al servidor es demasiado grande o que tu conexión a internet no es óptima.

El retardo total se calcula con el ping y el retardo ocasionado por la configuración de buffers.

La Tasa de Subida de Audio depende del tamaño actual de los paquetes de audio y la configuración de compresión de audio. Asegúrate de que la tasa de subida no es mayor que la velocidad de subida disponible (comprueba la tasa de subida de tu conexión a internet, por ejemplo con [librespeed.org](https://librespeed.org/).

## Configuración Avanzada

<figure><img src="{{site.url}}/assets/img/es-screenshots/settings-advanced.png" style="border: 5px solid grey;" loading="lazy" alt="Imagen de la ventana de perfil"></figure>

### Dirección personalizada de servidor de directorio

Deja esto en blanco a menos que necesites escribir la dirección de un servidor de directorio distinto a los que hay por defecto.

### Nivel cliente nuevo

Este ajuste define el nivel del fader de una nueva conexión de cliente, en porcentaje. Si se conecta un nuevo usuario al servidor actual, el nivel inicial de su fader tomará este valor si no se ha especificado anteriormente un valor para ese usuario de una conexión anterior. Puedes establecer en este nivel a todos los usuarios en un servidor ocupado con Editar > "Poner Todos Faders a Nivel Cliente Nuevo".

### Aumento de Entrada

Aumenta la ganancia de tu dispositivo. Utiliza esto si tu dispositivo no entrega suficiente ganancia para Jamulus.

### Protección contra Retroalimentación

Attempts to detect audio feedback loops or loud noise in the first three seconds after you connected to a server. Once detected, this feature will show a message and activate the "Mute Myself" button to mute you in your own mix.

### Balance de Entrada

Controla los niveles relativos de los canales locales de audio derecho e izquierdo. Para una señal mono actúa como paneo entre los dos canales. Por ejemplo, si se conecta un micrófono al canal derecho y un instrumento al izquierdo que suena mucho más alto que el micrófono, mueve el fader para aumentar el volumen relativo del micrófono.

# Menu commands

### File > Load/Save Mixer Channels Setup
 
You can save and restore the mix you have for your band rehearsals (fader, mute, pan, solo etc.) and load these any time (even while you are playing). Loading can also be done by drag/drop to the mixer window.


### Edit > Auto-Adjust All Faders

Applies a one-off fader setting to each channel depending on its volume. Useful for large ensembles to get a reasonable overall mix, although individual adjustments might still be necessary. Best applied during a warm-up or a uniform part of the music piece.

# Command Line Options

Most common functions in Jamulus can be set using the GUI, but these and others can also be set using options given in a terminal window. Exactly how you do this will depend on your operating system.

For example on Windows, to use a specific settings file, right-click on the Jamulus shortcut and choose "Properties" > Target. Add the necessary arguments to Jamulus.exe:

```shell
 "C:\Program Files\Jamulus\Jamulus.exe" --inifile "C:\path\to\myinifile.ini"
```

For macOS, start a Terminal window and run Jamulus with the desired options like this:

```shell
 /Applications/Jamulus.app/Contents/MacOS/Jamulus --inifile "/path/to/myinifile.ini"
```

**Note**: Command-line options will not alter settings made in the GUI. 

- `-M` or `--mutestream`  Starts Jamulus in muted state                                                      
- `--mutemyown`  Mute me in my personal mix ("headless" mode only)                                                      
-  `-c` or `--connect`  Connect to given server address on startup, format `address[:port]`  
-  `-j` or `--nojackconnect`  Disable auto JACK connections  
-  `--ctrlmidich`  MIDI controller channel to listen on, control number offset and consecutive CC numbers (channels). Format: `channel[;f*][;p*][;s*][;m*]` See [Tips & Tricks](Tips-Tricks-More#using-ctrlmidich-for-midi-controllers) 
- `--clientname`  Window title and JACK client name 
  {% include_relative Shared-Commands.md %}

