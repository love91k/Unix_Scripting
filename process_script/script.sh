#!/bin/bash
if [ $1 ]
then
	process_num=$1
else
	process_num=1
fi
expr=`expr $process_num + 1` #first process is header need to increase 1
header="_______Process Name________%CPU %MEM PID PPID PORT"
record=$( ps -eo cmd:50,%cpu,%mem,pid,ppid --sort=-%cpu,-%mem|   ps -eo cmd,%cpu,%mem,pid,ppid --sort=-%cpu,-%mem | head -$process_num | tail -1)
pid=$(echo $record | awk '{print $5}')


echo $header 
echo $record
echo pid is $pid
