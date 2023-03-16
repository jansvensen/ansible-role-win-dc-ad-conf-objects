function move-computer {

    [Parameter(Mandatory=$true)][String]$ComputerObject
    [Parameter(Mandatory=$true)][String]$TargetOU
    
    $ComputerObjectDN = (Get-ADComputer $ComputerObject).DistinguishedName
    Move-ADObject -Identity $ComputerObjectDN -TargetPath $TargetOU

}

$ComputerObject = "rdsh-01"
$TargetOU = "OU=RDSH,OU=03_Environment,OU=Computer,OU=Objects,DC=democloud,DC=local"
Move-computer -ComputerObject $ComputerObject -TargetOU $TargetOU

$ComputerObject = "win10-01"
$TargetOU = "OU=FatClient,OU=03_Environment,OU=Computer,OU=Objects,DC=democloud,DC=local"
Move-computer -ComputerObject $ComputerObject -TargetOU $TargetOU