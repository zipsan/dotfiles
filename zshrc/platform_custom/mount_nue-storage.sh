#!/bin/sh

set -m

ssh -N -L 4445:192.168.0.22:445 nitori &
SSH_PID=$!

sleep 1

mkdir -p /Volumes/nue-storage
mount_smbfs //zip@localhost:4445/nue-storage /Volumes/nue-storage

trap 'diskutil unmount /Volumes/nue-storage; kill $SSH_PID' {1,2,3,15}

wait $SSH_PID

