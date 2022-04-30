$vm=C:\'Program Files'\Oracle\VirtualBox\.\VBoxManage.exe 
$vmr=C:\'Program Files'\Oracle\VirtualBox\.\VBoxManage.exe list runningvms

Foreach($i in $vmr)

{

New-Object -TypeName psobject -Property @{

    index= $vmr.indexof($i)

    Value= $i } 
   
    C:\'Program Files'\Oracle\VirtualBox\.\VBoxManage.exe controlvm $i.split(' ')[0] poweroff

    }
    Write-Host "All Machines poweroff, See you later"


