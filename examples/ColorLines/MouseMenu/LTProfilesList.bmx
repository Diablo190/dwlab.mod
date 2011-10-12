'
' Mouse-oriented game menu - Digital Wizard's Lab framework template
' Copyright (C) 2011, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type LTProfilesList Extends LTListBox
	Method Init()
		Super.Init()
		ItemSize = 1.0
		Items = Menu.Profiles
	End Method
	
	Method DrawItem( Item:Object, Num:Int, Sprite:LTSprite )
		Sprite.Visualizer.SetColorFromRGB( 0.0, 0.0, 0.0 )
		If Item = Menu.SelectedProfile Then 
			Sprite.Visualizer.Alpha = 0.2
			Sprite.Draw()
		End If
		SetColor( 0, 0, 0 )
		Sprite.PrintText( LocalizeString( LTProfile( Item ).Name ) )
		LTVisualizer.ResetColor()
	End Method
	
	Method OnButtonPressOnItem( ButtonAction:LTButtonAction, Item:Object, Num:Int )
		If ButtonAction <> L_LeftMouseButton Then Return
		Menu.SelectedProfile = LTProfile( Item )
	End Method
End Type