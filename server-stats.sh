get_cpu_usage(){
echo "CPU Usage:"
mpstat| awk '$12 ~/[0-9.]+/ {print 100 -$12}' 
}
get_mem_usage(){
echo "Memory Usage:"
free -m | awk 'NR==2{printf"Memory Usage:%s/%sMB(%.2f%%)\n",
$3,$2,$3*100/$2}'
}
get_disk_usage(){
echo "Disk Usage:"
df -h --total | awk 'END{print "Used: "$3",Free:"$4",Usage:"$5}'
}
top_cpu(){
echo "top 5 process by CPU:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}
top_mem(){
echo "top 5 process by memory:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%mem | head -n 6
}
get_cpu_usage
get_mem_usage
get_disk_usage
top_cpu
top_mem
