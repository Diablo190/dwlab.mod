'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type LTListBox Extends LTGadget
	Field ListType:Int = Vertical
	Field Items:TList
	Field ItemSize:Double = 1.0
	Field Shift:Double
	
	
	
	Method GetClassTitle:String()
		Return "List box"
	End Method
	
	
	
	Method Draw()
		Super.Draw()
		If Not Items Then Return
		Local Num:Int = 0
		For Local Item:Object = Eachin Items
			DrawItem( Item, Num, GetItemSprite( Num ) )
			Num :+ 1
		Next
	End Method
	
	
	
	Method GetItemSprite:LTSprite( Num:Int )
		Local Sprite:LTSprite = New LTSprite
		If ListType = Vertical Then
			Sprite.SetSize( Width, ItemSize )
			Sprite.SetCornerCoords( LeftX(), TopY() + Num * ItemSize - Shift )
		Else
			Sprite.SetSize( ItemSize, Height )
			Sprite.SetCornerCoords( LeftX() + Num * ItemSize - Shift, TopY() )
		End If
		Return Sprite
	End Method
	
	
	
	Method DrawItem( Item:Object, Num:Int, Sprite:LTSprite )
	End Method
	
	
	
	Method OnClick( Button:Int )
		If Not Items Then Return
		If ItemSize <= 0 Then Return
		Local Num:Int
		If ListType = Vertical Then
			Num = Floor( ( L_Cursor.Y - TopY() ) / ItemSize )
		Else
			Num = Floor( ( L_Cursor.X - LeftX() ) / ItemSize )
		End If
		If Num < Items.Count() Then OnClickOnItem( Button, Items.ValueAtIndex( Num ), Num )
	End Method
	
	
	
	Method OnClickOnItem( Button:Int, Item:Object, Num:Int )
	End Method
End Type