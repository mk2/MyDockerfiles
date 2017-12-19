#!/bin/bash
set -Ceu

DEVSH=`pwd`/init_dev.sh
PRODSH=`pwd`/init_prod.sh

if [ $APPENV = "PROD" ] ; then
	$PRODSH
else
	$DEVSH
fi