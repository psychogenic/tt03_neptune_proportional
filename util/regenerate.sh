#!/bin/bash

DEFAULTVERSION=1.0.2

VERSION=$1
OUTNAME=$2

SCRIPTDIR=$(dirname $0)
TOPDIR=$(realpath $SCRIPTDIR/..)
SRCDIR=$TOPDIR/src
PYTHONDIR=$TOPDIR/design
LICTPL=$TOPDIR/util/license_tpl.txt
if [ "x$VERSION" = "x" ]
then
	VERSION=$DEFAULTVERSION
fi


if [ "x$OUTNAME" = "x" ]
then
	OUTNAME=`grep "\.v" info.yaml | sed -e 's/- *//' -e 's/^ *//'`
fi

echo "Generating $OUTNAME"
cd $PYTHONDIR
cat $LICTPL | sed -e "s/XXXVERSIONXXX/$VERSION/g" > $SRCDIR/$OUTNAME
python neptune/tt_top.py >> $SRCDIR/$OUTNAME
