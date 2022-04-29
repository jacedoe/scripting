#/bin/zsh
#VboxManage script
VM=$(vboxmanage list vms | awk '{print $1}' | sed 's/"//g')
length=${VM[*]}
echo "$length"