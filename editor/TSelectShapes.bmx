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

Type TSelectShapes Extends LTDrag
	Field StartX:Float, StartY:Float
	Field Frame:LTSprite


	Method DraggingConditions:Int()
		If Not Editor.CurrentTilemap And Not Editor.ShapeUnderCursor And Not Editor.MoveShape.DraggingState..
		 And Not Editor.SelectedModifier And Not Editor.ModifyShape.DraggingState Then Return True
	End Method
	
	
	
	Method DragKey:Int()
		If MouseDown( 1 ) Then Return True
	End Method
	
	
	
	Method StartDragging()
		StartX = Editor.Cursor.X
		StartY = Editor.Cursor.Y
		Frame = New LTSprite
		Frame.ShapeType = LTSprite.Rectangle
		Editor.SelectedShapes.Clear()
		Editor.Modifiers.Clear()
	End Method
	
	
	
	Method Dragging()
		Frame.X = 0.5 * ( StartX + Editor.Cursor.X )
		Frame.Y = 0.5 * ( StartY + Editor.Cursor.Y )
		Frame.Width = Abs ( StartX - Editor.Cursor.X )
		Frame.Height = Abs ( StartY - Editor.Cursor.Y )
	End Method
	
	
	
	Method EndDragging()
		Editor.CurrentShape = Null
		ProcessLayer( Editor.CurrentLayer )
		Editor.FillShapeFields()
		Editor.RefreshProjectManager()
		Frame = Null
	End Method
	
	
	
	Method ProcessLayer( ParentLayer:LTLayer )
		For Local Shape:LTShape = Eachin ParentLayer.Children
			Local Layer:LTLayer = LTLayer( Shape )
			If Layer Then
				ProcessLayer( Layer )
			Else
				Local Sprite:LTSprite = LTSprite( Shape )
				If Sprite Then
					If Frame.Overlaps( Sprite ) Then
						Editor.SelectedShapes.AddLast( Shape )
						If Not Editor.CurrentShape Then Editor.CurrentShape = Sprite
					End If
				End If
			End If
		Next
	End Method
End Type