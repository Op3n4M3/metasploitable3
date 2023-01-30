$Logfile = "C:\Windows\Temp\wmf-install.log"
function LogWrite {
   Param ([string]$logstring)
   $now = Get-Date -format s
   Add-Content $Logfile -value "$now $logstring"
   Write-Host $logstring
}

mkdir windows_pre_downloads

LogWrite "Downloading dotNet 4.5.1"
try {
    (New-Object System.Net.WebClient).DownloadFile('http://download.microsoft.com/download/1/6/7/167F0D79-9317-48AE-AEDB-17120579F8E2/NDP451-KB2858728-x86-x64-AllOS-ENU.exe', 'windows_pre_downloads/dotnet.exe')
} catch {
    LogWrite $_.Exception | Format-List -force
    LogWrite "Failed to download file."
}

LogWrite "Downloading Windows Management Framework 5.0"
try {
    (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win7AndW2K8R2-KB3134760-x64.msu', 'windows_pre_downloads/wmf.msu')
} catch {
    LogWrite $_.Exception | Format-List -force
    LogWrite "Failed to download file."
}
