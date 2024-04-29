#SingleInstance force
toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 347, 335
Sleep, 250
	if (!toggle)
		break
	MouseClick, Right, 347, 335
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 397, 527
Sleep, 250
	if (!toggle)
		break
	Send, ^{Tab}
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
