#!/usr/bin/env bash

PORT=$1

if [[ -z "$PORT" ]]; then
    echo "You should enter the port following the command"
    exit
fi

lsof -i:4200

if [[ $? -eq 1 ]]; then
    echo "There is not any app listen on $PORT"
    exit
fi

kill $(lsof -t -i:$PORT)