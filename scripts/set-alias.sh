#!/bin/bash

SERVERS=(

	"ctrl01" 
	"ctrl02"
	"ctrl03"
	"wrk01"
	"wrk02"
	"wrk03"

)

for SERVER in "${SERVERS[@]}"; do
	SHORT="${SERVER//[trl0k]/}"
	echo "alias "$SHORT"='ssh "$SERVER"'" 
done
