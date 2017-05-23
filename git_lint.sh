#!/usr/bin/bash
#
##
###  run lint before commiting to github/gitlab
###
###  Author:
###  -------
###  Addi  <addi.abel@gmail.com>   Copyright  ©  2017
##
#

ERROR=""
ANSIBLE_DIR=$(echo $PWD | grep -i ansible | wc -l)
PUPPET_DIR=$(echo $PWD | grep -i puppet | wc -l)

if [ -d inventories -o $ANSIBLE_DIR -eq 1 ]
then
    for YML in `git status | grep yml | grep -vE 'roles|inventories' | awk '{print $2}'`
    do
        ansible-lint $YML
        [ $? -gt 0 ] && ERROR=YES
    done
    if [ "$ERROR" = "YES" ]
    then
        echo "ansible-lint: Failed"
        exit 1
    else
        echo "ansible-lint: OK"
        exit 0
    fi
fi

if [ -d manifests -o $PUPPET_DIR -eq 1 ]
then
    puppet-lint --no-autoloader_layout-check  manifests
    if [ $? -eq 0 ]
    then
        echo "puppet-lint: OK"
        exit 0
    else
        echo "puppet-lint: Failed"
        exit 1
    fi
fi
