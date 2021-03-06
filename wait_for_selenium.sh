#!/usr/bin/env bash

set -e

MAX_TRIES=30

tries=0

while [ ${tries} -lt ${MAX_TRIES} ]; do
    if ! curl --silent localhost:4444 > /dev/null; then
        let tries+=1
        echo "Selenium server is not allowed by tcp on localhost:4444"
        echo "Retry..."
        sleep 1
    else
        break
    fi
done

if [ ${tries} -ge ${MAX_TRIES} ]; then
    echo "Selenium server is not allowed"
    exit 1
fi

