$objComputer = "Server001"

$objXMLFilter = '<QueryList>
                <Query Id="0" Path="Microsoft-Windows-PrintService/Operational">
                <Select Path="Microsoft-Windows-PrintService/Operational">*[System[(EventID=307) and TimeCreated[timediff(@SystemTime) &lt;= 86400000]]]</Select>
                </Query>
                </QueryList>'



$colPrintEvents = get-winevent -ComputerName $objComputer -filterxml $objXMLFilter

$colPrintEvents | export-csv 'C:\Reports\PrintEvents.csv' -NoTypeInformation