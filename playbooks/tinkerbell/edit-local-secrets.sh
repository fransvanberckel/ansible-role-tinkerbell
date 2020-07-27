#!/usr/bin/env bash

generate_password() (
        head -c 12 /dev/urandom | sha256sum | cut -d' ' -f1
)

generate_secrets() (
        local tink_password
        set_server_password=$(generate_password)
        local registry_password
        set_registry_password=$(generate_password)
        local registry_password
        set_postgres_password=$(generate_password)
        local postgres_password
        cat > $HOME/.ansible/.secrets.yml <<EOF
ansible_user: ''
ansible_ssh_pass: ''
ansible_become_pass: ''
server_username: 'admin'
server_password: ${set_server_password}
registry_username: 'admin'
registry_password: ${set_registry_password}
postgres_username: 'tinkerbell'
postgres_password: ${set_postgres_password}
EOF
)

if [ ! -f $HOME/.ansible/.vaultpass2 ];then
        generate_password > $HOME/.ansible/.vaultpass
fi

if [ ! -f $HOME/.ansible/.secrets.yml ]; then
        generate_secrets
        ansible-vault encrypt $HOME/.ansible/.secrets.yml
fi

ansible-vault edit $HOME/.ansible/.secrets.yml
