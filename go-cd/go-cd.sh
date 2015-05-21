#!/bin/bash

/etc/init.d/go-server start && tail -f /var/log/go-server/go-server.log
