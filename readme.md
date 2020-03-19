### A11 Radio Operations

Glossary:

Linode - server provider based in Germany

Server - computer located remotely, likely does not have visual output (like a screen) and is usually interacted with via a terminal

Terminal - text based computer navigator

NGINX - web server technology used for processing inbound requests for data on a server

RTMP - streaming data protocol used by OBS to stream data to the server

HLS - encoding format for writing data streams to multimedia files

HTTP - protocol for the web, requests for web pages or multimedia files come as HTTP

SSH - “secure shell”, used to log onto and navigate remote computers/servers. SSH is installed on most linux machines (including Macs but not Windows)

SFTP - Secure File Transfer Protocol, a simple terminal-based program used to upload or download files to a server

Command - a program used to interact with a computer/server

Argument - an option or information “passed” or given to a command to change the behavior of said command

Directory - basically a folder. Directories have hierarchies. You can navigate up/down a directory, for example your documents on a Mac are usually located at /Users/<your user name>/Documents). / is also known as “root” or the “top” directory of the entire filesystem of the computer/server

Terminal commands:
1. pwd - Print Working Directory (tells you what folder your terminal is currently operating in)
2. ls - List (shows files in working directory)
3. cd - Change Directory (for example: cd .. will navigate your terminal one folder “up” a directory
4. man - Manual (i. e. man ls will show you how to use ls and all its options)
5. cat - Display the contents of a given file in the terminal
6. vim - An advanced editor in the terminal. HIGHLY SUGGEST YOU READ ABOUT VIM AND STUDY IT ON YOUR OWN.
7. nano - A less advanced editor in the terminal

You can also read about the less command/program for viewing files, it is more advanced than cat

—--

A11 on Linode:

Files for the website are located at:
/var/www/a11radio/public

You will find the HTML, CSS, and assets in this folder.

When OBS is on and streaming, the HLS output should be written to:
/var/www/a11radio/public/hls/<stream key>.m3u8

Note that the website looks for “playlist.m3u8” to play in the player so either you must keep the stream key in OBS as “playlist” or change the HTML to match the stream key. <insert HTML player src code snippet>

NGINX on Linode

NGINX manages both the RTMP > HLS technology and incoming HTTP requests to fetch the webpages.

NGINX was installed “from source” with the RTMP module and some other security add ons. You likely should not fuck around with installing anything related to NGINX and just reach out instead.

The NGINX configuration is just a text file called nginx.conf located at:
/usr/local/nginx/nginx.conf

NGINX can be reloaded, which must be done after any changes to the configuration, from any directory on the server by running the command:
nginx -s reload

There will be an error if NGINX is not running and you try to reload it, you can start nginx with a simple:
nginx

If you need to take the site/stream down for any reason you can just run:
nginx -s stop

—

Updating the website

FileZilla or SFTP is the best way to do so. Likely FileZilla, I can make sure you have access to everything.
