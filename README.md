# Ansible role Tinkerbell

```
06:01:31 system | Play recap
10.0.100.163 : ok=39 changed=9 unreachable=0 failed=0
Sunday 26 July 2020 06:01:31 +0200 (0:00:00.471) 0:01:13.108

docker build tinkerbell-certs -- 18.68s
tinkerbell : wait until ca.pem is present and continuing -- 5.57s
tinkerbell : waits for '10.0.100.163' port '443' -- 5.31s
tinkerbell : be sure all dependencies are present -- 3.44s
Gathering Facts -- 3.28s
tinkerbell : git clone tink project repo -- 2.49s
docker run tinkerbell-certs -- 2.15s
tinkerbell : create directories -- 1.98s
tinkerbell : deploy docker containers with compose -- 1.94s
apt : upgrade dist packages -- 1.87s
apt : remove dependencies that are no longer needed -- 1.82s
apt : install packages required by devops team -- 1.66s
apt : remove useless packages from the cache -- 1.49s
bootstrap : copy public ssh-key -- 1.33s
tinkerbell : move some tink files around -- 1.23s
apt : updating sources.list -- 1.20s
bootstrap : install packages required by ansible -- 1.11s
apt : purge packages that are no longer needed -- 1.02s
tinkerbell : log into docker registry -- 0.90s
```

## Compatibility

This configuration has been tested with the following hardware and OS combinations:

  - HP ProBook 6560b and Ubuntu 18.04 (64-bit), used docker-compose_1.21.0-3_all.deb
  - HP ProLiant DL2000 Node Rack Server module and Debian Bullseye (64-bit)

I am open for cloud instances to test, when they become available. I used the Ansible anstomlog callback plugin for a clear output. Check ansible.cfg includded for details. Oo, and i encrypted my own secrets.yml details, just to be sure.

## Usage

First, before you start running, you need to make adjustments to, where needed ...

- playbooks/tinkerbell/inventory.ini
- playbooks/tinkerbell/group_vars/all/apt.yml
- playbooks/tinkerbell/group_vars/provisioner/tinkerbell.yml

And know for sure, the use of '{{ ansible_default_ipv4.interface }}' works for you.

```
$ cd playbooks/tinkerbell/
$ ./edit-local-secrets.sh
$ ./runner.sh
```

## Notes

> Important: Downloading osie latest.tar.gz takes some time.

There are Tinkerbell workflow's writen for [Debian](https://github.com/fransvanberckel/debian-workflow) and [Ubuntu](https://github.com/fransvanberckel/ubuntu-workflow). All these workflow actions run as --privileged Docker containers.

## Author

The repository was created in 2020 by [Frans van Berckel](https://www.fransvanberckel.nl)
