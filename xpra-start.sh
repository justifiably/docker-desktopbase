#!/bin/sh
su --login user -c -p "DOCKER_XPRA_PASSWORD=$DOCKER_XPRA_PASSWORD /usr/bin/xpra start :100 --start-child=lxterminal --bind-tcp=0.0.0.0:33333 --mdns=no --auth=env:name=DOCKER_XPRA_PASSWORD"
