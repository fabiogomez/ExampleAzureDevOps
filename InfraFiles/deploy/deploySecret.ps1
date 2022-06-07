
param(
    [Parameter(Mandatory)][string] $SQLAdministratorLoginPassword,
    [Parameter(Mandatory)][string] $keyVaultName,
    [Parameter(Mandatory)][string] $secretName
)

try{
    
    $secretvalue = ConvertTo-SecureString $SQLAdministratorLoginPassword -AsPlainText -Force
    $secret = Set-AzKeyVaultSecret -VaultName $keyVaultName -Name $secretName -SecretValue $secretvalue
    
}
catch{
    $errorMess= $_.Exception.Message
    Write-Host "Error: $errorMess"
}

