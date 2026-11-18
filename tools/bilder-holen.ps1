# Lädt alle Bilder und das Video von der alten WordPress-Seite in dieses Repo.
# Einmal ausführen, solange die alte Seite noch online ist:
#   Am einfachsten: Doppelklick auf tools\bilder-holen.bat

$ErrorActionPreference = "Stop"
# Ältere Windows-PowerShell nutzt sonst ein veraltetes TLS und scheitert an HTTPS
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ProgressPreference = "SilentlyContinue"
Write-Host "Lade Bilder von sonneborns.de ..." -ForegroundColor Cyan
$repo   = Split-Path -Parent $PSScriptRoot
$liste  = Join-Path $PSScriptRoot "bilder-liste.txt"
$quelle = "https://www.sonneborns.de/wp-content/uploads/"
$fehler = 0

Get-Content $liste | Where-Object { $_.Trim() -ne "" } | ForEach-Object {
    $datei = $_.Trim()
    $ziel  = Join-Path $repo ("wp-content/uploads/" + $datei)
    if (Test-Path $ziel) { Write-Host "vorhanden  $datei"; return }
    New-Item -ItemType Directory -Force -Path (Split-Path $ziel) | Out-Null
    try {
        Invoke-WebRequest -Uri ($quelle + $datei) -OutFile $ziel -UseBasicParsing
        Write-Host "geladen    $datei" -ForegroundColor Green
    } catch {
        Write-Host "FEHLER     $datei  ($($_.Exception.Message))" -ForegroundColor Red
        $script:fehler++
    }
}

Write-Host ""
if ($fehler -eq 0) { Write-Host "Fertig - alle Dateien sind da." -ForegroundColor Green }
else { Write-Host "$fehler Datei(en) konnten nicht geladen werden." -ForegroundColor Yellow }
Read-Host "Enter zum Beenden"
