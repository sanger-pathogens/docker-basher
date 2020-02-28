#!/bin/bash

[ -f /etc/docker-basher.rc ] && source /etc/docker-basher.rc

exec "$@"
