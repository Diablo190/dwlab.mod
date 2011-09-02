'
' Skeleton Slayer - Digital Wizard's Lab example
' Copyright (C) 2011, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

SuperStrict

Import brl.jpgloader
Import brl.pngloader
Import brl.oggloader

Import dwlab.frmwork
Import dwlab.sound

Include "TGame.bmx"
Include "TPlayer.bmx"
Include "TPlayerPathFinder.bmx"
Include "TSkeleton.bmx"

AppTitle = "Skeleton Slayer"

Global Game:TGame = New TGame
Game.Execute()