#SingleInstance force
toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 877, 136
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 886, 122
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 862, 241
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 857, 123
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 840, 245
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 845, 116
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 854, 208
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 841, 128
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 841, 215
Sleep, 250
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
