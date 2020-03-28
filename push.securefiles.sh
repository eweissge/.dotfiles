#!/bin/bash

hosts="mercury
io
newlab
blackhole
backup
RPI4"

for host in $hosts; 
do
	# check current hostname against $host
	rsync -avhtP /home/eric/.secure $host:~/
done
