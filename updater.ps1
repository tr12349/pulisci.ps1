
$global:localVersion = "1.0.0"

function Check-ForUpdate {

    try {

        $remoteVersion = Invoke-RestMethod `
        "https://raw.githubusercontent.com/tr12349/pulisci-e-velocizza-windows-10-11.bat/main/versione.txt"

        if ($remoteVersion -ne $global:localVersion) {

            Write-Host "UPDATE FOUND - STARTING AUTO UPDATE"

            Start-UpdateSilent
        }

    } catch {
        Write-Host "Update check failed"
    }
}

function Start-UpdateSilent {

    $zipUrl = "https://github.com/tr12349/pulisci-e-velocizza-windows-10-11.bat/archive/refs/heads/main.zip"

    $tempZip = "$env:TEMP\update.zip"
    $extract = "$env:TEMP\update"

    # CLEAN OLD
    if (Test-Path $extract) {
        Remove-Item $extract -Recurse -Force
    }

    Invoke-WebRequest $zipUrl -OutFile $tempZip

    Expand-Archive $tempZip -DestinationPath $extract -Force

    # trova folder estratto
    $folder = Get-ChildItem $extract | Where-Object {$_.PSIsContainer} | Select-Object -First 1

    $source = "$($folder.FullName)"

    # cartella del tool attuale
    $target = $PSScriptRoot

    # copia nuova versione
    Copy-Item "$source\*" $target -Recurse -Force

    # cleanup
    Remove-Item $tempZip -Force
    Remove-Item $extract -Recurse -Force

    # riavvio automatico
    Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$target\main.ps1`""

    exit
}
