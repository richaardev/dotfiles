#Requires AutoHotkey v2.0

; *CapsLock::return

; CapsLock & I::Up
; CapsLock & J::Left
; CapsLock & K::Down
; CapsLock & L::Right

LShift & Esc:: {
    if (GetKeyState("Ctrl", "P")) {
        Run "C:\Windows\System32\Taskmgr.exe"
    } else {
        Send "{Blind}{LShift up}{`"}"
    }
    return
}

RShift & Esc:: Send "{Blind}{RShift up}{'}"
