#!/bin/bash

function usage {
    echo " Usage: $0 <solr-addr> <collection>"
    echo " [eg: $0 18.188.130.77 bro]"
    exit 1
}

if [ $# -ne 2 ]; then
    usage
fi

solr=$1
coll=$2

curl http://$solr:8983/solr/$coll/update --data '<delete><query>*:*</query></delete>' -H 'Content-type:text/xml; charset=utf-8'
curl http://$solr:8983/solr/$coll/update --data '<commit/>' -H 'Content-type:text/xml; charset=utf-8'
