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

verbose "CONFIGDIR=$AA_CONFIGDIR"	
SCRIPTBIN="$(dirname $(realpath $0))/scripts/"

${SCRIPTBIN}/go_latest_release 
${SCRIPTBIN}/find_repos
${SCRIPTBIN}/update

title Done 
