![logo](https://raw.githubusercontent.com/managedkaos/cherokee/master/img/cherokee-logo.png)

# Status
![Build and Publish to GHCR](https://github.com/managedkaos/cherokee/actions/workflows/publish-image-to-ghcr.yml/badge.svg)

# Notice and Licensing
This project is inspired by the [Cherokee Project](https://github.com/cherokee), specifically the [Cherokee Webserver](https://github.com/cherokee/webserver).

This is an independent project that is not endorsed or governed by the Cherokee Project.  

All code from the Cherokee Project is used under the [GNU General Public License, Version 2](https://github.com/cherokee/webserver/blob/master/COPYING).

This project, which packages the code from the Cherokee Webserver project into a containter, is licensed under the [MIT License](https://github.com/managedkaos/cherokee/blob/main/LICENSE).

Enjoy! :D

# A container for the Cherokee web server
To get started, pull the image:

```
docker pull managedkaos/cherokee
```

After the pull, run the image:

```
docker run --rm --name cherokee -d -p 80:80 -p 443:443 -p 9090:9090 managedkaos/cherokee
```

Confirm operation by browsing to http://localhost.

SSL support is built in!  The container creates a self signed certificate at build time.  Access the HTTPS version of the site by browsing to https://localhost

To serve a local site, map a directory as a volume to `/var/www`:

```
docker run --rm -detach \
    --publish 80:80 \
    --publish 443:443 \
    --publish 9090:9090 \
    --volume /tmp/www:/var/www \
    --name cherokee \
    managedkaos/cherokee
```

To run the Cherokee Admin UI, start the containter as above. Then run the following command:

```
docker exec -it cherokee cherokee-admin -b
```

Use the output from the command to get the user name and the one time password.  It should be similar to the following:

```
Cherokee Web Server 1.2.104 (Apr 18 2021): Listening on port ALL:9090, TLS
disabled, IPv6 enabled, using epoll, 1048576 fds system limit, max. 524281
connections, caching I/O, 4 threads, 131070 connections per thread, standard
scheduling policy

Login:
  User:              admin
  One-time Password: 2C30FKcz2m6npV0z

Web Interface:
  URL:               http://localhost:9090/
```

Open a browser window with `localhost:9090`.  When prompted, enter `admin` for the username and the password provided by the cherokee-admin command.

*Note that the cherokee-admin command is interactive* so it will keep the shell open until you end the command by entering `CTRL+C` twice.

