# docker-desktopbase: minimal base desktop with a terminal, using [Xpra](http://www.xpra.org)

This is a very cut-down form of <https://github.com/rogaha/docker-desktop>.

It weights in at around 600MB rather than 2Gb+

Installs just the Xpra server and the lxterminal terminal.

You can extend this to add other apps or a whole desktop environment.

Uses the most recent version of Xpra packaged on <http://xpra.org>

Default command launches an X session running a terminal as user with
UID 1001, with a TCP connection on port 33333.  The password for the
user is passed into the container in the environment variable
DOCKER_XPRA_PASSWORD.

**WARNING!**: 

* the user has root access via `sudo`!
* the TCP connection is not encrypted!
* passing passwords in environment variables is poor practice!

As it stands, this is only for suitable for local use on a trusted
network.  For use over the Internet you should use SSH instead.

## Example Docker Compose file

~~~~~~~~~~~~~~~
desktop:
  container_name: "desktop"
  restart: always
  image: justifiably/desktopbase
  ports:
   - "33333:33333"
  environment:
   - DOCKER_XPRA_PASSWORD="changeme"
~~~~~~~~~~~~~~~


[![](https://badge.imagelayers.io/justifiably/desktopbase:latest.svg)](https://imagelayers.io/?images=justifiably/desktopbase:latest 'Get your own badge on imagelayers.io')
