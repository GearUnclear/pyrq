#SingleInstance force
toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	MouseClick, Left, 1232, 545
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 1232, 545
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 1436, 566
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 1251, 772
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 830, 17
Sleep, 250
	if (!toggle)
		break
	MouseClick, Left, 1340, 770
Sleep, 250
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
