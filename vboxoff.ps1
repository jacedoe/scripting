$VMR=C:\'Program Files'\Oracle\VirtualBox\.\VBoxManage.exe list runningvms

Foreach($i in $VMR)

{

New-Object -TypeName psobject -Property @{

    index= $VMR.indexof($i)

    Value= $i } 
   
    C:\'Program Files'\Oracle\VirtualBox\.\VBoxManage.exe controlvm $i.split(' ')[0] poweroff

    }
    Write-Host "All Machines poweroff, See you later"


