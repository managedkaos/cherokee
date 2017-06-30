![logo](http://idroot.net/wp-content/uploads/2015/02/cherokee-logo.png)
# A container for the Cherokee web server
To get started, pull the image:

`docker pull managedkaos/cherokee`

After the pull, run the image:
 
`docker run -d -p 80:80 -p 443:443 managedkaos/cherokee`

Confirm operation by browsing to http://localhost.

SSL support is built in!  The container creates a self signed certificate at build time.  Access the HTTPS version of the site by browsing to https://localhost

To serve a local site, map a directory as a volume to `/var/www`:

`docker run -d -p 80:80 -p 443:443 -p 9090:9090 -v /tmp/www:/var/www managedkaos/cherokee`

To run the Cherokee Admin UI, start the containter as above and then get the containter ID:

```
$ docker ps
CONTAINER ID        IMAGE                  COMMAND                  
7998bc0a1199       managedkaos/cherokee   "/usr/sbin/cheroke..."
```

Then open a shell on the running container:

```
$ docker exec -it 732142a038a8 /bin/sh
```

Inside the shell, run `cherokee-admin -b` and make a note of the admin password:

```
# cherokee-admin -b &
# Cherokee Web Server 1.2.104 (Feb  2 2017): Listening on port ALL:9090, TLS
disabled, IPv6 enabled, using epoll, 1048576 fds system limit, max. 524281
connections, caching I/O, 4 threads, 131070 connections per thread, standard
scheduling policy

Login:
  User:              admin
  One-time Password: S7URekVf5sUKiMri

Web Interface:
  URL:               http://localhost:9090/

```

Open a browser window with `localhost:9090`.  When prompted, enter `admin` for the username and the password provided by the cherokee-admin command.

