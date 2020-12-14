#########################################################################
# File Name: process_stats.sh
# Author: Number Zhang
# Created Time: Wed 29 May 2019 09:38:03 AM CST
#########################################################################

Pid_s(){
    Pid=`ps aux | grep $Pro | egrep -v "grep|osInfo.sh" | awk '{print $2}'`
}

Cpu_s(){
    Cpu=`ps aux | grep $Pid | grep $Pro | grep -v grep | awk '{print $2}'`
}

Mem_s(){
    Mem= `ps aux | grep $Pid | grep $Pro | grep -v grep | awk '{print $3}'`
}

Result(){
    Pid_s
    case $Opt in
        Cpu)
            Cpu_s
            echo $Cpu
            ;;
        Mem)
            Mem_s
            echo $Mem
            ;;
    esac
}

Pro=$1
Opt=$2
Result

#ps -ef | grep jar | grep -v color| grep -v Bootstrap| awk '{print $10}'| awk -F "/" '{print $4}'


# psInfo.conf
#UserParameter=eureka_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-eureka-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=filemanagement_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-filemanagement-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=fyz_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-fyz-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=messagecenter_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-messagecenter-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=portal_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-portal-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=system_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-system-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=usermanagement_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-usermanagement-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=zuul_Cpu, 	/etc/zabbix/scripts/psInfo.sh tgcw-zuul-0.8.1-SNAPSHOT.jar Cpu
#UserParameter=eureka_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-eureka-0.8.1-SNAPSHOT.jar Mem
#UserParameter=filemanagement_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-filemanagement-0.8.1-SNAPSHOT.jar Mem
#UserParameter=fyz_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-fyz-0.8.1-SNAPSHOT.jar Mem
#UserParameter=messagecenter_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-messagecenter-0.8.1-SNAPSHOT.jar Mem
#UserParameter=portal_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-portal-0.8.1-SNAPSHOT.jar Mem
#UserParameter=system_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-system-0.8.1-SNAPSHOT.jar Mem
#UserParameter=usermanagement_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-service-usermanagement-0.8.1-SNAPSHOT.jar Mem
#UserParameter=zuul_Mem, 	/etc/zabbix/scripts/psInfo.sh tgcw-zuul-0.8.1-SNAPSHOT.jar Mem

