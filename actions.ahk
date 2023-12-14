#SingleInstance force
toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	
	if (!toggle)
		break
    }
return
