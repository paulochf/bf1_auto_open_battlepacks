; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;#z::Run www.autohotkey.com

getRelCoord(Coord, Total) {
	return Coord / Total
}
getRawCoord(Coord, Total) {
	return Coord * Total
}

getRelPos(x, y) {
	rawX := getRawCoord(x, A_ScreenWidth)
	rawY := getRawCoord(y, A_ScreenHeight)

	return [Round(rawX), Round(rawY)]
}

clickRel(x, y) {
	convCoords := getRelPos(x, y)
	
	MouseClick, left, convCoords[1], convCoords[2]
	Return
}

F6::
If WinExist("ahk_exe bf1.exe") {
	Gui, 1:Destroy
	CoordMode, Mouse, Window
	WinActivate, ahk_exe bf1.exe
	Gui, 1:Add, Text,, Open Battlepacks #
	Gui, 1:Add, Edit
	Gui, 1:Add, UpDown, vCliques1 Range1-100000000, 10, 0x80
	Gui, 1:Add, Button, x9 y50 w122 Default, Open
	Gui, 1:Add, Progress, x9 y77 w122 h20 cBlue backgroundWhite -Smooth vCliquesProgresso1, 0
	Gui, 1:Show, AutoSize
	WinSet, AlwaysOnTop, On, AutoHotKey
	Return

	ButtonOpen:
		Gui, 1:Submit, NoHide
		WinActivate, ahk_exe bf1.exe

		iCliques1 := 0
		Loop %Cliques1% {
			clickRel(.25, .63)
			Sleep, 2000
			clickRel(1/12, 11/12)  ; skip
			Sleep, 1500
			clickRel(1/12, 11/12)  ; skip
			Sleep, 1500
			clickRel(1/12, 11/12)  ; skip
			Sleep, 500
			clickRel(.5, .6)       ; add to inventory
			Sleep, 2000
			clickRel(.5, .57)      ; add to inventory

			iCliques1+=1
			ProgressVal1 := (100*iCliques1) / Cliques1
			GuiControl, 1:, CliquesProgresso1, %ProgressVal1%
			SB_SetText("Clicando " . iCliques1 . "/" . Cliques1)
			Sleep 2000
		}

		WinActivate
		Return

	1GuiEscape:
	1GuiClose:
		GuiControl, -Default, Open
		Gui, 1:Destroy
		Return
}
Return

F7::
If WinExist("ahk_exe bf1.exe") {
	Gui, 2:Destroy
	CoordMode, Mouse, Window
	WinActivate, ahk_exe bf1.exe
	Gui, 2:Add, Text,, Sell Items #
	Gui, 2:Add, Edit
	Gui, 2:Add, UpDown, vCliques2 Range1-100000000, 1, 0x80
	Gui, 2:Add, Button, x9 y50 w122 Default, Sell
	Gui, 2:Add, Progress, x9 y77 w122 h20 cBlue backgroundWhite -Smooth vCliquesProgresso2, 0
	Gui, 2:Show, AutoSize
	WinSet, AlwaysOnTop, On, AutoHotKey
	Return

	2ButtonSell:
		Gui, 2:Submit, NoHide
		WinActivate, ahk_exe bf1.exe

		iCliques2 := 0
		Loop %Cliques2% {
			clickRel(.66, .60)  ; scrap for 270 button
			Sleep, 500
			clickRel(.45, .53)  ; yes

			iCliques2+=1
			ProgressVal2 := (100*iCliques2) / Cliques2
			GuiControl, 2:, CliquesProgresso2, %ProgressVal2%
			SB_SetText("Clicando " . iCliques2 . "/" . Cliques2)
			Sleep 4000
		}

		WinActivate
		Return

	2GuiEscape:
	2GuiClose:
		GuiControl, -Default, 2Sell
		Gui, 2:Destroy
		Return
}
Return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
