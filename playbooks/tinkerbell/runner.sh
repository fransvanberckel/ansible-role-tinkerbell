#!/usr/bin/env bash

set -x
set -e

#GROUP_PLAYBOOK=$1
GROUP_PLAYBOOK=site.yml
EXTRA_VARS=$HOME/.ansible/.secrets.yml
ANSIBLE_STDOUT_CALLBACK=debug
PYTHONUNBUFFERED=1

if ! command -v ansible >/dev/null; then
        echo "Installing Ansible & dependencies"
        if command -v sudo >/dev/null; then
                if command -v apt-get >/dev/null; then
                sudo apt-get update -qq
                sudo apt-get install -y -qq openssh-client sshpass ansible
                else
                        echo "apt-get command not found!"
                        exit 1
                fi
        else
                echo "sudo command not found!"
                exit 1
        fi
else
ansible-playbook --verbose --extra-vars=@$EXTRA_VARS $GROUP_PLAYBOOK
fi
