#!/usr/bin/env bash

server=$1

ssh eanderso@$server '/bin/bash -s' < ~/bin/setup_homeshick.sh
