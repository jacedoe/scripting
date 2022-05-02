# Script for shutdown all machimes running on Virtualbox
# VboxManage bin on Mac or Linux
$VMR=vboxmanage list runningvms

# VboxManage bin on Windows
# $VMR=C:\'Program Files'\Oracle\VirtualBox\.\VBoxManage.exe list runningvms

Foreach($i in $VMR)

{

New-Object -TypeName psobject -Property @{

    index= $VMR.indexof($i)

    Value= $i } 
   
    vboxmanage controlvm $i.split(' ')[0] poweroff

    }
    Write-Host "All Machines poweroff, See you later"