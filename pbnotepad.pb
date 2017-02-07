;{ ==Code Header Comment==============================
;         Name/title: pbNotePad.pb
;    Executable name: N/A
;            Version: 1.0.0
;    Original Author: Keya
;     Print Added By: collectordave
;     Translation by: 
;        Create date: 05\Feb\2017
;  Previous releases: 
;  This Release Date: 05\Feb\2017 
;   Operating system: Windows  [X]GUI
;   Compiler version: PureBasic 5.6B2 (x64)
;          Copyright: (C)2017
;            License: Credit Only
;          Libraries: 
;      English Forum: 
;       French Forum: 
;       German Forum: 
;   Tested platforms: Windows
;        Description: Simple NotePad Application
; ====================================================
;.......10........20........30........40........50........60........70........80
;}
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
; CursorPosition = 13
; Folding = -
; EnableXP