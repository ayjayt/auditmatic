#!/bin/bash

usage() {
	echo "USAGE: "$'\t'"$(basename $0) [-c CONFIG_DIR] [-a] [-v]"
	echo "-v : verbose output"
	echo "-a : do all even if not time yet"
}

verbose() {
	if [ "$AA_VERBOSE" = "true" ]; then
		echo -e "$1"
	fi
}

err() {
	echo "Fatal error: $1"
	exit 1
}

export BOLD="$(tput bold)"
export NORM="$(tput sgr0)"


title() {
	echo -e "\n\n$BOLD*****$1******$NORM\n"
}
export -f title

chk_int() {
	if [ -z "$(cat "$1")" ]; then
		echo "0" > "$1"
	fi

	if [ $(cat "$1") -lt $(( $(date +%s) - $2 )) ]; then
		echo "$(date +%s)" > $1
		return 0
	fi
	return 1
}
export -f chk_int

pass() {
	echo -n ""
}
export -f pass

chk_all() {
	if [ "$AA_ALL" = "true" ]; then
		return 0
	else
		return 1
	fi
}
export -f chk_all
new_sleeper() {
	AA_SLEEPER="true" ${0} ${ORIG_OPTS} &> /dev/null &
	SLEEPER_PID=$!
	echo "${SLEEPER_PID}" > "$AA_CONFIGDIR/sleeper_pid"
	disown ${SLEEPER_PID}
}
ORIG_OPTS="${@}"
while getopts 'c:va' OPTION; do
	case "$OPTION" in
		a)
			export AA_ALL=true
			;;
		c)
			export AA_CONFIGDIR="${OPTARG}"
			;;
		v)
				AA_VERBOSE=true
			;;
		?)
			usage
			err "Unrecognized option"
			;;
	esac
done
if [ -z "$AA_CONFIGDIR" ]; then
	export AA_CONFIGDIR="$HOME/.auditmatic"
fi

mkdir -p $AA_CONFIGDIR

if [ "$AA_SLEEPER" = "true" ]; then
	if [ ! $(cat "$AA_CONFIGDIR/ts") -lt $(( $(date +%s) - 60*60*24 )) ]; then
		sleep 60*2
		new_sleeper
		exit 0	
	else
		pass
	fi
fi

if [ -f "$AA_CONFIGDIR/sleeper_pid" -a ! "${AA_SLEEPER}" = "true" ]; then
	echo "Killing $(cat ${AA_CONFIGDIR}/sleeper_pid)"
	kill -KILL $(cat "${AA_CONFIGDIR}/sleeper_pid") &> /dev/null
	sleep 1
fi

echo "$(date +%s)" > "$AA_CONFIGDIR/ts"
new_sleeper

verbose "CONFIGDIR=$AA_CONFIGDIR"	

SCRIPTBIN="$(dirname $(realpath $0))/scripts/"

${SCRIPTBIN}/go_latest_release 
${SCRIPTBIN}/find_repos
${SCRIPTBIN}/update
${SCRIPTBIN}/system_status

title Done 
