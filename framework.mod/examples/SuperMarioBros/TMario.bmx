'
' Super Mario Bros - Digital Wizard's Lab example
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type TMario Extends TMovingObject
	Field MovingStartTime:Float
	Field OnLand:Int
	Field Big:Int = False
	Field Fireable:Int = False
	Field Invulnerable:Int = False
	Field Growing:Int = False
	Field GrowthStartingTime:Float = -99.0
	
	
	
	Method HandleCollisionWithSprite( Sprite:LTSprite, CollisionType:Int )
		If TBonus( Sprite ) Then
			TBonus( Sprite ).Collect()
			Game.MainLayer.Remove( Sprite )
			Game.MovingObjects.RemoveSprite( Sprite )
		ElseIf TEnemy( Sprite ) Then
			Game.Over = True
			Frame = 6
			DY = -16.0
			Game.MusicChannel.Stop()
			Game.MusicChannel = Game.MarioDie.Play()
		End If
	End Method
	
	
	
	Method HandleCollisionWithTile( TileMap:LTTileMap, TileX:Int, TileY:Int, CollisionType:Int )
		If CollisionType = Vertical Then
			If DY >= 0.0 Then 
				OnLand = True
			Else
				Local TileNum:Int = TileMap.FrameMap.Value[ TileX, TileY ]
				Select TileNum
					Case 9, 10, 11, 13, 16, 17, 18, 27
						TBlock.FromTile( TileX, TileY, TileNum )
				End Select
			End If
			DY = 0
		End If
		PushFromTile( TileMap, TileX, TileY )
	End Method
	
	
	
	Method Act()
		DY :+ L_DeltaTime * 32.0
		
		If Game.Over Then
			Move( 0, DY )
		Else
			Local Direction:Float = 0.0
			If KeyDown( Key_Left ) Then Direction = -1.0
			If KeyDown( Key_Right ) Then Direction = 1.0
			
			If KeyDown( Key_Up ) And OnLand Then
				Game.Jump.Play()
				DY = -17.0
				Frame = 4
			ElseIf Direction = 0.0 Then 
				MovingStartTime = Game.Time
				Local DDX:Float = L_DeltaTime * 32.0
				If DDX < Abs( DX ) Then
					DX :- Sgn( DX ) * DDX
				Else
					DX = 0.0
				End If
				If OnLand Then Frame = 0
			Else
				If OnLand Then Animate( Game, 0.15, 3, 1, MovingStartTime )
				If Sgn( DX ) = Direction Then
					Visualizer.XScale = Direction
					'DX :+ Direction * L_DeltaTime * 8.0
					'If Abs( DX ) > 10.0 Then DX = Sgn( DX ) * 10.0
					DX = Direction * 5.0
				Else
					If OnLand Then Frame = 5
					DX :+ Direction * L_DeltaTime * 32.0
				End If
				'Move( 5.0 * Direction, 0.0 )
			End If
			
			LimitWith( Game.MainLayer.FindTilemap() )
			
			L_CurrentCamera.JumpTo( Self )
			L_CurrentCamera.LimitWith( Game.MainLayer.FindTilemap() )
			
			OnLand = False
		
			Super.Act()
		End If		
	End Method
	
	
	
	Method SetGrowth()
		Y :- 0.5
		Height = 2.0
		Visualizer = Game.Growth
		Frame = 0
		Big = True
		Growing = True
		GrowthStartingTime = Game.Time
		PlaySound( Game.Powerup )
	End Method
End Type