param(
            [Parameter(Mandatory)][string] $keyVaultName,
            [Parameter(Mandatory)][string] $keyVaultSecretName
     )

function Get-RandomCharacters($length) { 
    $characters = "!#$%^&*0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz"
    $random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length } 
    $private:ofs="" 
    return [String]$characters[$random]
}

try{


    $hello = Get-AzKeyVaultSecret -VaultName $keyVaultName -Name $keyVaultSecretName  -AsPlainText -ErrorAction SilentlyContinue
    if($hello) {
        $password = $hello
        $createSecret = $false
        
    }
    else {
        $password = Get-RandomCharacters -length 24
        $createSecret = $true
    }

    Write-Host "##vso[task.setvariable variable=SQLAdministratorLoginPassword]$password"
    Write-Host "##vso[task.setvariable variable=createSecret]$createSecret"

}
catch{
    $errorMess= $_.Exception.Message
    Write-Host "Error: $errorMess"
}