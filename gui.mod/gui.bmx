SuperStrict

Rem
bbdoc: Digital Wizard's Lab framework GUI module
End Rem
Module dwlab.gui

ModuleInfo "Version: 1.0.3"
ModuleInfo "Author: Matt Merkulov"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Modserver: DWLAB"

ModuleInfo "History: &nbsp; &nbsp; "
ModuleInfo "History: v1.0.4 (21.11.11)"
ModuleInfo "History: &nbsp; &nbsp; Added multi-line labels support."
ModuleInfo "History: v1.0.3 (14.11.11)"
ModuleInfo "History: &nbsp; &nbsp; Added mouse wheel actions to GUI buttons list."
ModuleInfo "History: &nbsp; &nbsp; Sliders now can be moved by mouse wheel."
ModuleInfo "History: &nbsp; &nbsp; Label icon class is changed to LTSprite."
ModuleInfo "History: v1.0.2 (14.11.11)"
ModuleInfo "History: &nbsp; &nbsp; Added keys flushing while loading or closing window."
ModuleInfo "History: v1.0.1 (12.10.11)"
ModuleInfo "History: &nbsp; &nbsp; Added optional percentage showing to the slider."
ModuleInfo "History: &nbsp; &nbsp; Rewrote gadget positioning in different-sized screens system."
ModuleInfo "History: &nbsp; &nbsp; Added parameter to align top, bottom or center of window bounds to corresponding side of the camera."
ModuleInfo "History: v1.0 (09.10.11)"
ModuleInfo "History: &nbsp; &nbsp; Initial release."

Import dwlab.frmwork
Import maxgui.localization

Include "include\LTWindow.bmx"
Include "include\LTGadget.bmx"

Global L_LeftMouseButton:LTButtonAction = LTButtonAction.Create( LTMouseButton.Create( 1 ) )
Global L_RightMouseButton:LTButtonAction = LTButtonAction.Create( LTMouseButton.Create( 2 ) )
Global L_MiddleMouseButton:LTButtonAction = LTButtonAction.Create( LTMouseButton.Create( 3 ) )
Global L_MouseWheelDown:LTButtonAction = LTButtonAction.Create( LTMouseWheelAction.Create( -1 ) )
Global L_MouseWheelUp:LTButtonAction = LTButtonAction.Create( LTMouseWheelAction.Create( 1 ) )

Global L_Enter:LTButtonAction = LTButtonAction.Create( LTKeyboardKey.Create( Key_Enter ) )
Global L_Esc:LTButtonAction = LTButtonAction.Create( LTKeyboardKey.Create( Key_Escape ) )

Global L_CharacterLeft:LTButtonAction = LTButtonAction.Create( LTKeyboardKey.Create( Key_Left ) )
Global L_CharacterRight:LTButtonAction = LTButtonAction.Create( LTKeyboardKey.Create( Key_Right ) )
Global L_DeletePreviousCharacter:LTButtonAction = LTButtonAction.Create( LTKeyboardKey.Create( Key_Backspace ) )
Global L_DeleteNextCharacter:LTButtonAction = LTButtonAction.Create( LTKeyboardKey.Create( Key_Delete ) )

Global L_GUIButtons:TList = New TList
L_GUIButtons.AddLast( L_LeftMouseButton )
L_GUIButtons.AddLast( L_RightMouseButton )
L_GUIButtons.AddLast( L_MiddleMouseButton )
L_GUIButtons.AddLast( L_MouseWheelUp )
L_GUIButtons.AddLast( L_MouseWheelDown )
