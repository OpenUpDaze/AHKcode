; 此脚本用来改变CapsLock功能，
; 1 双击时，开启/关闭大写锁定
; 2 长按+ uiojkl起到方向键的功能
#SingleInstance, Force
SendMode Input             ;SendMode设置send命令的模式，改为input
SetWorkingDir, %A_ScriptDir%   ; SetWorkingDir改变脚本的当前工作目录。
#InstallKeybdHook   ;此指令还会让脚本变成 持续运行的

; 双击来开关CapsLock，当时间调较大时，单击也行
$CapsLock::             ; 加$会抑制原来的键，使它失效
    KeyWait, CapsLock       ;KeyWait等待CapsLock被松开或按下。本代码中时间很快，第一次按下CapsLock再松开即完成本行
    If (A_PriorKey="CapsLock") and (A_TimeSincePriorHotkey < 500)   ;A_TimeSincePriorHotkey单位是ms
    SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off":"On"  ;设置CapsLock状态，打开时GetKeyState("CapsLock","T")为True，表达式为off
Return

#If, GetKeyState("CapsLock", "P")
    i::Up
    Return
    j::Left
    Return
    k::Down
    Return
    l::Right
    Return
    u::                 ;两种风格的写法
    {
        Send, {Home}
        return
    } 
    o::
    {

        Send, {End}
        return
    }

    




