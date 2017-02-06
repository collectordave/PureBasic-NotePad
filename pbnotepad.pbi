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
;            License: GNUGPL
;          Libraries: 
;      English Forum: 
;       French Forum: 
;       German Forum: 
;   Tested platforms: Windows
;        Description: Simple NotePad Application
; ====================================================
;.......10........20........30........40........50........60........70........80
;}

Enumeration FormWindow
  #Dlg1
EndEnumeration

Enumeration FormGadget
  #Editor1
EndEnumeration

Enumeration FormMenu
  #mnuNew
  #mnuOpen
  #mnuSave
  #mnuSaveAs
  #mnuPrint
  #mnuExit
  #mnuAbout
EndEnumeration

Declare ResizeGadgetsDlg1()

Declare mnuAbout(Event)
Declare mnuOpen(Event)
Declare mnuPrint(Event)
Declare mnuSave(Event)
Declare mnuNew(Event)
Declare mnuSaveAs(Event)
Declare mnuExit(Event)

Procedure OpenDlg1(x = 0, y = 0, width = 568, height = 372)
  OpenWindow(#Dlg1, x, y, width, height, "PBNotepad", #PB_Window_SystemMenu | #PB_Window_MinimizeGadget | #PB_Window_MaximizeGadget | #PB_Window_SizeGadget | #PB_Window_ScreenCentered | #PB_Window_WindowCentered)
  CreateMenu(0, WindowID(#Dlg1))
  MenuTitle("File")
  MenuItem(#mnuNew, "New")
  MenuItem(#mnuOpen, "Open...")
  MenuItem(#mnuSave, "Save")
  MenuItem(#mnuSaveAs, "Save As...")
  MenuBar()
  MenuItem(#mnuPrint, "Print")
  MenuBar()
  MenuItem(#mnuExit, "Exit")
  MenuTitle("Help")
  MenuItem(#mnuAbout, "About")
  EditorGadget(#Editor1, 0, 0, 568, 350, #PB_Editor_WordWrap)
EndProcedure

Procedure ResizeGadgetsDlg1()
  Protected FormWindowWidth, FormWindowHeight
  FormWindowWidth = WindowWidth(#Dlg1)
  FormWindowHeight = WindowHeight(#Dlg1)
  ResizeGadget(#Editor1, 0, 0, FormWindowWidth - 0, FormWindowHeight)
EndProcedure

Procedure Dlg1_Events(event)
  Select event
    Case #PB_Event_SizeWindow
      ResizeGadgetsDlg1()
    Case #PB_Event_CloseWindow
      ProcedureReturn #False

    Case #PB_Event_Menu
      Select EventMenu()
        Case #mnuNew
          mnuNew(EventMenu())
        Case #mnuOpen
          mnuOpen(EventMenu())
        Case #mnuSave
          mnuSave(EventMenu())
        Case #mnuSaveAs
          mnuSaveAs(EventMenu())
        Case #mnuPrint
          mnuPrint(EventMenu())
        Case #mnuExit
          mnuExit(EventMenu())
        Case #mnuAbout
          mnuAbout(EventMenu())
      EndSelect

    Case #PB_Event_Gadget
      Select EventGadget()
      EndSelect
  EndSelect
  ProcedureReturn #True
EndProcedure
; IDE Options = PureBasic 5.60 Beta 1 (Windows - x64)
; CursorPosition = 23
; Folding = -
; EnableXP