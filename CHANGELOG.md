# 2020-08-13
- Rebuilding the image to incorporate [PR #1243](https://github.com/cherokee/webserver/pull/1243)
- Remove `centos` and `fedora` from the build script, preserving their `Dockerfile`s for reference
- Move images to `img` directory and unused items into the basement
- Add build stamp to /var/www/index.html and /version.txt
