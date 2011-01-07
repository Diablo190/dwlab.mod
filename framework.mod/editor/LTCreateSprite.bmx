'
' Digital Wizard's Lab world editor
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Attribution-NonCommercial-ShareAlike 3.0 License terms, as
' specified in the license2.txt file distributed with this
' code, or available from
' http://creativecommons.org/licenses/by-nc-sa/3.0/
'

Type LTCreateSprite Extends LTDrag
	Field StartX:Float
	Field StartY:Float
	Field Sprite:LTActor
	
	
	
	Method DragKey:Int()
		If MouseDown( 2 ) Then Return True
	End Method
	
	
	
	Method DraggingConditions:Int()
		If MenuChecked( Editor.EditSprites ) Then Return True
	End Method
	
	
	
	Method StartDragging()
		StartX = Editor.Cursor.X
		StartY = Editor.Cursor.Y
		Editor.Grid.Snap( StartX, StartY )
		
		Local CurrentSprite:LTActor = Editor.CurrentSprite
		If CurrentSprite Then
			Sprite = New LTActor
			Sprite.Shape = CurrentSprite.Shape
			Sprite.Angle = CurrentSprite.Angle
			Sprite.Velocity = CurrentSprite.Velocity
			Sprite.Frame = CurrentSprite.Frame
		
			Local CurrentSpriteVisualizer:LTImageVisualizer = LTImageVisualizer( CurrentSprite.Visualizer )
			Local Visualizer:LTImageVisualizer = New LTImageVisualizer
			Visualizer.Red = CurrentSpriteVisualizer.Red
			Visualizer.Green = CurrentSpriteVisualizer.Green
			Visualizer.Blue = CurrentSpriteVisualizer.Blue
			Visualizer.Alpha = CurrentSpriteVisualizer.Alpha
			Visualizer.Angle = CurrentSpriteVisualizer.Angle
			Visualizer.Rotating = CurrentSpriteVisualizer.Rotating
			Visualizer.XScale = CurrentSpriteVisualizer.XScale
			Visualizer.YScale = CurrentSpriteVisualizer.YScale
			Visualizer.Scaling = CurrentSpriteVisualizer.Scaling
			Visualizer.Image = CurrentSpriteVisualizer.Image
			Sprite.Visualizer = Visualizer
			
			Editor.SetObjectName( Sprite, CurrentSprite.GetName() )
		Else
			Sprite = New LTActor
			Sprite.Visualizer = New LTImageVisualizer
			Editor.SetObjectName( Sprite, "Sprite" )
		End If
		
		Editor.CurrentPage.Sprites.AddLast( Sprite )
		Editor.SelectSprite( Sprite )
	End Method
	
	
	
	Method Dragging()
		Local X:Float = Editor.Cursor.X
		Local Y:Float = Editor.Cursor.Y
		Editor.Grid.Snap( X, Y )
		Sprite.X = 0.5 * ( X + StartX )
		Sprite.Y = 0.5 * ( Y + StartY )
		Sprite.Width = Abs( X - StartX )
		Sprite.Height = Abs( Y - StartY )
	End Method
	
	
	
	Method EndDragging()
		If Not Sprite.Width Or Not Sprite.Height Then
			Editor.CurrentPage.Sprites.Remove( Sprite )
		Else
			If Not LTImageVisualizer( Sprite.Visualizer ).Image Then Editor.SpriteImageProperties( Sprite )
		End If
		Editor.SetSpriteModifiers( Sprite )
	End Method
End Type