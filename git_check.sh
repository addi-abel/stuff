#!/usr/bin/bash
#
##
###  run syntax parser before commiting to github/gitlab
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
        ansible-playbook -i ./inventories/test/hosts --syntax-check $YML
        [ $? -gt 0 ] && ERROR=YES
    done
    if [ "$ERROR" = "YES" ]
    then
        echo "ansible-syntax check: Failed"
        exit 1
    else
        echo "ansible-syntax check: OK"
        exit 0
    fi
fi

if [ -d manifests -o $PUPPET_DIR -eq 1 ]
then
    puppet parser --verbose validate manifests/*
    if [ $? -eq 0 ]
    then
        echo "puppet-syntax check: OK"
        exit 0
    else
        echo "puppet-syntax check: Failed"
        exit 1
    fi
fi
