![logo](https://raw.githubusercontent.com/managedkaos/cherokee/master/cherokee-logo.png)
# A container for the Cherokee web server
To get started, pull the image:

`docker pull managedkaos/cherokee`

After the pull, run the image:

`docker run --rm --name cherokee -d -p 80:80 -p 443:443 -p 9090:9090 managedkaos/cherokee`

Confirm operation by browsing to http://localhost.

SSL support is built in!  The container creates a self signed certificate at build time.  Access the HTTPS version of the site by browsing to https://localhost

To serve a local site, map a directory as a volume to `/var/www`:

`docker run --rm --name cherokee -d -p 80:80 -p 443:443 -p 9090:9090 -v /tmp/www:/var/www managedkaos/cherokee`

To run the Cherokee Admin UI, start the containter as above. Then run the following command:

`docker exec -it cherokee cherokee-admin -b`

Use the output from the command to get the user name and the one time password.  It should be similar to the following:

```
Cherokee Web Server 1.2.104 (Sep 13 2018): Listening on port ALL:9090, TLS
disabled, IPv6 enabled, using epoll, 1048576 fds system limit, max. 524281
connections, caching I/O, 4 threads, 131070 connections per thread, standard
scheduling policy

Login:
  User:              admin
  One-time Password: 5FZzjxHNgvbvCaJk

Web Interface:
  URL:               http://localhost:9090/

```

Open a browser window with `localhost:9090`.  When prompted, enter `admin` for the username and the password provided by the cherokee-admin command.

*Note that the cherokee-admin command is interactive* so it will keep the shell open until you end the command by entering `CTRL+C` twice.

