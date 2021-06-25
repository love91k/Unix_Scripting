#!/bin/bash
> mytime.log
echo "This will generat automatic logs"

while true
do

t1=`awk -v min=2 -v max=50 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
t2=`awk -v min=1 -v max=9 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
t3="${t1}.${t2}ms"

n1=`awk -v min=1 -v max=2 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
response=`echo "200:500"| cut -d":" -f$n1`
n2=`awk -v min=1 -v max=3 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
word=`echo "GET:POST:GET"| cut -d":" -f$n2`


time=`date '+%Y-%m-%dT%X'`

echo "level=debug ts=$time caller=logging.go:66 traceID=a9d4d8a928d8db1 msg=\"$word /api/prom/api/v1/query_range ($response) $t3\"" >> mytime.log
sleep 1


done
