#!/bin/bash

usage() {
	echo "USAGE: "$'\t'"$(basename $0) [-c CONFIG_DIR]"
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

while getopts 'c:v' OPTION; do
	case "$OPTION" in
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
SCRIPTBIN="$(dirname $(realpath $0))"
$SCRIPTBIN/scripts/go_latest_release
$SCRIPTBIN/scripts/find_repos
