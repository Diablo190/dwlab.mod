'
' Super Mario Bros - Digital Wizard's Lab example
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Include "TTrigger.bmx"
Include "TGoomba.bmx"
Include "TKoopaTroopa.bmx"

Type TEnemy Extends TMovingObject
	Field Mode:Int = Normal
	
	Const Normal:Int = 0
	Const Falling:Int = 1
	
	
	
	Method Init()
	End Method
	
	
	
	Method Stomp()
	End Method
	
	
	
	Method Push()
	End Method
End Type