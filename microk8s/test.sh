#!/bin/bash

echo "Hi! What You want to do? (create, delete, get, describe, log,)"

read -r varname

ctl="kubectl"
space='--namespace=test'

if [ "$varname" == create ]; then
    "$ctl" create -f space.yaml
    "$ctl" create -f back.yaml
    "$ctl" create -f front.yaml
elif [ "$varname" == delete ]; then
    "$ctl" delete namespace test
elif [ "$varname" == get ]; then
    "$ctl" get pods --output=wide "$space"
elif [ "$varname" == describe ]; then
    "$ctl" describe pods "$space"
elif [ "$varname" == log ]; then
    echo "Please select: f - frontend, b - backend."
    read -r podname
    if [ "$podname" == f ]; then
    "$ctl" logs -l pod=frontend "$space"
    elif [ "$podname" == b ]; then
    "$ctl" logs -l pod=backend "$space"
    fi
else
    echo "Choose from possible: create, delete, get, describe, log"
 fi
