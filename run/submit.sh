#!/bin/bash

mpirun --np 4 <pantheon_run_dir>/naluX -i <pantheon_run_dir>/<nalu_reg_test>.yaml -o <pantheon_run_dir>/<nalu_reg_test>.log
