#Requires AutoHotkey v2.0

LShift & Esc:: {
    if (GetKeyState("Ctrl", "P")) {
        Run "C:\Windows\System32\Taskmgr.exe"
    } else {
        Send "{Blind}{LShift up}{`"}"
    }
    return
}

RShift & Esc:: Send "{Blind}{RShift up}{'}"
