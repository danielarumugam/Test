$credential = Get-AutomationPSCredential -Name "SRVC_PRL"
$kvName = Get-AutomationVariable -Name 'KV_NM'
$kvSecretName = Get-AutomationVariable -Name 'SQL_CONNT_STRG_KV_SCRT_NM'
$tenantId = Get-AutomationVariable -Name 'TNT_ID'

Connect-AzureRMAccount -ServicePrincipal -Credential $Credential -Tenant $tenantId  
$connString = (Get-AzureKeyVaultSecret -VaultName $kvName -Name $kvSecretName).SecretValueText
Write-Output $connString

#$connString = "Server=tcp:scv-sqlserver-dev.database.windows.net,1433;Initial Catalog=scv-sqldb-dev;Persist Security Info=False;User ID=scvetl;Password=ETLNov2018!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#Invoke-Sqlcmd -ConnectionString $connString -Query "select getdate() as dt"
$result =  Invoke-Sqlcmd -ConnectionString $connString -Query "Select getdate() dt" 
Write-Output $result

