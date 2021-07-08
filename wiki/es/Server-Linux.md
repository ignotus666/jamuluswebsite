---
lang: es
layout: wiki
permalink: /wiki/Server-Linux
title: 'Headless Linux Server Installation'
---

{% include breadcrumb.html root="More" branch1="Server Administration" branch1-url="Running-a-Server" %}

# Running a Headless Server

The following is for running Jamulus as a "pure" server on **hardware without audio** (e.g. on a 3rd party/cloud host) and assumes Ubuntu/Debian distributions using systemd.

If you want to run a server on a Raspberry Pi, you will need to [compile from source](https://github.com/jamulussoftware/jamulus/blob/master/COMPILING.md). See also this [guide for Raspberry Pi](/kb/2020/03/28/Server-Rpi.html) maintained by Jamulus user fredsiva.

1. Descarga el [último archivo .deb para headless]({{ site.download_root_link }}{{ site.download_file_names.deb-headless }})
1. Actualiza apt para asegurarte de que tienes la lista actual de paquetes estándares: `sudo apt update`
1. Instala el paquete de Jamulus: `sudo apt install ./{{ site.download_file_names.deb-headless }}`
1. Habilita el servidor 'headless' con systemd: `sudo systemctl enable jamulus-headless`
1. Add your desired [command line options](Running-a-Server#command-line-options) to the `ExecStart` line in the systemd service file in `/lib/systemd/system/jamulus-headless.service` (By default you will be running a private server).
1. Vuelve a cargar los archivos de sistemd `sudo systemctl daemon-reload` y reinicia el servidor "headless": `sudo systemctl restart jamulus-headless`
1. Check all is well with `systemctl status jamulus-headless` (hit `q` to get back to the command prompt).

You may also be interested in downloading [this set of useful tools](https://github.com/jamulussoftware/jamulus/tree/master/tools) from the Jamulus repository (clone the Git repo and also call `git submodule update --init`).

## Notas

You can control Jamulus with the `systemctl` command. For example, to stop the server cleanly:

`sudo systemctl stop jamulus-headless`

### Running in public mode

The following minimum setup is required to [run a public server](Running-a-Server#server-types):

~~~
jamulus --nogui --server \
        --directoryserver genreServer:port \
        --serverinfo "yourServerName;yourCity;[country ID]"
~~~

**Note**: Semicolon and newline characters are not allowed in `--serverinfo`

Set your Directory (genre) server using the `--directoryserver` (`-e`) option as follows:


| Genre |   Server address           |
|-----------|------------------|
|**Any Genre 1** |`anygenre1.jamulus.io:22124`|
|**Any Genre 2** |`anygenre2.jamulus.io:22224`|
|**Any Genre 3** |`anygenre3.jamulus.io:22624`|
|**Genre Rock** |`rock.jamulus.io:22424`|
|**Genre Jazz** |`jazz.jamulus.io:22324`|
|**Genre Classical/Folk** |`classical.jamulus.io:22524`|
|**Genre Choral/Barbershop** |`choral.jamulus.io:22724`|

### Ver los Registros

Jamulus will log to the system log file if you left the `StandardOutput=journal` setting in the unit file.

Para ver el registro, utiliza `journalctl` (para salir pulsa Ctrl-C). Por ejemplo, para leer el archivo de registro del sistema, filtrado para el servicio Jamulus:

`journalctl -f -u jamulus-headless`


### Actualización

Para actualizar tu servidor a una versión nueva, simplemente descarga el nuevo archivo .deb y reinstala como en el paso 3.

### Grabación

When using the recording function with the `-R` command line option, if the server receives a SIGUSR1 signal during a re cording, it will start a new recording in a new directory. SIGUSR2 will toggle recording enabled on/off.

To send these signals using systemd, create the following two `.service` files in `/etc/systemd/system`, calling them something appropriate (e.g. `newRecording-Jamulus-serv er.service`).

**Note:** You will need to save recordings to a path _outside_ of the jamulus home directory, or remove `ProtectHome=true` from your systemd unit file (be aware that doing so is however a potential security risk).

For turning recording on or off (depending on the current state):

~~~
 [Unit]
 Description=Toggle recording state of Jamulus server
 Requisite=Jamulus-Server

 [Service]
 Type=oneshot
 ExecStart=/bin/systemctl kill -s SIGUSR2 Jamulus-Server
~~~

For starting a new recording:

~~~
 [Unit]
 Description=Start a new recording on Jamulus server
 Requisite=Jamulus-Server

 [Service]
 Type=oneshot
 ExecStart=/bin/systemctl kill -s SIGUSR1 Jamulus-Server
~~~

_Note: The Jamulus service name in the `ExecStart` line needs to be the same as the `.service` file name you created when setting systemd to control your Jamulus server. So in this example it would be `Jamulus-Server.service`_

Run `sudo systemctl daemon-reload` to register them for first use.

Now you can run these with the `service start` command, for example:

`sudo service jamulusTogglerec start` (assuming you named your unit file `jamulusTogglerec.service`)

You can see the result of these commands if you run `service jamulus status`, or by viewing the logs.

## Making a server status page

With the `-m` command line argument, server statistics can be generated to be put on a web page.

Here is an example php script using the server status file to display the current server status on a html page (assuming the following command line argument to be used: `-m /var/www/stat1.dat`):

~~~
<?php
function loadserverstat ( $statfilename )
{
   $datei = fopen ( $statfilename, "r" );
   while ( !feof ( $datei ) )
   {
          $buffer = fgets ( $datei, 4096 );
          echo $buffer;
   }
   fclose($datei);
}
?>
<?php loadserverstat ( "stat1.dat" ); ?>
~~~