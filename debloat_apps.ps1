function Invoke-Module {

    $apps = @(
        "*Xbox*",
        "*CandyCrush*",
        "*BingWeather*",
        "*Solitaire*"
    )

    foreach ($app in $apps) {
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
    }
}
