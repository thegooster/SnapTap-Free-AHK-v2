#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook
SetWorkingDir A_ScriptDir
KeyHistory 0
ListLines False
SetControlDelay -1
SetKeyDelay -1, -1
SendMode "Input"
ProcessSetPriority "High"

global lastKey := ""
global aKey := false
global dKey := false

$a::
$d::
{
    Critical
    global lastKey, aKey, dKey
    thisHotkey := A_ThisHotkey
    currentKey := SubStr(thisHotkey, 2)
    if (currentKey != lastKey) {
        if (lastKey)
            Send "{" lastKey " up}"
        Send "{" currentKey " down}"
        lastKey := currentKey
    }
    %currentKey%Key := true
}

$a up::
$d up::
{
    Critical
    global lastKey, aKey, dKey
    thisHotkey := A_ThisHotkey
    currentKey := SubStr(thisHotkey, 2, 1)
    %currentKey%Key := false
    otherKey := (currentKey = "a") ? "d" : "a"
    
    if (%otherKey%Key) {
        Send "{" currentKey " up}{" otherKey " down}"
        lastKey := otherKey
    } else {
        Send "{" currentKey " up}"
        lastKey := ""
    }
}