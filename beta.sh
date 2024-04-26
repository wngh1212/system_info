#!/bin/bash
sys_status(){
    echo "---------------------used disk-------------------------"
    df -h
    echo "---------------------process---------------------------"
    ps -a
    echo "---------------------used cpu&Mem----------------------"
    top -bn 1 | grep %Cpu
    top -bn 1 | grep Mem
}
if [ ! -d "sow" ]; then
    mkdir "sow"
fi
# 288 * 5 = 1440 min is 1 day
i=0
while [ $i -lt 287 ]; do
    file_save_time=$(date +%Y%m%d%H%M%S)
    file_name="${file_save_time}_system_monitor.log"
    sys_status > "sow/${file_name}"
    sleep 300
    i=$((i+1))
done
save_date=$(date +%Y%m%d)
tar -zcvf "${save_date}_system_monitor.tgz" sow/
rm -rf sow
