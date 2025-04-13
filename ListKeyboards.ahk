#Requires AutoHotkey v2.0
Persistent ; (Interception hotkeys do not stop AHK from exiting, so use this)
#Include Lib\AutoHotInterception.ahk

ahi := AutoHotInterception()
list := ahi.GetDeviceList()
text := ""

MsgBox list
