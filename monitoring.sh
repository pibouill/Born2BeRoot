#!/bin/bash

while true; do
	arch=$(uname -a)
	cpuphys=$(lscpu | grep "Socket(s):" | awk '{print $2}')
	vcpu=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
	ramusage=$(free -m | awk 'NR==2{printf "%.0f/%.0iMB (%.2f%%)", $3, $2, $3*100/$2}')
	diskusage=$(df -h --output=used,size,pcent / | awk 'NR==2{printf "%s/%s (%s)\n", $1 * 1020, $2, $3}')
	cpuload=$(mpstat | grep "all" | awk '{print 100 - $NF}')
	lastboot=$(who -b | awk '{print $3, $4}')
	lvmstatus=$(if [ $(lsblk | grep lvm | wc -l) -gt 0 ]; then echo yes; else echo no; fi)
	tcp=$(ss -tn state established '( dport = :ssh or sport = :ssh )' | grep -c -v LISTEN)
	userlog=$(users | wc -w)
	ip=$(hostname -I)
	mac=$(ip link show | awk '$1 == "link/ether" {print $2}')
	sudocount=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

	message="
	#Architecture: $arch
	#CPU Physical: $cpuphys
	#vCPU: $vcpu
	#Memory Usage: $ramusage
	#Disk Usage: $diskusage
	#CPU Load: $cpuload%
	#Last boot: $lastboot
	#LVM use: $lvmstatus
	#Connections TCP: $tcp ESTABLISHED
	#User log: $userlog
	#Network: IP $ip ($mac)
	#Sudo: $sudocount cmd
	"
	echo "$message" | wall
	sleep 600
done

