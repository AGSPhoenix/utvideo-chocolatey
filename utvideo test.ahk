Run, msinfo32
WinWaitActive, System Information, , 10

if ErrorLevel {
    Exit 1
}

Send {Down}
Send {Down}
Send {Right}
Send {Down}
Send {Right}
Send {Down}
Send {Down}

Sleep 500

ControlGet, numberOfCodecs, List, Count, SysListView321 ;Get number of codecs

if ErrorLevel {
    Exit 1
}

FileAppend, %numberOfCodecs%, * ;report number to stdout

WinClose, System Information, , 10
WinWaitClose, System Information, , 10

if ErrorLevel {
    Exit 1
}