#!/bin/bash

# List of servers (IP addresses or hostnames)
SERVERS=(

	"ctrl01" 
	"ctrl02"
	"ctrl03"
	"wrk01"
	"wrk02"
	"wrk03"

)


echo "Cleaning up SSH known host for K8s..."

for SERVER in "${SERVERS[@]}"; do
    echo "Deleting known host for $SERVER..."
    ssh-keygen -f "/home/ansible/.ssh/known_hosts" -R "$SERVER" 
done



