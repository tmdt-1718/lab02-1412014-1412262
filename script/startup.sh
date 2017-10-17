#!/bin/bash
# start up script
#if encounter error about \r, please reopen this file with hexa and delete "0d" after "6c6c"

bundle install
rm -f /web/tmp/pids/server.pid
rails s -b 0.0.0.0