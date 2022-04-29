$VM = vboxmanage list vms
$array = $VM

Foreach($a in $array)

{

New-Object -TypeName psobject -Property @{

    index= $array.indexof($A)

    Value= $A } }

Write-Host "What machine do you want start? (Enter a index number)"
Pause
$MA = Read-Host

    vboxmanage startvm $VM[$MA]

    
