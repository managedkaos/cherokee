# cherokee - Images for running the Cherokee web server.

Each image is based on an OS: `alpine`, `centos`, `fedora`, or `ubuntu`.

_(Currently only alpine has the complete Cherokee package installed!)_

Use the image as the tag for the pull.  For example:

`docker pull managedkaos/cherokee:alpine`

Not specifying an OS tag will pull latest which is alpine by default.

After the pull, run the image:

`docker run -d -p 80:80 managedkaos/cherokee:alpine`

Confirm operation by browsing to http://localhost.

To serve a local site, map the directory as a volume to `/var/www`:

`docker run -d -p 80:80 -v /tmp/www:/var/www managedkaos/cherokee:alpine`
