#!/usr/bin/env bash

server=$1

~/bin/push_ssh.sh $server
~/bin/push_homeshick.sh $server
