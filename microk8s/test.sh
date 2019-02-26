#!/bin/bash

echo "Hi! What You want to do? (create, delete, get, log,)"

read -r varname

ctl="kubectl"
space='--namespace=test'

if [ "$varname" == create ]; then
    "$ctl" create -f space.yaml
    "$ctl" create -f back.yaml
    "$ctl" create -f front.yaml
    "$ctl" port-forward service/frontend "$space" 8081:80 &>/dev/null &
elif [ "$varname" == delete ]; then
    "$ctl" delete namespace test
elif [ "$varname" == get ]; then
    "$ctl" get pods --output=wide "$space"
elif [ "$varname" == log ]; then
    echo "Please select: f - frontend, b - backend."
    read -r podname
    if [ "$podname" == f ]; then
    "$ctl" logs -l pod=frontend "$space"
    elif [ "$podname" == b ]; then
    "$ctl" logs pod=backend "$space"
    fi
else
    echo "Choose from possible: create, delete, get, log"
 fi
