'
' Mouse-oriented game menu - Digital Wizard's Lab framework template
' Copyright (C) 2011, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type LTLevelSelectionWindow Extends LTAudioWindow
	Global Lock:LTSprite
	
	Method Init()
		Super.Init()
		DestinationY = 0
		Menu.Project.Locked = True
		
		Lock = LTSprite( FindShape( "Lock" ) )
		Remove( Lock )
	End Method
	
	Method Save()
		Local List:LTLevelsList = LTLevelsList( FindShapeWithType( "LTLevelsList" ) )
		If List.SelectedLevel Then
			L_CurrentProfile.LoadLevel( LTLayer( List.SelectedLevel ) )
			Menu.Project.Locked = False
			DestinationY = -LTMenuWindow( Menu.Project.FindWindow( "LTMenuWindow" ) ).Panel.Height
		End If
	End Method
	
	Method DeInit()
		Menu.Project.Locked = False
	End Method
End Type