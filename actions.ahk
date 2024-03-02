#SingleInstance force
toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 673, 298
Sleep, 250
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
