	while [ $(qstat -u $(whoami) | wc -l) -ne 0 ]; do sleep 10 && echo "$(qstat -u $(whoami) | wc -l) jobs to end"; done
