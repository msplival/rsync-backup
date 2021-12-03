#!/bin/bash

remote_user=mike-backup
remote_host=192.168.10.2
remote_dir=backup-buntor

dry_run=""

if [[ $1 == "--dry-run" ]] ; then
    dry_run="--dry-run"
fi

time /usr/bin/rsync \
    $dry_run -xavP --delete --delete-excluded --numeric-ids \
    --exclude-from=/root/rsync-backup/excludes \
    --password-file=/root/rsync-backup/credential \
    / rsync://${remote_user}@${remote_host}/${remote_dir}

