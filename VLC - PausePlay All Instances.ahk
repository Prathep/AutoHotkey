/*
** VLC-Play-Pause-Sync.ahk - Play/Pause/Stop multiple VLC windows in sync
**
*/

#SingleInstance force
SetTitleMatchMode, 2

VLC_window:="VLC media player ahk_class Qt5QWindowIcon"
GroupAdd, Media, %VLC_window%
return

F8::Send2Win("s", "ahk_group Media")
F9::Send2Win("{Space}", "ahk_group Media")

Send2Win(p_keys, p_window) {
	SetBatchLines, -1
	SetControlDelay, -1

	if (!WinExist(p_window)) {
		errorlevel=1
		return
	}

	WinGet, WindowList, list, %p_window%

	Loop %WindowList% {
		;//WinGetTitle, t, % "ahk_id " WindowList%A_Index%
		;//windows.="`n" t
		;//WinExist("ahk_id " WindowList%A_Index%)
		;//msgbox % "ahk_id " WindowList%A_Index%
		ControlSend, , %p_keys%, % "ahk_id " WindowList%A_Index%
	}
}