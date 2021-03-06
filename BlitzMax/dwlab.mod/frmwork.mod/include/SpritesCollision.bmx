'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type LTPivotWithOval Extends LTInteraction
	Global Instance:LTPivotWithOval = New LTPivotWithOval

	Function Collides:Int( Pivot:LTSprite, Oval:LTSprite )
		Oval = Oval.ToCircle( Pivot, ServiceOval1 )
		Local Radius:Double = 0.5 * Oval.Width - L_Inaccuracy
		If Pivot.Distance2To( Oval ) < Radius * Radius Then Return True
	End Function
End Type
	

	
Type LTPivotWithRectangle Extends LTInteraction
	Global Instance:LTPivotWithRectangle = New LTPivotWithRectangle
	
	Function Collides:Int( Pivot:LTSprite, Rectangle:LTSprite )
		If 2.0 * Abs( Pivot.X - Rectangle.X ) < Rectangle.Width - L_Inaccuracy And 2.0 * Abs( Pivot.Y - Rectangle.Y ) < Rectangle.Height - L_Inaccuracy Then Return True
	End Function
End Type	
	


Type LTPivotWithTriangle Extends LTInteraction
	Global Instance:LTPivotWithTriangle = New LTPivotWithTriangle
	
	Function Collides:Int( Pivot:LTSprite, Triangle:LTSprite )
		If PivotWithRectangle( Pivot, Triangle ) Then
			Triangle.GetHypotenuse( ServiceLine1 )
			Triangle.GetRightAngleVertex( ServicePivot1 )
			If ServiceLine1.PivotOrientation( Pivot ) = ServiceLine1.PivotOrientation( ServicePivot1 ) Then Return True
		End If
	End Function
End Type
	

	
Type LTOvalWithOval Extends LTInteraction
	Global Instance:LTOvalWithOval = New LTOvalWithOval
	
	Function Collides:Int( Oval1:LTSprite, Oval2:LTSprite )
		Oval1 = Oval1.ToCircle( Oval2, ServiceOval1 )
		Oval2 = Oval2.ToCircle( Oval1, ServiceOval2 )
		Local Radiuses:Double = 0.5 * ( Oval1.Width + Oval2.Width ) - L_Inaccuracy
		If Oval1.Distance2To( Oval2 ) < Radiuses * Radiuses Then Return True
	End Function
End Type

	
	
Type LTOvalWithRectangle Extends LTInteraction
	Global Instance:LTOvalWithRectangle = New LTOvalWithRectangle
	
	Function Collides:Int( Oval:LTSprite, Rectangle:LTSprite )
		Oval = Oval.ToCircle( Rectangle, ServiceOval1 )
		If ( Rectangle.X - Rectangle.Width * 0.5 <= Oval.X And Oval.X <= Rectangle.X + Rectangle.Width * 0.5 ) Or ( Rectangle.Y - Rectangle.Height * 0.5 <= Oval.Y And Oval.Y <= Rectangle.Y + Rectangle.Height * 0.5 ) Then
			If 2.0 * Abs( Oval.X - Rectangle.X ) < Oval.Width + Rectangle.Width - L_Inaccuracy And 2.0 * Abs( Oval.Y - Rectangle.Y ) < Oval.Width + Rectangle.Height - L_Inaccuracy Then Return True
		Else
			Local DX:Double = Abs( Rectangle.X - Oval.X ) - 0.5 * Rectangle.Width
			Local DY:Double = Abs( Rectangle.Y - Oval.Y ) - 0.5 * Rectangle.Height
			Local Radius:Double = 0.5 * Oval.Width - L_Inaccuracy
			If DX * DX + DY * DY < Radius * Radius Then Return True
		End If
	End Function
End Type	
	


Type LTOvalWithLineSegment Extends LTInteraction
	Global Instance:LTOvalWithLineSegment = New LTOvalWithLineSegment
	
	Function CollidesWithLineSegment:Int( Oval:LTSprite, LSPivot1:LTSprite, LSPivot2:LTSprite )
		ServiceOval1.X = 0.5 * ( LSPivot1.X + LSPivot2.X )
		ServiceOval1.Y = 0.5 * ( LSPivot1.Y + LSPivot2.Y )
		ServiceOval1.Width = 0.5 * LSPivot1.DistanceTo( LSPivot2 )
		If OvalWithOval( Oval, ServiceOval1 ) Then
			LTLine.FromPivots( LSPivot1, LSPivot2, ServiceLine1 )
			Oval = Oval.ToCircleUsingLine( ServiceLine1, ServiceOval2 )
			If ServiceLine1.DistanceTo( Oval ) < 0.5 * Max( Oval.Width, Oval.Height ) - L_Inaccuracy Then
				ServiceLine1.PivotProjection( Oval, ServicePivot1 )
				If PivotWithOval( ServicePivot1, ServiceOval1 ) And ServicePivot1.DistanceTo( ServiceOval2 ) < ServiceOval1.Width - L_Inaccuracy Then Return True
			End If
		End If
	End Function
End Type

	
	
Type LTOvalWithTriangle Extends LTInteraction
	Global Instance:LTOvalWithTriangle = New LTOvalWithTriangle
	
	Function Collides:Int( Oval:LTSprite, Triangle:LTSprite )
		If OvalWithRectangle( Oval, Triangle ) Then
			Triangle.GetHypotenuse( ServiceLine1 )
			Oval = Oval.ToCircleUsingLine( ServiceLine1, ServiceOval1 )
			Triangle.GetRightAngleVertex( ServicePivot1 )
			If ServiceLine1.PivotOrientation( Oval ) = ServiceLine1.PivotOrientation( ServicePivot1 ) Then Return True
			If Not ServiceLine1.CollisionPointsWithCircle( Oval, ServicePivot1, ServicePivot2 ) Then Return False
			If PivotWithRectangle( ServicePivot1, Triangle ) Or PivotWithRectangle( ServicePivot2, Triangle ) Then Return True
		End If
	End Function
End Type	



Type LTOvalWithRay Extends LTInteraction
	Global Instance:LTOvalWithRay = New LTOvalWithRay
	
	Function Collides:Int( Oval:LTSprite, Ray:LTSprite )
		Ray.ToLine( ServiceLine1 )
		Oval.ToCircleUsingLine( ServiceLine1, ServiceOval1 )
		If ServiceLine1.CollisionPointsWithCircle( ServiceOval1, ServicePivot1, ServicePivot2 ) Then
			If Ray.HasPivot( ServicePivot1 ) Then Return True
			If Ray.HasPivot( ServicePivot2 ) Then Return True
		End If
		If PivotWithOval( Ray, Oval ) Then Return True
	End Function
End Type	



Type LTRectangleWithRectangle Extends LTInteraction
	Global Instance:LTRectangleWithRectangle = New LTRectangleWithRectangle
	
	Function Collides:Int( Rectangle1:LTSprite, Rectangle2:LTSprite )
		If 2.0 * Abs( Rectangle1.X - Rectangle2.X ) < Rectangle1.Width + Rectangle2.Width - L_Inaccuracy And 2.0 * Abs( Rectangle1.Y - Rectangle2.Y ) < Rectangle1.Height + Rectangle2.Height - L_Inaccuracy Then Return True
	End Function
End Type	



Type LTRectangleWithTriangle Extends LTInteraction
	Global Instance:LTRectangleWithTriangle = New LTRectangleWithTriangle
	
	Function Collides:Int( Rectangle:LTSprite, Triangle:LTSprite )
		If RectangleWithRectangle( Rectangle, Triangle ) Then
			Triangle.GetHypotenuse( ServiceLine1 )
			Triangle.GetRightAngleVertex( ServicePivot1 )
			If ServiceLine1.PivotOrientation( Rectangle ) = ServiceLine1.PivotOrientation( ServicePivot1 ) Then Return True
			Local LeftX:Double, TopY:Double, RightX:Double, BottomY:Double
			Rectangle.GetBounds( LeftX, TopY, RightX, BottomY )
			Local O:Int = ServiceLine1.PointOrientation( LeftX, TopY )
			If O <> ServiceLine1.PointOrientation( RightX, TopY ) Then Return True
			If O <> ServiceLine1.PointOrientation( LeftX, BottomY ) Then Return True
			If O <> ServiceLine1.PointOrientation( RightX, BottomY ) Then Return True
		End If
	End Function
End Type	



Type LTRectangleWithLineSegment Extends LTInteraction
	Global Instance:LTRectangleWithLineSegment = New LTRectangleWithLineSegment
	
	Function CollidesWithLineSegment:Int( Rectangle:LTSprite, LSPivot1:LTSprite, LSPivot2:LTSprite )
		If PivotWithRectangle( LSPivot1, Rectangle ) Then Return True
		Rectangle.GetBounds( ServicePivots[ 0 ].X, ServicePivots[ 0 ].Y, ServicePivots[ 2 ].X, ServicePivots[ 2 ].Y )
		Rectangle.GetBounds( ServicePivots[ 1 ].X, ServicePivots[ 3 ].Y, ServicePivots[ 3 ].X, ServicePivots[ 1 ].Y )
		For Local N:Int = 0 To 3
			If LineSegmentWithLineSegment( ServicePivots[ N ], ServicePivots[ ( N + 1 ) Mod 4 ], LSPivot1, LSPivot2 ) Then Return True
		Next
	End Function
End Type


	
Type LTRectangleWithRay Extends LTInteraction
	Global Instance:LTRectangleWithRay = New LTRectangleWithRay
	
	Function Collides:Int( Rectangle:LTSprite, Ray:LTSprite )
		Rectangle.GetBounds( ServicePivots[ 0 ].X, ServicePivots[ 0 ].Y, ServicePivots[ 2 ].X, ServicePivots[ 2 ].Y )
		Rectangle.GetBounds( ServicePivots[ 1 ].X, ServicePivots[ 3 ].Y, ServicePivots[ 3 ].X, ServicePivots[ 1 ].Y )
		For Local N:Int = 0 To 3
			If RayWithLineSegment( Ray, ServicePivots[ N ], ServicePivots[ ( N + 1 ) Mod 4 ] ) Then Return True
		Next
	End Function
End Type


	
Type LTTriangleWithTriangle Extends LTInteraction
	Global Instance:LTTriangleWithTriangle = New LTTriangleWithTriangle
	
	Function Collides:Int( Triangle1:LTSprite, Triangle2:LTSprite )
		If RectangleWithRectangle( Triangle1, Triangle2 ) Then
			Triangle1.GetRightAngleVertex( ServicePivot3 )
			Triangle2.GetRightAngleVertex( ServicePivot4 )
			
			Triangle1.GetOtherVertices( ServicePivot1, ServicePivot2 )
			Triangle2.GetHypotenuse( ServiceLine1 )
			Local O1:Int = ServiceLine1.PivotOrientation( ServicePivot4 )
			If PivotWithRectangle( ServicePivot1, Triangle2 ) Then If O1 = ServiceLine1.PivotOrientation( ServicePivot1 ) Then Return True
			If PivotWithRectangle( ServicePivot2, Triangle2 ) Then If O1 = ServiceLine1.PivotOrientation( ServicePivot2 ) Then Return True
			If PivotWithRectangle( ServicePivot3, Triangle2 ) Then If O1 = ServiceLine1.PivotOrientation( ServicePivot3 ) Then Return True
			Local O3:Int = ( ServiceLine1.PivotOrientation( ServicePivot3 ) <> ServiceLine1.PivotOrientation( ServicePivot1 ) )
			
			Triangle2.GetOtherVertices( ServicePivots[ 0 ], ServicePivots[ 1 ] )
			Triangle1.GetHypotenuse( ServiceLine1 )
			Local O2:Int = ServiceLine1.PivotOrientation( ServicePivot3 )
			If PivotWithRectangle( ServicePivots[ 0 ], Triangle1 ) Then If O2 = ServiceLine1.PivotOrientation( ServicePivots[ 0 ] ) Then Return True
			If PivotWithRectangle( ServicePivots[ 1 ], Triangle1 ) Then If O2 = ServiceLine1.PivotOrientation( ServicePivots[ 1 ] ) Then Return True
			If PivotWithRectangle( ServicePivot4, Triangle1 ) Then If O2 = ServiceLine1.PivotOrientation( ServicePivot4 ) Then Return True
			
			If LineSegmentWithLineSegment( ServicePivot1, ServicePivot2, ServicePivots[ 0 ], ServicePivots[ 1 ] ) Then Return True
			if O3 Then If ServiceLine1.PivotOrientation( ServicePivot4 ) <> ServiceLine1.PivotOrientation( ServicePivots[ 0 ] ) Then Return True
		End If
	End Function
End Type


	
Type LTTriangleWithLineSegment Extends LTInteraction
	Global Instance:LTTriangleWithLineSegment = New LTTriangleWithLineSegment
	
	Function CollidesWithLineSegment:Int( Triangle:LTSprite, LSPivot1:LTSprite, LSPivot2:LTSprite )
		If PivotWithTriangle( LSPivot1, Triangle ) Then Return True
		Triangle.GetOtherVertices( ServicePivots[ 0 ], ServicePivots[ 1 ] )
		Triangle.GetRightAngleVertex( ServicePivots[ 2 ] )
		For Local N:Int = 0 To 2
			If LineSegmentWithLineSegment( ServicePivots[ N ], ServicePivots[ ( N + 1 ) Mod 3 ], LSPivot1, LSPivot2 ) Then Return True
		Next
	End Function
End Type	



Type LTTriangleWithRay Extends LTInteraction
	Global Instance:LTTriangleWithRay = New LTTriangleWithRay
	
	Function Collides:Int( Triangle:LTSprite, Ray:LTSprite )
		Triangle.GetOtherVertices( ServicePivots[ 0 ], ServicePivots[ 1 ] )
		Triangle.GetRightAngleVertex( ServicePivots[ 2 ] )
		For Local N:Int = 0 To 2
			If RayWithLineSegment( Ray, ServicePivots[ N ], ServicePivots[ ( N + 1 ) Mod 3 ] ) Then Return True
		Next
	End Function
End Type


	
Type LTRayWithLineSegment Extends LTInteraction
	Global Instance:LTRayWithLineSegment = New LTRayWithLineSegment
	
	Function CollidesWithLineSegment:Int( Ray:LTSprite, LSPivot1:LTSprite, LSPivot2:LTSprite )
		Ray.ToLine( ServiceLine1 )
		If ServiceLine1.IntersectionWithLineSegment( LSPivot1, LSPivot2, ServicePivot1 ) Then
			If Ray.HasPivot( ServicePivot1 ) Then Return True
		End If
	End Function
End Type

	
	
Type LTLineSegmentWithLineSegment Extends LTInteraction
	Global Instance:LTLineSegmentWithLineSegment = New LTLineSegmentWithLineSegment
	
	Function CollidesWithLineSegment:Int( LS1Pivot1:LTSprite, LS1Pivot2:LTSprite, LS2Pivot1:LTSprite, LS2Pivot2:LTSprite )
		LTLine.FromPivots( LS1Pivot1, LS1Pivot2, ServiceLine1 )
		If ServiceLine1.PivotOrientation( LS2Pivot1 ) = ServiceLine1.PivotOrientation( LS2Pivot2 ) Then Return False
		LTLine.FromPivots( LS2Pivot1, LS2Pivot2, ServiceLine1 )
		If ServiceLine1.PivotOrientation( LS1Pivot1 ) <> ServiceLine1.PivotOrientation( LS1Pivot2 ) Then Return True
	End Function
End Type


	
Type LTRayWithRay Extends LTInteraction
	Global Instance:LTRayWithRay = New LTRayWithRay
	
	Function Collides:Int( Ray1:LTSprite, Ray2:LTSprite )
		Ray1.ToLine( ServiceLine1 )
		Ray2.ToLine( ServiceLine2 )
		ServiceLine1.IntersectionWithLine( ServiceLine2, ServicePivot1 )
		If Not Ray1.HasPivot( ServicePivot1 ) Then Return False
		If Ray2.HasPivot( ServicePivot1 ) Then Return True
	End Function
End Type	



Type LTRasterWithRaster Extends LTInteraction
	Global Instance:LTRasterWithRaster = New LTRasterWithRaster
	
	Function Collides:Int( Raster1:LTSprite, Raster2:LTSprite )
		Local Visualizer1:LTVisualizer = Raster1.Visualizer
		Local Visualizer2:LTVisualizer = Raster2.Visualizer
		Local Image1:LTImage = Visualizer1.Image
		Local Image2:LTImage = Visualizer2.Image
		If Not Image1 Or Not Image2 Then Return False
		If Raster1.Angle = 0 And Raster2.Angle =0 And Raster1.Width * Image2.Width() = Raster2.Width * Image2.Width() And ..
				Raster1.Height * Image2.Height() = Raster2.Height * Image2.Height() Then
			Local XScale:Double = Image1.Width() / Raster1.Width
			Local YScale:Double = Image1.Height() / Raster1.Height
			Return ImagesCollide( Image1.BMaxImage, Raster1.X * XScale, Raster1.Y * YScale, Raster1.Frame, ..
					Image2.BMaxImage, Raster2.X * XScale, Raster2.Y * YScale, Raster2.Frame )
		Else
			Local XScale1:Double = Image1.Width() / Raster1.Width
			Local YScale1:Double = Image1.Height() / Raster1.Height
			Local XScale2:Double = Image2.Width() / Raster2.Width
			Local YScale2:Double = Image2.Height() / Raster2.Height
			Local XScale:Double = Max( XScale1, XScale2 )
			Local YScale:Double = Max( YScale1, YScale2 )
			Return ImagesCollide2( Image1.BMaxImage, Raster1.X * XScale, Raster1.Y * YScale, Raster1.Frame, Raster1.Angle, ..
					XScale / XScale1, YScale / YScale1, Image2.BMaxImage, Raster2.X * XScale, Raster2.Y * YScale, ..
					Raster2.Frame, Raster2.Angle, XScale / XScale2, YScale / YScale2 )
		End If
	End Function
End Type