#!/usr/bin/env bash

server=$1

ssh eanderso@$server mkdir -p /home/eanderso/.ssh
~/bin/push_ssh.sh $server
~/bin/push_homeshick.sh $server
