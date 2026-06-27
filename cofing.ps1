# =========================
# WINDOWS OPTIMIZER CONFIG
# =========================

# MODE PREDEFINITI

$safeModules = @(
    "clean_temp.ps1",
    "debloat_apps.ps1"
)

$performanceModules = @(
    "clean_temp.ps1",
    "debloat_apps.ps1",
    "optimize_services.ps1",
    "update_cleanup.ps1"
)

$gamingModules = @(
    "clean_temp.ps1",
    "network_tweaks.ps1",
    "gaming_mode.ps1"
)

# DEFAULT MODE (equivalente a "profile")
$defaultMode = "safe"
