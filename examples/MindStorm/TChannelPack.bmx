'
' Digital Wizard's Lab - game development framework
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type TChannelPack Extends LTObject
	Field Channel:TChannel[]
	Field ChannelsQuantity:Int
	
	
	
	Function Create:TChannelPack( ChannelsQuantity:Int )
		Local ChannelPack:TChannelPack = New TChannelPack
		ChannelPack.Channel = New TChannel[ ChannelsQuantity ]
		ChannelPack.ChannelsQuantity = ChannelsQuantity
		For Local N:Int = 0 Until ChannelsQuantity
			ChannelPack.Channel[ N ] = New TChannel
		Next
		Return ChannelPack
	End Function
	
	
	
	Method Play( Sound:TSound, Volume:Double = -1.0, Rate:Double = 1.0 )
		For Local N:Int = 0 Until ChannelsQuantity
			If Not Channel[ N ].Playing() Then
				PlaySound( Sound, Channel[ N ] )
				If Volume >= 0.0 Then SetChannelVolume( Channel[ N ], Volume )
				If Rate <> 1.0 Then SetChannelRate( Channel[ N ], Rate )
				Exit
			End If
		Next
	End Method
End Type