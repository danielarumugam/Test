$connString = "Server=tcp:scv-sqlserver-dev.database.windows.net,1433;Initial Catalog=scv-sqldb-dev;Persist Security Info=False;User ID=scvetl;Password=ETLNov2018!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#Invoke-Sqlcmd -ConnectionString $connString -Query "select getdate() as dt"
Write-Output Invoke-Sqlcmd -ConnectionString $connString -Query "Select getdate() dt" 

