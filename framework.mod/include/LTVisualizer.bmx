'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Include "LTImageVisualizer.bmx"
Include "LTFilledPrimitive.bmx"
Include "LTEmptyPrimitive.bmx"

Type LTVisualizer Extends LTObject Abstract
	Field Red:Float = 1.0, Green:Float = 1.0, Blue:Float = 1.0
	Field Alpha:Float = 1.0
	Field XScale:Float = 1.0, YScale:Float = 1.0
	Field Scaling:Int = True

	' ==================== Parameters ====================
	
	Method SetVisualizerScale( NewXScale:Float, NewYScale:Float )
		XScale = NewXScale
		YScale = NewYScale
	End Method
	
	' ==================== Drawing ===================	
	
	Method DrawUsingActor( Actor:LTActor )
	End Method
	
	
	
	Method DrawUsingLine( Line:LTLine )
	End Method
	
	
	
	Method DrawUsingTileMap( TileMap:LTTileMap )
	End Method

	' ==================== Other ====================
	
	Method SetColorFromHex( S:String )
		Red = 1.0 * L_HexToInt( S[ 0..2 ] ) / 255.0
		Green = 1.0 * L_HexToInt( S[ 2..4 ] ) / 255.0
		Blue = 1.0 * L_HexToInt( S[ 4..6 ] ) / 255.0
	End Method
	
	
	
	Method SetColorFromRGB( NewRed:Float, NewGreen:Float, NewBlue:Float )
		?debug
		L_Assert( NewRed >= 0.0 And NewRed <= 1.0, "Red component must be between 0.0 and 1.0 inclusive" )
		L_Assert( NewGreen >= 0.0 And NewGreen <= 1.0, "Green component must be between 0.0 and 1.0 inclusive" )
		L_Assert( NewBlue >= 0.0 And NewBlue <= 1.0, "Blue component must be between 0.0 and 1.0 inclusive" )
		?
		
		Red = NewRed
		Green = NewGreen
		Blue = NewBlue
	End Method
	
	
	
	Method AlterColor( D1:Float, D2:Float )
		Red = L_LimitFloat( Red + Rnd( D1, D2 ), 0.0, 1.0 )
		Green = L_LimitFloat( Green + Rnd( D1, D2 ), 0.0, 1.0 )
		Blue = L_LimitFloat( Blue + Rnd( D1, D2 ), 0.0, 1.0 )
	End Method
	
	
	
	Method XMLIO( XMLObject:LTXMLObject )
		Super.XMLIO( XMLObject )
		
		XMLObject.ManageFloatAttribute( "red", Red, 1.0 )
		XMLObject.ManageFloatAttribute( "green", Green, 1.0 )
		XMLObject.ManageFloatAttribute( "blue", Blue, 1.0 )
		XMLObject.ManageFloatAttribute( "alpha", Alpha, 1.0 )
		XMLObject.ManageFloatAttribute( "xscale", XScale, 1.0 )
		XMLObject.ManageFloatAttribute( "yscale", YScale, 1.0 )
		XMLObject.ManageIntAttribute( "scaling", Scaling, 1 )
	End Method
End Type