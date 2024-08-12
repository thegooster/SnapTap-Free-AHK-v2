#Requires AutoHotkey v2.0
#SingleInstance Force
InstallKeybdHook
#UseHook
#MaxThreadsPerHotkey 1
SetWorkingDir A_ScriptDir
KeyHistory 0
ListLines False
SetKeyDelay -1, -1
SendMode "Input"
ProcessSetPriority "High"
A_MaxHotkeysPerInterval := 99000000
MyCurrentTimerResolution := 0
DllCall("ntdll\ZwSetTimerResolution", "Int", 5000, "Int", 1, "Int*", &MyCurrentTimerResolution)

global aKeyState := 0
global dKeyState := 0

$a::
{
    global aKeyState, dKeyState
    Critical
    if (aKeyState == 0) {
        Send "{a down}"
        aKeyState := 1
        if (dKeyState == 1) {
            Send "{d up}"
        }
    }
}

$a up::
{
    global aKeyState, dKeyState
    Critical
    if (aKeyState == 1) {
        Send "{a up}"
        aKeyState := 0
        if (dKeyState == 1) {
            Send "{d down}"
        }
    }
}

$d::
{
    global aKeyState, dKeyState
    Critical
    if (dKeyState == 0) {
        Send "{d down}"
        dKeyState := 1
        if (aKeyState == 1) {
            Send "{a up}"
        }
    }
}

$d up::
{
    global aKeyState, dKeyState
    Critical
    if (dKeyState == 1) {
        Send "{d up}"
        dKeyState := 0
        if (aKeyState == 1) {
            Send "{a down}"
        }
    }
}
