﻿Procedure SetMainTitle()
  SetWindowTitle(#Dlg1, "PBNotepad - " + GetFilePart(gsFilename))
EndProcedure

Procedure mnuPrint(eventid) 

    Protected hFile = ReadFile(#PB_Any, gsFilename)
    Define PageHeight.i,PageWidth.i,Currentx.i,Currenty.i,Orientation.i,TextSize.i
    Define PrintText.s
    
    If hFile = 0
      MessageRequester("Error", "Couldn't open file")
    Else
      ;Open The Print Job
      CDPrint::Open(GetFilePart(gsFilename),CDPrint::#Preview)
      PageHeight = CDPrint::Printer\Height - (CDPrint::Printer\TopPrinterMargin * 2) ;Useable Height
      PageWidth = CDPrint::Printer\Width - (CDPrint::Printer\LeftPrinterMargin * 2) ;Useable Width
      
      If PageHeight > PageWidth
        Orientation = CDPrint::#Portrait
      Else
        Orientation = CDPrint::#Landscape
      EndIf
      
      ;Add First Page
      CDPrint::AddPage(Orientation)     
      Currentx = 0 
      Currenty = 0
      
      While Eof(hFile) = 0  
        PrintText = ReadString(hFile) 
        
        ;All Print Procedures are in mm so check height
        TextSize = 14 * 0.352777778            ;Convert Font Points To mm
        CountLines = CountLines + 1
        CDPrint::PrintText(Currentx,Currenty,"Arial",14,PrintText)
        If (Currenty + TextSize + 1) => PageHeight
          CDPrint::AddPage(Orientation)
          Currenty = 0 ;CDPrint::Printer\TopPrinterMargin
        Else
          Currenty = Currenty + TextSize + 1
        EndIf
      Wend
      CloseFile(hFile)  
      CDPrint::Finished()
    EndIf
    
EndProcedure

Procedure mnuNew(eventid)
  gsFilename = ""
  SetGadgetText(#Editor1, "")
  SetMainTitle()
EndProcedure

Procedure mnuOpen(eventid)
  Protected sOpenfile.s = OpenFileRequester("Select file to open...", "C:\PB Projects\NotePad\", "", 0)
  If sOpenfile <> ""
    Protected hFile = ReadFile(#PB_Any, sOpenfile)
    If hFile = 0
      MessageRequester("Error", "Couldn't open file")
    Else
      Protected sBuf.s
      sBuf = ReadString(hFile, #PB_Ascii | #PB_File_IgnoreEOL, -1)
      CloseFile(hFile)
      SetGadgetText(#Editor1, sBuf)
      gsFilename = sOpenfile
      SetMainTitle()
    EndIf
  EndIf
EndProcedure


Procedure SaveToFile(sFile.s)
    Protected hFile = CreateFile(#PB_Any, sFile)
    If hFile = 0
      MessageRequester("Error", "Couldn't create file")
    Else
      WriteString(hFile, GetGadgetText(#Editor1), #PB_Ascii)
      CloseFile(hFile)
      gsFilename = sFile
    EndIf
    SetMainTitle()
EndProcedure


Procedure mnuSaveAs(eventid)
  Protected sFile.s = SaveFileRequester("Save file as...", "", "", 0)
  If sFile <> ""
    SaveToFile(sFile)
  EndIf
EndProcedure


Procedure mnuSave(eventid)
  If gsFilename <> ""
    SaveToFile(gsFileName)
  Else
    mnuSaveAs(eventid)
  EndIf
EndProcedure


Procedure mnuExit(eventid)
  End
EndProcedure


Procedure mnuAbout(eventid)
  MessageRequester("PBNotepad", "Simple start to a basic text editor")
EndProcedure
; IDE Options = PureBasic 5.60 Beta 1 (Windows - x64)
; CursorPosition = 23
; FirstLine = 3
; Folding = --
; EnableXP