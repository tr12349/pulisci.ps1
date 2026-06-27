function Invoke-Module {

    $services = @(
        "SysMain",
        "DiagTrack",
        "WSearch"
    )

    foreach ($s in $services) {
        try {
            Stop-Service $s -Force -ErrorAction SilentlyContinue
            Set-Service $s -StartupType Manual -ErrorAction SilentlyContinue
        } catch {}
    }
}
