'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type LTTopRightTriangle Extends LTTopLeftTriangle
	Method GetNum:Int()
		Return 5
	End Method
	
	Method GetName:String()
		Return "Top-right triangle"
	End Method
End Type

LTShapeType.Register( LTSprite.TopRightTriangle )