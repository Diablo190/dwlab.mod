'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Rem
bbdoc: Global variable for debug visualizer.
End Rem
Global L_DebugVisualizer:LTDebugVisualizer = New LTDebugVisualizer

Global L_CollisionColors:LTColor[] = [ LTColor.FromHex( "FF007F", 0.5 ), LTColor.FromHex( "007FFF", 0.5 ), ..
		LTColor.FromHex( "00FF7F", 0.5 ), LTColor.FromHex( "7F00FF", 0.5 ), LTColor.FromHex( "7FFF00", 0.5 ), ..
		LTColor.FromHex( "FF7F00", 0.5 ), LTColor.FromHex( "FFFFFF", 0.5 ), LTColor.FromHex( "000000", 0.5 ) ]
Global L_MaxCollisionColor:Int = L_CollisionColors.Length - 1

Rem
bbdoc: This visualizer can draw collision shape, vector and name of the shape with this shape itself.
about: See also #WedgeOffWithSprite example
End Rem
Type LTDebugVisualizer Extends LTVisualizer
	Global TextVisualizer:LTVisualizer = New LTVisualizer

	Field ShowCollisionShapes:Int = True
	Field ShowVectors:Int = True
	Field ShowNames:Int = True
	Field AlphaOfInvisible:Double = 0.5
	
	
	
	Method DrawUsingSprite( Sprite:LTSprite, SpriteShape:LTSprite = Null, DrawingAlpha:Double )
		If Not SpriteShape Then SpriteShape = Sprite
		
		If Sprite.Visible Then
			Sprite.Visualizer.DrawUsingSprite( Sprite, SpriteShape, DrawingAlpha )
		Else
			Sprite.Visualizer.DrawUsingSprite( Sprite, SpriteShape, DrawingAlpha* AlphaOfInvisible )
		End If

		Local SX1:Double, SY1:Double, SWidth:Double, SHeight:Double
		L_CurrentCamera.FieldToScreen( SpriteShape.X, SpriteShape.Y, SX1, SY1 )
		L_CurrentCamera.SizeFieldToScreen( SpriteShape.Width, SpriteShape.Height, SWidth, SHeight )
		
		L_CollisionColors[ Sprite.CollisionLayer & L_MaxCollisionColor ].ApplyColor( DrawingAlpha )
		If ShowCollisionShapes Then	DrawSpriteShape( SpriteShape )
		
		If ShowVectors Then
			Local Size:Double = Max( SWidth, SHeight )
			If Size Then
				Local SX2:Double = SX1 + Cos( Sprite.Angle ) * Size
				Local SY2:Double = SY1 + Sin( Sprite.Angle ) * Size
				DrawLine( SX1, SY1, SX2, SY2 )
				For Local D:Double = -135 To 135 Step 270
					DrawLine( SX2, SY2, SX2 + 5.0 * Cos( Sprite.Angle + D ), SY2 + 5.0 * Sin( Sprite.Angle + D ) )
				Next
			End If
		End If
		
		If Sprite.ParameterExists( "text" ) Then
			Local Text:String = Sprite.GetParameter( "text" )
			
			Local HMargin:Double, VMargin:Double
			If Sprite.ParameterExists( "text-margin" ) Then
				HMargin = Sprite.GetParameter( "text-margin" ).ToDouble()
				VMargin = HMargin
			Else
				HMargin = Sprite.GetParameter( "text-h-margin" ).ToDouble()
				VMargin = Sprite.GetParameter( "text-v-margin" ).ToDouble()
			End If
			
			Local HAlign:Int
			Select Sprite.GetParameter( "text-h-align" )
				Case "left"
					HAlign = LTAlign.ToLeft
				Case "right"
					HAlign = LTAlign.ToRight
				Default
					HAlign = LTAlign.ToCenter
			End Select
			
			Local VAlign:Int
			Select Sprite.GetParameter( "text-v-align" )
				Case "top"
					VAlign = LTAlign.ToTop
				Case "bottom"
					VAlign = LTAlign.ToBottom
				Default
					VAlign = LTAlign.ToCenter
			End Select
			
			Local TextSize:Double = 0.5
			If Sprite.ParameterExists( "text-size" ) Then TextSize = Sprite.GetParameter( "text-size" ).ToDouble()
			
			If Sprite.ParameterExists( "text-color" ) Then
				TextVisualizer.SetColorFromHex( Sprite.GetParameter( "text-color" ) )
			Else
				TextVisualizer.SetColorFromRGB( 0.0, 0.0, 0.0 )
			End If
			TextVisualizer.ApplyColor( DrawingAlpha )
	
			Sprite.PrintText( Text, TextSize, HAlign, VAlign, HMargin, VMargin )
			
			ResetColor()
		ElseIf ShowNames Then
			Local Title:String = Sprite.GetTitle()
			Local TxtWidth:Int = 0.5 * TextWidth( Title )
			SetColor( 0, 0, 0 )
			For Local DY:Int = -1 To 1
				For Local DX:Int = -( DY = 0 ) To Abs( DY = 0 ) Step 2
					DrawText( Title, SX1 + DX - TxtWidth, SY1 + DY )
				Next
			Next
			ResetColor()
			DrawText( Title, SX1 - TxtWidth, SY1 )
		End If
	End Method	
	
	
	
	Method DrawUsingTileMap( TileMap:LTTileMap, Shapes:TList = Null, DrawingAlpha:Double )
		TileMap.Visualizer.DrawUsingTileMap( TileMap, Shapes, DrawingAlpha )
		If ShowCollisionShapes Then Super.DrawUsingTileMap( TileMap, Shapes, DrawingAlpha )
	End Method
	
	
	
	Method DrawTile( TileMap:LTTileMap, X:Double, Y:Double, Width:Double, Height:Double, TileX:Int, TileY:Int )
		Local Shape:LTShape = TileMap.GetTileCollisionShape( TileMap.WrapX( TileX ), TileMap.WrapY( TileY ) )
		If Not Shape Then Return
		
		SetScale( 1.0, 1.0 )
		Local Sprite:LTSprite = LTSprite( Shape )
		If Sprite Then
			DrawCollisionSprite( TileMap, X, Y, Sprite )
		Else
			For Sprite = Eachin LTLayer( Shape )
				DrawCollisionSprite( TileMap, X, Y, Sprite )
			Next
		End If
	End Method
	
	
	
	Method DrawCollisionSprite( TileMap:LTTileMap, X:Double, Y:Double, Sprite:LTSprite )
		L_CollisionColors[ Sprite.CollisionLayer & L_MaxCollisionColor ].ApplyColor( 1.0 )
	
		Local TileWidth:Double = TileMap.GetTileWidth()
		Local TileHeight:Double = TileMap.GetTileHeight()
		
		If L_CurrentCamera.Isometric Then
			Local ShapeX:Double = X + ( Sprite.X - 0.5 ) * TileWidth
			Local ShapeY:Double = Y + ( Sprite.Y - 0.5 ) * TileHeight
			Local ShapeWidth:Double = Sprite.Width * TileWidth
			Local ShapeHeight:Double = Sprite.Height * TileHeight
			Select Sprite.ShapeType.GetNum()
				Case LTSprite.Pivot.GetNum()
					Local SX:Double, SY:Double
					L_CurrentCamera.FieldToScreen( ShapeX, ShapeY, SX, SY )
					DrawOval( SX - 2, SY - 2, 5, 5 )
				Case LTSprite.Oval.GetNum()
					DrawIsoOval( ShapeX, ShapeY, ShapeWidth, ShapeHeight )
				Case LTSprite.Rectangle.GetNum()
					DrawIsoRectangle( ShapeX, ShapeY, ShapeWidth, ShapeHeight )
			End Select		
		Else
			Local SX:Double, SY:Double
			L_CurrentCamera.FieldToScreen( X + ( Sprite.X - 0.5 ) * TileWidth, Y + ( Sprite.Y - 0.5 ) * TileHeight, SX, SY )
			
			Local SWidth:Double, SHeight:Double
			L_CurrentCamera.SizeFieldToScreen( Sprite.Width * TileWidth, Sprite.Height * TileHeight, SWidth, SHeight )
			
			LTSpriteHandler.HandlersArray[ Sprite.ShapeType.GetNum() ].DrawShape( Sprite, Sprite, SX, SY, SWidth, SHeight )
		End If
	End Method
	
	
	
	Method DrawSpriteMapTile( SpriteMap:LTSpriteMap, X:Double, Y:Double )
		SetScale( 1.0, 1.0 )
		Local TileX:Int = Int( Floor( X / SpriteMap.CellWidth ) ) & SpriteMap.XMask
		Local TileY:Int = Int( Floor( Y / SpriteMap.CellHeight ) ) & SpriteMap.YMask
		For Local N:Int = 0 Until SpriteMap.ListSize[ TileX, TileY ]
			DrawUsingSprite( SpriteMap.Lists[ TileX, TileY ][ N ], , GetAlpha() )
		Next
	End Method
End Type