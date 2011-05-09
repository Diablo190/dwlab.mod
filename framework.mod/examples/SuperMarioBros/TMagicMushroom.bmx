'
' Super Mario Bros - Digital Wizard's Lab example
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type TMagicMushroom Extends TBonus
	Function FromTile( TileX:Int, TileY:Int )
		Local Bonus:TBonus = New TMagicMushroom
		Bonus.Init( TileX, TileY )
		Bonus.Visualizer = Game.MagicMushroom
	End Function
	
	
	
	
	Method Collect()
		Game.Mario.SetGrowth()
		TScore.FromSprite( Self, TScore.s1000 )
	End Method
End Type