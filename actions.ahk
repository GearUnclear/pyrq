toggle := false
#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself
F1::
    toggle := !toggle
    while (toggle) {
	Sleep, 4183387000
MouseClick, Left, 1456, 734
Sleep, 250
	if (!toggle)
		break
	Sleep, 15
; Drag Start at 1456, 734
	if (!toggle)
		break
	Sleep, 1219
MouseClickDrag, Left, 1456, 734, 1449, 989
Sleep, 250
	if (!toggle)
		break
	
	if (!toggle)
		break
    }
return
