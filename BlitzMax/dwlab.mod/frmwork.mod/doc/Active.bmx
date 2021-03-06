SuperStrict

Framework brl.basic
Import dwlab.frmwork
Import dwlab.graphicsdrivers

Global Example:TExample = New TExample
Example.Execute()

Type TExample Extends LTProject
	Const SpritesQuantity:Int = 50
	
	Field Layer:LTLayer = New LTLayer
	Field Rectangle:LTShape = LTSprite.FromShape( 0, 0, 30, 20 )
	
	Method Init()
		For Local N:Int = 1 To SpritesQuantity
			TBall.Create()
		Next
		Rectangle.Visualizer = LTContourVisualizer.FromWidthAndHexColor( 0.1, "FF0000" )
		L_InitGraphics()
	End Method
	
	Method Logic()
		Layer.Act()
		If KeyHit( Key_Space ) Then
			For Local Sprite:LTSprite = Eachin Layer
				Sprite.Active = True
				Sprite.Visible = True
			Next
		End If
		If AppTerminate() Or KeyHit( Key_Escape ) Then Exiting = True
	End Method

	Method Render()
		Layer.Draw()
		Rectangle.Draw()
		DrawText( "Press left mouse button on circle to make it inactive, right button to make it invisible.", 0, 0 )
		DrawText( "Press space to restore all back.", 0, 16 )
		L_PrintText( "Active, BounceInside, CollisionsWisthSprite, HandleCollisionWithSprite, Visible example", 0, 12, LTAlign.ToCenter, LTAlign.ToBottom )
	End Method
End Type

Type TBall Extends LTSprite
	Field Handler:TCollisionHandler = New TCollisionHandler

	Function Create:TBall()
		Local Ball:TBall = New TBall
		Ball.SetCoords( Rnd( -13, 13 ), Rnd( -8, 8 ) )
		Ball.SetDiameter( Rnd( 0.5, 1.5 ) )
		Ball.Angle = Rnd( 360 )
		Ball.Velocity = Rnd( 3, 7 )
		Ball.ShapeType = LTSprite.Oval
		Ball.Visualizer.SetRandomColor()
		Example.Layer.AddLast( Ball )
		Return Ball
	End Function
	
	Method Act()
		MoveForward()
		BounceInside( Example.Rectangle )
		CollisionsWithSprite( L_Cursor, Handler )
	End Method
End Type

Type TCollisionHandler Extends LTSpriteCollisionHandler
	Method HandleCollision( Sprite1:LTSprite, Sprite2:LTSprite )
		If MouseDown( 1 ) Then Sprite1.Active = False
		If MouseDown( 2 ) Then Sprite1.Visible = False
	End Method
End Type