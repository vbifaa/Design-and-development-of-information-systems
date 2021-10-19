#!bin/bash
command=$1
pid_file="pid.txt"
response_file="response.csv"

check_memory() {
    while [ true ]
    do
	echo "timestamp: $(date +%T)" > $response_file
	echo "all_memory $(free -m | grep Mem | awk '{print $2}') MB" >> $response_file
	echo "free_memory $(free -m | grep Mem | awk '{print $4}') MB" >> $response_file
	echo "usaged $(free -m | grep Mem | awk '{print $3/$2 * 100.0}')%" >> $response_file
	sleep 10m
   done
}

if [ $command == "START" ]
then
    if [ -f $pid_file ]
    then
	echo "The program is already running"
    else
    	check_memory &
    	echo $!
    	echo $! > $pid_file
   fi
elif [ $command == "STOP" ]
then
    if [ -f $pid_file ]
    then
    	read pid < $pid_file
    	kill $pid
    	rm $pid_file
    else
	echo "The program is already stopped"
    fi
elif [ $command == "STATUS" ]
then
    if [ -f $pid_file ]
    then
	echo "True"
   else
	echo "False"
   fi
else
    echo "Command must be START or STATUS or STOP"
fi
