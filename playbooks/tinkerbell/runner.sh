#!/usr/bin/env bash

set -x
set -e

#GROUP_PLAYBOOK=$1
GROUP_PLAYBOOK=site.yml
ANSIBLE_STDOUT_CALLBACK=debug
PYTHONUNBUFFERED=1

ansible-playbook --verbose $GROUP_PLAYBOOK
