#!/usr/bin/env bash

SERVER=$1

# copy rsa kyes
scp ~/.ssh/id_rsa_stash* eanderso@$SERVER:/home/eanderso/.ssh/
scp ~/.ssh/id_rsa_git* eanderso@$SERVER:/home/eanderso/.ssh/
scp ~/.ssh/authorized_keys eanderso@$SERVER:/home/eanderso/.ssh/
ssh eanderso@$SERVER chmod 600 /home/eanderso/.ssh/id_rsa*
