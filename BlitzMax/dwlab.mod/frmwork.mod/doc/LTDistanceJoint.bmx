SuperStrict

Framework brl.basic

Import dwlab.frmwork
Import dwlab.graphicsdrivers

Local Example:TExample = New TExample
Example.Execute()

Type TExample Extends LTProject
	Field Hinge:LTSprite = LTSprite.FromShape( 0, -8, 1, 1, LTSprite.Oval )
	Field Weight1:LTVectorSprite = LTVectorSprite.FromShapeAndVector( -8, -6, 3, 3, LTSprite.Oval )
	Field Weight2:LTVectorSprite = LTVectorSprite.FromShapeAndVector( -12, -9, 3, 3, LTSprite.Oval )
	Field Rope1:LTLineSegment = LTLineSegment.FromPivots( Hinge, Weight1 )
	Field Rope2:LTLineSegment = LTLineSegment.FromPivots( Weight1, Weight2 )
	
	Method Init()
		L_InitGraphics()
		Hinge.Visualizer = LTVisualizer.FromHexColor( "FF0000" )
		Weight1.Visualizer = LTVisualizer.FromHexColor( "00FF00" )
		Weight2.Visualizer = LTVisualizer.FromHexColor( "FFFF00" )
		Rope1.Visualizer = LTContourVisualizer.FromWidthAndHexColor( 0.25, "0000FF", 1.0 , 2.0 )
		Rope2.Visualizer = Rope1.Visualizer
		Weight1.AttachModel( LTDistanceJoint.Create( Hinge ) )
		Weight2.AttachModel( LTDistanceJoint.Create( Weight1 ) )
	End Method

	Method Render()
		Hinge.Draw()
		Weight1.Draw()
		Weight2.Draw()
		Rope1.Draw()
		Rope2.Draw()
		L_PrintText( "LTDistanceJoint example", 0, 12, LTAlign.ToCenter, LTAlign.ToBottom )
	End Method
	
	Method Logic()
		If AppTerminate() Or KeyHit( Key_Escape ) Then Exiting = True
		Weight1.Act()
		Weight1.DY :+ L_PerSecond( 2.0 )
		Weight1.MoveForward()
		Weight2.Act()
		Weight2.DY :+ L_PerSecond( 2.0 )
		Weight2.MoveForward()
	End Method	
End Type

