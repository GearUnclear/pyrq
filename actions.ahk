#SingleInstance force
toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 1822, 560
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 1803, 694
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 2431, 275
Sleep, 250
	if (!toggle)
		break
	Send, ^{Tab}
	if (!toggle)
		break
	MouseClick, Left, 1805, 660
Sleep, 250
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
