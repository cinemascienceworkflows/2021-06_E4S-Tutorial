#!/bin/bash

source ./pantheon/env.sh

RUN_CLEAN=true
# NaluWind regression test
NALU_REG_TEST=nonIsoEdgeOpenJet

if $RUN_CLEAN; then
    echo "----------------------------------------------------------------------"
    echo "PTN: cleaning results directory ..." 
    echo "----------------------------------------------------------------------"

    rm -rf $PANTHEON_RUN_DIR
    mkdir $PANTHEON_RUN_DIR
fi

# set up spack env
# . ${PANTHEON_RUN_DIR}/../spack/share/spack/setup-env.sh

# NaluWind executable variables
NALU_BIN_DIR=$(spack location -i nalu-wind)/bin

# copy executable and support files
cp -r ${NALU_BIN_DIR}/* $PANTHEON_RUN_DIR
cp -r inputs/nalu-wind/${NALU_REG_TEST}/* $PANTHEON_RUN_DIR
cp run/submit.sh $PANTHEON_RUN_DIR

# go to run dir and update the submit script and nalu input file locations
pushd $PANTHEON_RUN_DIR > /dev/null 2>&1 
sed -i "s/<pantheon_workflow_jid>/${PANTHEON_WORKFLOW_JID}/" submit.sh
sed -i "s#<pantheon_workflow_dir>#${PANTHEON_WORKFLOW_DIR}#" submit.sh
sed -i "s#<pantheon_run_dir>#${PANTHEON_RUN_DIR}#g" submit.sh
sed -i "s#<nalu_reg_test>#${NALU_REG_TEST}#g" submit.sh
sed -i "s#<pantheon_run_dir>#${PANTHEON_RUN_DIR}#" ${NALU_REG_TEST}.yaml
sed -i "s#<compute_allocation>#${COMPUTE_ALLOCATION}#" submit.sh

# submit the job
echo "----------------------------------------------------------------------"
echo "PTN: submitting run ..." 
echo "----------------------------------------------------------------------"
bash submit.sh
