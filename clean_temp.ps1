function Invoke-Module {

    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue

    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
}
