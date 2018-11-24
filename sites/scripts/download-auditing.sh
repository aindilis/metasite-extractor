#!/bin/bash

# add something to this in order to have it check the site of the upstream files

SIZE=`how-large-will-download-be.pl "$1"`
echo $SIZE

if [ $SIZE -lt 1000000000 ]; then

    CURRENT_DIR=`pwd`
    TIMESTAMP=`timestamp`
    TIMESTAMP_DIR="/var/lib/myfrdcsa/codebases/minor/metasite-extractor/data/download-auditing/data-git/downloads/$TIMESTAMP"
    echo $TIMESTAMP_DIR
    mkdir -p $TIMESTAMP_DIR && cd $TIMESTAMP_DIR && wget -U "Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0" -x $1 > wget-STDOUT-$TIMESTAMP.log 2> wget-STDERR-$TIMESTAMP.log
    cd $CURRENT_DIR

fi
