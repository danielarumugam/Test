$connString = "DRIVER={ODBC Driver 13 for SQL Server};PORT=1433;SERVER=scv-sqlserver-dev.database.windows.net;PORT=1443;DATABASE=scv-sqldb-dev;UID=scvetl;PWD=ETLNov2018!;Encrypt=yes;TrustServerCertificate=no"

$dataTable = Invoke-Sqlcmd -ConnectionString $connString -Query "exec CTRLDB.PROC_TOAPW_OBJ_ADMN_PROC_WRK" -As DataTables
Write-Output $dataTable.Rows.Count
foreach ($row in $dataTable.Rows)
    { 

        #Assign variables with values from data row
        $serverName = $row.SRVR_NM
        $cubeNAme = $row.CUBE_NM
        $tableName = $row.TBL_NM
        $partitionName = $row.PARTN_NM
        $partitionDate = $row.PARTN_DT
        $operation = $row.ADMN_OPR_CD
        $tmslCommand = $row.TMSL_CMD

        Write-Output "Server Name: $serverName"
        Write-Output "Cube Name: $cubeNAme"
        Write-Output "Table Name: $tableName"
        Write-Output "Partition Name: $partitionName"
        Write-Output "Operation: $operation"
    }