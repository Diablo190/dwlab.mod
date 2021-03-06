SuperStrict

Rem
bbdoc: Digital Wizard's Lab framework GUI module
End Rem
Module dwlab.gui

ModuleInfo "Version: 1.0.6"
ModuleInfo "Author: Matt Merkulov"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Modserver: DWLAB"

ModuleInfo "History: &nbsp; &nbsp; "
ModuleInfo "History: v1.0.9 (0.01.13)"
ModuleInfo "History: &nbsp; &nbsp; Implemented tooltips."
ModuleInfo "History: v1.0.8 (08.09.12)"
ModuleInfo "History: &nbsp; &nbsp; Enchanced listbox and slider connection."
ModuleInfo "History: &nbsp; &nbsp; Implemented correct slider and list box moving using mouse wheel."
ModuleInfo "History: v1.0.7 (31.08.12)"
ModuleInfo "History: &nbsp; &nbsp; Fixed some parameter names (replaced underscopes to dashes)."
ModuleInfo "History: v1.0.6.2 (02.06.12)"
ModuleInfo "History: &nbsp; &nbsp; LTGUIProject is rewritten to correspond changed structure of LTProject class and now contains no duplicated code."
ModuleInfo "History: &nbsp; &nbsp; Slider is converted to the single gadget."
ModuleInfo "History: v1.0.6.1 (01.06.12)"
ModuleInfo "History: &nbsp; &nbsp; Added underlined spaces to parameters' names."
ModuleInfo "History: v1.0.6 (31.05.12)"
ModuleInfo "History: &nbsp; &nbsp; Changed halign/valign parameters to texthalign/textvalign."
ModuleInfo "History: &nbsp; &nbsp; Added OnClose() event method to LTWindow."
ModuleInfo "History: v1.0.5 (30.03.12)"
ModuleInfo "History: &nbsp; &nbsp; Now there's also vertical align parameter (valign), horizontal now 'halign'."
ModuleInfo "History: &nbsp; &nbsp; Added textdx, textdy, textshift label parameters for shifting text from alignment point."
ModuleInfo "History: &nbsp; &nbsp; Added pressingdx, pressingdy, pressingshift label parameters for defining of shifting button contents upon pressing."
ModuleInfo "History: &nbsp; &nbsp; Added textcolor label parameter for specifying text color in hex form."
ModuleInfo "History: v1.0.4.1 (29.12.11)"
ModuleInfo "History: &nbsp; &nbsp; Switched Name and Class parameters in FindWindow() and LoadWindow() methods."
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

Include "include\LTGUIProject.bmx"
Include "include\LTWindow.bmx"
Include "include\LTGadget.bmx"
Include "include\LTToolTip.bmx"

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
