![logo](http://idroot.net/wp-content/uploads/2015/02/cherokee-logo.png)
# A container for the Cherokee web server

`docker pull managedkaos/cherokee`

After the pull, run the image:

`docker run -d -p 80:80 managedkaos/cherokee`

Confirm operation by browsing to http://localhost.

To serve a local site, map the directory as a volume to `/var/www`:

`docker run -d -p 80:80 -v /tmp/www:/var/www managedkaos/cherokee`
