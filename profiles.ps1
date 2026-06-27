# =========================
# PROFILE DESCRIPTIONS
# =========================

$profilesInfo = @{
    "safe" = @{
        Description = "Basic cleanup, no risk tweaks"
        Modules = @("clean_temp.ps1", "debloat_apps.ps1")
    }

    "performance" = @{
        Description = "Balanced optimization for speed"
        Modules = @("clean_temp.ps1", "debloat_apps.ps1", "optimize_services.ps1", "update_cleanup.ps1")
    }

    "gaming" = @{
        Description = "Low latency / gaming focused tweaks"
        Modules = @("clean_temp.ps1", "network_tweaks.ps1", "gaming_mode.ps1")
    }
}
