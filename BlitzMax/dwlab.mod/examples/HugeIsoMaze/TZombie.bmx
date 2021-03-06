'
' Huge isometric maze - Digital Wizard's Lab example
' Copyright (C) 2011, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type TZombie Extends LTSprite
	Const RotationSpeed:Double = 360.0
	
	Field NewAngle:Double
	Field AnimationSpeed:Double
	
	Method Init()
		Angle = Rnd( 360.0 )
		NewAngle = Angle
		Velocity = Rnd( 1.0, 2.0 )
		AnimationSpeed = 0.2 / Velocity
	End Method
	
	Method Act()
		If Angle <> NewAngle Then
			Local DestinationAngle:Double = NewAngle
			If Abs( Angle - NewAngle ) > 180.0 Then DestinationAngle = NewAngle + 360.0 * Sgn( Angle - NewAngle )
			
			Local DAngle:Double =	Game.PerSecond( RotationSpeed )
			If Abs( DestinationAngle - Angle ) > DAngle Then
				Angle :+ Sgn( NewAngle - Angle ) * DAngle
			Else
				Angle = DestinationAngle
			End If
			L_WrapDouble( Angle, 360.0 )
		Else
			MoveForward()
			CollisionsWithTileMap( Game.Walls, Game.ZombieAndTileCollision )
			CollisionsWithSpriteMap( Game.Objects, Game.ZombieCollision )
		End If
		Animate( AnimationSpeed, 8, 8 * ( ( 5.0 + L_Round( Angle / 45.0 ) ) Mod 8 ) )
	End Method
End Type