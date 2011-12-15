SuperStrict

Framework brl.basic
Import dwlab.frmwork
Import dwlab.graphicsdrivers

SeedRnd( MilliSecs() )
Global Example:TExample = New TExample
Example.Execute()

Const MapSize:Int = 192

Type TExample Extends LTProject
	Const SpritesQuantity:Int = 1000
	
	Field Rectangle:LTShape = LTSprite.FromShape( 0, 0, MapSize, MapSize )
	Field Cursor:LTSprite = LTSprite.FromShape( 0, 0, 0, 0, LTSprite.Pivot )
	Field SpriteMap:LTSpriteMap = LTSpriteMap.CreateForShape( Rectangle, 2.0 )
	
	Method Init()
		For Local N:Int = 1 To SpritesQuantity
			TBall.Create()
		Next
		Rectangle.Visualizer = LTContourVisualizer.FromWidthAndHexColor( 0.1, "FF0000" )
		L_InitGraphics()
		L_CurrentCamera.DX = 4
		L_CurrentCamera.DY = 4
	End Method
	
	Method Logic()
		SpriteMap.Act()
		L_CurrentCamera.MoveForward()
		L_CurrentCamera.BounceInside( Rectangle )
		If AppTerminate() Or KeyHit( Key_Escape ) Then Exiting = True
	End Method

	Method Render()
		SpriteMap.Draw()
		Rectangle.Draw()
	End Method
End Type



Type TBall Extends LTSprite
	Function Create:TBall()
		Local Ball:TBall = New TBall
		Ball.SetCoords( Rnd( -0.5 * ( MapSize - 2 ), 0.5 * ( MapSize - 2 ) ), Rnd( -0.5 * ( MapSize - 2 ), 0.5 * ( MapSize - 2 ) ) )
		Ball.SetDiameter( Rnd( 0.5, 1.5 ) )
		Ball.Angle = Rnd( 360 )
		Ball.Velocity = Rnd( 3, 7 )
		Ball.ShapeType = LTSprite.Oval
		Ball.Visualizer.SetRandomColor()
		Example.SpriteMap.InsertSprite( Ball )
		Return Ball
	End Function
	
	Method Act()
		L_CurrentCamera.BounceInside( Example.Rectangle )
		MoveForward()
		BounceInside( Example.Rectangle )
		CollisionsWithSpriteMap( Example.SpriteMap )
	End Method
	
	Method HandleCollisionWithSprite( Sprite:LTSprite, CollisionType:Int = 0 )
		If  TParticleArea( Sprite ) Then Return
		PushFromSprite( Sprite )
		Angle = Sprite.DirectionTo( Self )
		Sprite.Angle = DirectionTo( Sprite )
		TParticleArea.Create( Self, Sprite )
	End Method
End Type



Type TParticleArea Extends LTSprite
	Const ParticlesQuantity:Int = 30
	Const FadingTime:Double = 1.0
	
	Field Particles:TList = New TList
	Field StartingTime:Double

	Function Create( Ball1:LTSprite, Ball2:LTSprite )
		Local Area:TParticleArea = New TParticleArea
		Local Diameters:Double = Ball1.GetDiameter() + Ball2.GetDiameter()
		Area.SetCoords( Ball1.X + ( Ball2.X - Ball1.X ) * Ball1.GetDiameter() / Diameters, Ball1.Y + ( Ball2.Y - Ball1.Y ) * Ball1.GetDiameter() / Diameters )
		Area.SetSize( 4, 4 )
		Area.StartingTime = Example.Time
		Local Angle:Double = Ball1.DirectionTo( Ball2 ) + 90
		For Local N:Int = 0 Until ParticlesQuantity
			Local Particle:LTSprite = New LTSprite
			Particle.JumpTo( Area )
			Particle.Angle = Angle + Rnd( -15, 15 ) + ( N Mod 2 ) * 180
			Particle.SetDiameter( Rnd( 0.2, 0.6 ) )
			Particle.Velocity = Rnd( 0.5, 3 )
			Area.Particles.AddLast( Particle )
		Next
		Example.SpriteMap.InsertSprite( Area )
	End Function
	
	Method Draw()
		Local A:Double = 1.0 - ( Example.Time - StartingTime ) / FadingTime
		If A < 0 Then
			Example.SpriteMap.RemoveSprite( Self )
		Else
			SetAlpha( A )
			SetColor( 255, 192, 0 )
			For Local Sprite:LTSprite = Eachin Particles
				Local DX:Double = Cos( Sprite.Angle ) * Sprite.GetDiameter() * 0.5
				Local DY:Double = Sin( Sprite.Angle ) * Sprite.GetDiameter() * 0.5
				Local SX1:Double, SY1:Double, SX2:Double, SY2:Double
				L_CurrentCamera.FieldToScreen( Sprite.X - DX, Sprite.Y - DY, SX1, SY1 )
				L_CurrentCamera.FieldToScreen( Sprite.X + DX, Sprite.Y + DY, SX2, SY2 )
				DrawLine( SX1, SY1, SX2, SY2 )
				Sprite.MoveForward()
			Next
			LTVisualizer.ResetColor()
		End If
	End Method
	
	Method Act()
		If CollidesWithSprite( L_CurrentCamera ) Then
			For Local Sprite:LTSprite = Eachin Particles
				Sprite.MoveForward()
			Next
		End If
	End Method
End Type
