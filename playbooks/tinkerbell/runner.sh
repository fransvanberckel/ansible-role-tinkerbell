#!/usr/bin/env bash

set -x
set -e

#GROUP_PLAYBOOK=$1
GROUP_PLAYBOOK=site.yml
EXTRA_VARS=$HOME/.ansible/.secrets.yml
ANSIBLE_STDOUT_CALLBACK=debug
PYTHONUNBUFFERED=1

ansible-playbook --verbose --extra-vars=@$EXTRA_VARS $GROUP_PLAYBOOK
