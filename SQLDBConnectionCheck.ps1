$connString = "Server=tcp:scv-sqlserver-dev.database.windows.net,1433;Initial Catalog=scv-sqldb-dev;Persist Security Info=False;User ID=scvetl;Password=ETLNov2018!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#Invoke-Sqlcmd -ConnectionString $connString -Query "select getdate() as dt"
$dataTable = Invoke-Sqlcmd -ConnectionString $connString -Query "exec CTRLDB.PROC_TOAPW_OBJ_ADMN_PROC_WRK" -As DataTables
$queryResult = Invoke-Sqlcmd -ConnectionString $connString -Query "select cast(outputValue as int) PARTN_CNT from ctrldb.SCVDomainLookup where InputParameter = 'PartitionProcessLimit' and DomainParameter  = 'AAS-AdhocProcess'"
$partitionCount = $QueryResult  | Select-object  -ExpandProperty  PARTN_CNT
Write-Output $dataTable.Rows.Count
