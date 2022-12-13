#SingleInstance, Force
SendMode Input             ;SendMode设置send命令的模式，改为input
SetWorkingDir, %A_ScriptDir%   ; SetWorkingDir改变脚本的当前工作目录。
;#InstallKeybdHook   ;此指令还会让脚本变成 持续运行的

SetWindelay,0
CoordMode,Mouse,Screen

$CapsLock::             ; 加$会抑制原来的键，使它失效
  KeyWait, CapsLock       ;等待CapsLock被松开或按下。
  If (A_PriorKey="CapsLock") and (A_TimeSincePriorHotkey < 500)   ;A_TimeSincePriorHotkey单位是ms
    SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off":"On"  ;设置CapsLock状态，打开时GetKeyState("CapsLock","T")为True，表达式为off
Return

MouseGetPos,x,y,win
WinGetPos,x1,y1,,,ahk_id %win%
a=%x1%
b=%y1%

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
    ; h::BackSpace
    ; Return

#If  
$F12::  

StartTime := A_TickCount

MouseGetPos,x,y,win
WinGetPos,x1,y1,,,ahk_id %win%
a=%x1%
b=%y1%

loop{

MouseGetPos,x2,y2
c=%x2%
d=%y2%
c-=%x%
d-=%y%
a+=%c%
b+=%d%
x=%x2%
y=%y2%
Winmove,ahk_id %win%,,%a%,%b%

getkeystate,var,F12,p   

if var=U
return

Sleep,20
continue
}



ElapsedTime := A_TickCount - StartTime

intInterval := 200 

if (ElapsedTime > intInterval)
{
    return
}

send {F12}

return









