'
' Mouse-oriented game menu - Digital Wizard's Lab framework template
' Copyright (C) 2011, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type LTMenuWindow Extends LTWindow
	Const Speed:Double = 8.0
	
	Field Panel:LTShape
	Field DestinationY:Double

	
	
	Method Init()
		Panel = FindShape( "Panel" )
		Super.Init()
	End Method
	
	
	
	Method OnButtonPress( Gadget:LTGadget, ButtonAction:LTButtonAction )
		If ButtonAction <> L_ClickButton Then Return
		Select Gadget.GetParameter( "action" )
			Case "continue", "menu"
				If Y < 0 Then
					Active = False
					DestinationY = 0
					Project.Locked = True
				Else
					Active = False
					DestinationY = -Panel.Height
				End If
			Default
				Super.OnButtonPress( Gadget, ButtonAction )
		End Select
	End Method
	
	
	
	Method Act()
		If AppTerminate() Then Project.LoadWindow( World, , "LTExitWindow" )
		
		If DestinationY = Y Then
		ElseIf Abs( DestinationY - Y ) < 0.01 Then
			Active = True
			Y = DestinationY
			If DestinationY < 0 Then Project.Locked = False
		Else
			SetY( DestinationY + ( Y - DestinationY ) * ( 1.0 - Project.PerSecond( Speed ) ) )
		End If
		Super.Act()
	End Method
End Type