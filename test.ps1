Write-Output "EDR Fileless Test"

whoami
hostname

New-Item C:\Windows\Temp\edr_test.txt -ItemType File -Force

Get-Date | Out-File C:\Windows\Temp\edr_test.txt
