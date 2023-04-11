#!/usr/bin/env bash

study()
{
  DIR=$(dirname "$0")
  cd "${DIR}"

  for i in 1 2 3 4; do
    echo Using argument $i
    cat << EOF > "${DIR}/job$i.sge"
#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#$ -N omp
#$ -o omp.out.$JOB_ID
#$ -e omp.out.$JOB_ID
#$ -pe openmp $i

export OMP_NUM_THREADS=$NSLOTS
{ time ./$1 2> /dev/null; } 2>&1 | grep -Eo ^real$'\t'[0-9]+m[0-9]+.[0-9]+s | cut -d $'\t' -f2 >> $1_${i}_data.txt
EOF
    for _ in {1..10}; do
      echo Launching job with arg $i
      qsub "${DIR}/job$i.sge"
    done

  done

}

study mm_parallel
study mm2_parallel
