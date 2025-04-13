#Requires AutoHotkey v2.0
#Include Lib\AutoHotInterception.ahk

sendMidiPath := "sendmidi.exe" ; <- ścieżka do sendmidi.exe
midiPort := "keyboard"         ; <- nazwa portu LoopMIDI

keyboardId := 8                ; <- ID z ListKeyboards.ahk
AHI := AutoHotInterception()

; Klawisze od 0 do 9
AHI.SubscribeKey(keyboardId, GetKeySC("0"), true, (state) => KeyEvent(state, 0))
AHI.SubscribeKey(keyboardId, GetKeySC("1"), true, (state) => KeyEvent(state, 1))
AHI.SubscribeKey(keyboardId, GetKeySC("2"), true, (state) => KeyEvent(state, 2))
AHI.SubscribeKey(keyboardId, GetKeySC("3"), true, (state) => KeyEvent(state, 3))
AHI.SubscribeKey(keyboardId, GetKeySC("4"), true, (state) => KeyEvent(state, 4))
AHI.SubscribeKey(keyboardId, GetKeySC("5"), true, (state) => KeyEvent(state, 5))
AHI.SubscribeKey(keyboardId, GetKeySC("6"), true, (state) => KeyEvent(state, 6))
AHI.SubscribeKey(keyboardId, GetKeySC("7"), true, (state) => KeyEvent(state, 7))
AHI.SubscribeKey(keyboardId, GetKeySC("8"), true, (state) => KeyEvent(state, 8))
AHI.SubscribeKey(keyboardId, GetKeySC("9"), true, (state) => KeyEvent(state, 9))
AHI.SubscribeKey(keyboardId, GetKeySC("A"), true, (state) => KeyEvent(state, 10))
AHI.SubscribeKey(keyboardId, GetKeySC("B"), true, (state) => KeyEvent(state, 11))
AHI.SubscribeKey(keyboardId, GetKeySC("C"), true, (state) => KeyEvent(state, 12))
AHI.SubscribeKey(keyboardId, GetKeySC("D"), true, (state) => KeyEvent(state, 13))

KeyEvent(state, note) {
    global sendMidiPath, midiPort

    if state {
        ; Note ON z velocity 1
        cmd := sendMidiPath . ' dev "' . midiPort . '" on ' . note . ' 127'
    } else {
        ; Note OFF z velocity 0
        cmd := sendMidiPath . ' dev "' . midiPort . '" off ' . note . ' 0'
    }

    RunWait cmd, , "Hide"
}

^Esc::ExitApp
