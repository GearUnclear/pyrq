#Persistent
global recording := false
global events := []

F12::
    recording := true
    events := []
    Tooltip, Recording is ON, 200, 200
return

F11::
    recording := false
    Tooltip, Recording is OFF, 200, 200
    WriteToFile()
return

#If (recording)

; Record key presses for lowercase and uppercase a-z
Loop 52 {
    chr := Chr((A_Index <= 26 ? A_Index + 96 : A_Index + 38)) ; ASCII value for lowercase a is 97 and for uppercase A is 65
    Hotkey, ~*%chr%, RecordKey
}

; Record key presses for uppercase A-Z
Loop 26 {
    chr := Chr(A_Index+64) ; ASCII value for uppercase A is 65
    Hotkey, ~*%chr%, RecordKey
}

; Record Ctrl+Tab key press
~*^Tab::
events.Push({"key": "Tab", "state": GetKeyState("Tab"), "ctrl": GetKeyState("Ctrl"), "shift": GetKeyState("Shift")})
return

; Record left and right mouse click and position
~*LButton::
events.Push({"click": "LButton", "pos": GetMousePos()})
return

~*RButton::
events.Push({"click": "RButton", "pos": GetMousePos()})
return

; Record mouse wheel up and down
~*WheelUp::
events.Push({"scroll": "WheelUp", "pos": GetMousePos()})
return

~*WheelDown::
events.Push({"scroll": "WheelDown", "pos": GetMousePos()})
return

#If

RecordKey:
events.Push({"key": SubStr(A_ThisHotkey, 3), "state": GetKeyState(SubStr(A_ThisHotkey, 3)), "ctrl": GetKeyState("Ctrl"), "shift": GetKeyState("Shift")})
return

GetMousePos() {
    MouseGetPos, x, y
    return {x: x, y: y}
}

WriteToFile() {
    FileDelete, C:\Users\danewagenhoffer\pyrq\events.txt
    FileAppend, % FormatEvents(), C:\Users\danewagenhoffer\pyrq\events.txt
    Tooltip, Events saved, 200, 200
}

FormatEvents() {
    result := ""
    for i, event in events {
        if (event.HasKey("key")) {
            result .= "Key: " event.key ", State: " (event.state ? "Down" : "Up") ", Ctrl: " (event.ctrl ? "Yes" : "No") ", Shift: " (event.shift ? "Yes" : "No") "`n"
        } else if (event.HasKey("click")) {
            result .= "Click: " event.click ", Position: x" event.pos.x ", y" event.pos.y "`n"
        } else if (event.HasKey("scroll")) {
            result .= event.scroll "`n"
        }
    }
    return result
}
