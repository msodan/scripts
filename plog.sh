#!/bin/bash

OS=$(uname -s)
SVNDIR="/home/msodan/svn/cops/PIC"
SVNTRUNK="$SVNDIR/trunk"
DATE=`date +%Y-%m-%d`

FROMDAYS=1
TODAYS=0

function line {
	echo "------------------------------------------------------------------------"
}

function showhelp {
	line
	echo "$0 options:"
	echo "-f	Specify when logging output should start (days ago)"
	echo "		Default: 1 (yesterday)"
	echo "-t	Specify when logging output should stop (days ago)"
	echo "		Default: 0 (today)"
	echo "-u	Show logs for user (default: your own ($USER)"
	echo "-v	Verbose Log output"
	echo "-h 	This help"
	line
	exit 0
}

function oscheck {

        case $OS in 
        	Darwin)		FROMDATE=$(date -v-${FROMDAYS}d  +%Y-%m-%d)
        			TODATE=$(date -v-${TODAYS}d +%Y-%m-%d)
        			;;
        	Linux)		FROMDATE=$(date -d "${FROMDAYS} days ago" +"%Y-%m-%d")
        			TODATE=$(date -d "${TODAYS} days ago" +"%Y-%m-%d")
        			;;
        	*)		echo "OS ${OS} not yet supported"
        			exit 1
        			;;
        esac	
}

function svnlog {

        cd $SVNTRUNK
	line
        svn log ${VERBOSE} -r{"$FROMDATE"}:{"$TODATE 23:59"} | sed -n "/${USER}/,/-----$/ p"
}

function main {
	oscheck
	echo "FROMDATE:		$FROMDATE"
	echo "TODATE  :		$TODATE"
	svnlog
}

	while getopts f:t:u:vh opt
	do
	   case $opt in
	       f) FROMDAYS=$OPTARG;;
	       t) TODAYS=$OPTARG;;
	       u) USER=$OPTARG;;
	       v) VERBOSE="-v";;
	       h) showhelp ;;
	       *) showhelp ;;
	   esac
	done
main
