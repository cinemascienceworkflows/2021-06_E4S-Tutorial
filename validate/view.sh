#!/bin/bash

source ./pantheon/env.sh > /dev/null 2>&1


OUTPUT=$PANTHEON_RUN_DIR/cinema_databases/cinema_view.html

echo "----------------------------------------------------------------------"
echo "PTN: viewing $OUTPUT"
echo "----------------------------------------------------------------------"

firefox $OUTPUT &

