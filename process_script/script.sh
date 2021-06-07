#!/bin/bash
if [ $1 ]
then
	process_num=$1
else
	process_num=1
fi
process_num=`expr $process_num + 1` #first process is header need to increase 1
header="_______Process Name________%CPU %MEM PID PPID PORT"
record=$( ps -eo cmd:50,%cpu,%mem,pid,ppid --sort=-%cpu,-%mem|   ps -eo cmd,%cpu,%mem,pid,ppid --sort=-%cpu,-%mem | head -$process_num | tail -1)
pid=$(echo $record | awk '{print $5}')
port=$(netstat -ano -p tcp | grep LISTEN | grep $pid | awk '{print $4}' | awk -F":" '{print $2}')
record1="$record $port"


echo $header 
echo $record1
