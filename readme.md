### A11 Radio Operations

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
