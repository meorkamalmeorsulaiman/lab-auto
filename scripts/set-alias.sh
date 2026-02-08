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
	echo "alias "$SERVER"='ssh "$SERVER"'" 
done
