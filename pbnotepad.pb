Global gsFilename.s
XIncludeFile("CDPrint.pbi")
XIncludeFile("pbnotepad.pbi")
XIncludeFile("helpers.pbi")

OpenDlg1()

Define event.i
Repeat         ;main message loop
  event = WaitWindowEvent()
  Dlg1_Events (event)
Until event = #PB_Event_CloseWindow
End
; IDE Options = PureBasic 5.60 Beta 1 (Windows - x64)
; CursorPosition = 12
; EnableXP