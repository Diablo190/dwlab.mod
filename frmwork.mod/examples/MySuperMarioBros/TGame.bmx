'
' Super Mario Bros - Digital Wizard's Lab example
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type TGame Extends LTProject
	Field MovingObjects:LTCollisionMap
	Field Tilemap:LTTileMap
	Field World:LTWorld ' this field will store our world created in editor
	Field Layer:LTLayer ' this field will store layer loaded from the world

	Const Gravity:Float = 32.0
	
	
	
	Method Init()
		MovingObjects = LTCollisionMap.Create( 128, 8, 2.0, 2.0 )
		InitGraphics( 800, 600, 40.0 ) ' initialization of graphics engine with 800x600 resolution and 40 pixels per one unit (tile will be stretched to 40x40 pixels)
		World = LTWorld.FromFile( "world.lw" ) ' loading the world into memory
		Layer = LoadLayer( LTLayer( World.FindShape( "LTLayer" ) ) ) ' loading layer with name "Layer 1" from the world to work wit it
	End Method
	
	
	
	Method Logic()
		Game.Layer.Act()
		If KeyHit( Key_Escape ) Then End ' exit after pressing Escape
	End Method
	
	
	
	Method Render()
		Layer.Draw() ' drawing loaded layer
		ShowDebugInfo( Layer ) ' showing debug info
	End Method
End Type