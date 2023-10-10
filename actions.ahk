toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 1060, 438
Sleep, 200
	if (!toggle)
		break
	MouseClick, Left, 1118, 438
Sleep, 200
	if (!toggle)
		break
	MouseClick, Left, 1060, 439
Sleep, 200
	if (!toggle)
		break
	MouseClick, Left, 988, 293
Sleep, 200
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
