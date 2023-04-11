	while [ $(qstat -u $(whoami) | wc -l) -ne 0 ]; do sleep 10 && echo "waiting for all the jobs to end"; done
