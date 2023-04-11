#!/usr/bin/env bash

main()
{
  DIR=$(dirname "$0")

  if [ ! -f "${DIR}/app" ]; then
    gcc -O3 "${DIR}/app.c" "${DIR}/lib.o" -o "${DIR}/app"
  fi

  for i in 10 100 500 1000 1500; do
    echo Using argument $i
    cat << EOF > "${DIR}/job$i.sge"
#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#$ -N hostname_jobname
#$ -o hostname.out
#$ -e hostname.err

{ time ./app $i 2> /dev/null; } 2>&1 | grep -Eo ^real$'\t'[0-9]+m[0-9]+.[0-9]+s | cut -d $'\t' -f2 >> ${i}_data.txt
EOF
    for _ in {1..10}; do
      echo Launching job with arg $i
      qsub "${DIR}/job$i.sge"
    done

  done

}

main "$@"
