function Invoke-Module {

    powercfg -setactive SCHEME_MIN

    $services = @("SysMain", "DiagTrack")

    foreach ($s in $services) {
        Stop-Service $s -Force -ErrorAction SilentlyContinue
    }
}
