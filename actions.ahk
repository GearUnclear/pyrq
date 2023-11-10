toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 363, 394
Sleep, 1000
	if (!toggle)
		break
	MouseClick, Left, 890, 122
Sleep, 1000
	if (!toggle)
		break
	MouseClick, Left, 615, 438
Sleep, 1000
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
