'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Include "LTLabel.bmx"
Include "LTTextField.bmx"
Include "LTListBox.bmx"
Include "LTSlider.bmx"

Type LTGadget Extends LTSprite
	Method Init()
	End Method
	
	Method GetValue:String()
	End Method
	
	Method SetValue( Value:String )
	End Method

	Method OnMouseOver()
	End Method
	
	Method OnMouseOut()
	End Method	
	
	Method OnClick( Button:Int )
	End Method
	
	Method OnMouseDown( Button:Int )
	End Method
	
	Method OnMouseUp( Button:Int )
	End Method
End Type