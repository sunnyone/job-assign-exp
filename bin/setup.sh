#!/bin/bash

if [ -z "$2" ] ; then
  echo "usage: $0 mysql|postgres port"
  exit 1
fi

DBMS="$1"
PORT="$2"

if [ "$DBMS" != mysql -a "$DBMS" != postgres ] ; then
  echo "Invalid DBMS"
  exit 1
fi

cat sql/schema-$DBMS.sql | bin/connect-$DBMS.sh "$PORT"
cat sql/data-setup.sql | bin/connect-$DBMS.sh "$PORT"
