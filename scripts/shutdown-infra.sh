#!/bin/bash

# List of servers (IP addresses or hostnames)
SERVERS(

	"jump02" 
	"ns2"
	"strg02"

)

# The SSH user (must have NOPASSWD sudo privileges for shutdown)
SSH_USER="yourusername"

echo "Starting server shutdown process..."

for SERVER in "${SERVERS[@]}"; do
    echo "Attempting to shut down $SERVER..."
    # Execute the shutdown command remotely. The -t flag forces a pseudo-terminal 
    # allocation, which can be necessary for sudo to work correctly in a script.
    ssh -t "$SSH_USER@$SERVER" "sudo /sbin/shutdown -h now"
    
    # Optional: Add a delay or a ping check to verify the server is down
    echo "Command sent to $SERVER. Waiting for a moment..."
    sleep 5
done

echo "Shutdown commands sent to all servers."

