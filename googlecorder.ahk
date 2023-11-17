#Persistent
global recording := false
global events := []
global isDragging := false

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
    chr := Chr((A_Index <= 26 ? A_Index + 96 : A_Index + 38))
    Hotkey, ~*%chr%, RecordKey
}

; Record Ctrl+Tab key press
~*^Tab::
events.Push({"type": "Key", "key": "Tab", "time": A_TickCount})
return

; Record left and right mouse click and position
~*LButton::
events.Push({"type": "Click", "button": "LButton", "pos": GetMousePos(), "time": A_TickCount})
SetTimer, CheckDrag, 10 ; Start checking for drag
return

~*LButton Up::
SetTimer, CheckDrag, Off ; Stop checking for drag
if (isDragging) {
    isDragging := false
    events.Push({"type": "DragEnd", "button": "LButton", "pos": GetMousePos(), "time": A_TickCount})
}
return

~*RButton::
events.Push({"type": "Click", "button": "RButton", "pos": GetMousePos(), "time": A_TickCount})
return

; Record mouse wheel up and down
~*WheelUp::
events.Push({"type": "Wheel", "direction": "WheelUp", "pos": GetMousePos(), "time": A_TickCount})
return

~*WheelDown::
events.Push({"type": "Wheel", "direction": "WheelDown", "pos": GetMousePos(), "time": A_TickCount})
return

#If

RecordKey:
events.Push({"type": "Key", "key": SubStr(A_ThisHotkey, 3), "time": A_TickCount})
return

GetMousePos() {
    MouseGetPos, x, y
    return {x: x, y: y}
}

CheckDrag:
    if (GetKeyState("LButton", "P") && !isDragging) {
        isDragging := true
        MouseGetPos, startX, startY
        events.Push({"type": "DragStart", "button": "LButton", "startPos": {"x": startX, "y": startY}, "time": A_TickCount})
    }
return

WriteToFile() {
    FileDelete, C:\Users\danewagenhoffer\pyrq\events.txt
    FileAppend, % FormatEvents(), C:\Users\danewagenhoffer\pyrq\events.txt
    Tooltip, Events saved, 200, 200
}

FormatEvents() {
    result := ""
    for i, event in events {
        result .= FormatEvent(event) . "`n"
    }
    return result
}

FormatEvent(event) {
    if (event.type = "Key") {
        return "Key: " event.key ", Time: " event.time
    } else if (event.type = "Click") {
        return "Click: " event.button ", Position: x" event.pos.x ", y" event.pos.y ", Time: " event.time
    } else if (event.type = "Wheel") {
        return event.direction ", Position: x" event.pos.x ", y" event.pos.y ", Time: " event.time
    } else if (event.type = "DragStart") {
        return "Drag Start: " event.button ", Position: x" event.startPos.x ", y" event.startPos.y ", Time: " event.time
    } else if (event.type = "DragEnd") {
        return "Drag End: " event.button ", Position: x" event.pos.x ", y" event.pos.y ", Time: " event.time
    }
}
