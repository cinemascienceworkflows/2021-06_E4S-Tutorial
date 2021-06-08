#!/bin/bash

#BSUB -P <compute_allocation> 
#BSUB -W 00:10
#BSUB -nnodes 1
#BSUB -J <pantheon_post_jid> 

# load paraview module
# module load paraview/5.9.0-osmesa
#module load paraview
spack load paraview+python3

PANTHEON_RUN_DIR=<pantheon_run_dir>
SCRIPT=$PANTHEON_RUN_DIR/volume_rendering_cdb_extract.py
INPUT=$PANTHEON_RUN_DIR
CDB=$PANTHEON_RUN_DIR/cinema_databases/$PANTHEON_CDB

pvpython --force-offscreen-rendering $SCRIPT $CDB $INPUT > pvpython.output
