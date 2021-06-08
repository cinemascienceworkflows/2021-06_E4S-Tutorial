#!/bin/bash

source ./pantheon/env.sh > /dev/null 2>&1

echo "----------------------------------------------------------------------"
echo "PTN: validating" 

OUTPUT=$PANTHEON_RUN_DIR/cinema_databases/$PANTHEON_CDB
GOLD=validate/data/pantheon.cdb

echo "     $OUTPUT"

PASS=true
if [ -d $OUTPUT ]; then
    if cmp "$OUTPUT/data.csv" "$GOLD/data.csv"; then
        echo "     Comparing images $GOLD/$img"
    else
        echo "FILES differ:"
        echo "    $OUTPUT"
        echo "    $GOLD"
        PASS=false
    fi
else
    echo "Cinema Database: $OUTPUT does not exist"
    PASS=false
fi

if $PASS; then
    echo "PTN: PASS"
    echo "----------------------------------------------------------------------"
else
    echo "PTN: FAIL"
    echo "----------------------------------------------------------------------"
    exit 1
fi

