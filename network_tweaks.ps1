function Invoke-Module {

    ipconfig /flushdns

    netsh int tcp set global autotuninglevel=normal
    netsh int tcp set global rss=enabled
}
