'
' MindStorm - Digital Wizard's Lab example
' Copyright (C) 2010, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Attribution-NonCommercial-ShareAlike 3.0 License terms, as
' specified in the license2.txt file distributed with this
' code, or available from
' http://creativecommons.org/licenses/by-nc-sa/3.0/
'

SuperStrict

Framework brl.d3d7max2d
'Import brl.glmax2d
Import brl.random
Import brl.pngloader
Import brl.jpgloader
Import brl.reflection
'Import brl.audio
'Import brl.freeaudioaudio
Import brl.directsoundaudio
Import brl.wavloader
Import brl.retro
Import brl.map
'Import maxgui.win32maxgui

SetAudioDriver( "DirectSound" )
'SetGraphicsDriver( GLMax2DDriver() )

Include "../../framework.bmx"

Include "Weapons.bmx"

Init( 800, 600 )

Global Game:LTGame = New LTGame
Game.Execute()

Type LTGame Extends LTProject
	Field Target:LTPivot = New LTPivot
	Field Player:LTCircle = New LTCircle
	Field Brain:LTImageVisual
	Field Visor:LTImageVisual
	Field LeftWeapon:TWeapon
	Field RightWeapon:TWeapon
	
	Field TileMap:LTTileMap = New LTTileMap
	Field TileSet:LTTileSet = New LTTileSet
	Field HeightMap:LTHeightMap = New LTHeightMap

	Field ChaingunCannon:LTImageVisual
	Field ChaingunBarrel:LTImageVisual
	Field ChaingunFire:LTImageVisual
	
	
	
	Method Init()
	
		' ============================= Weapons =============================
		
		ChaingunCannon = LTImageVisual.FromFile( "media/chaingun/cannon.png" )
		ChaingunBarrel = LTImageVisual.FromFile( "media/chaingun/barrel##.png" )
		ChaingunFire = LTImageVisual.FromFile( "media/chaingun/fire#.png" )
		
		' ============================= Player =============================
		
		Player.SetDiameter( 1.0 )
		Player.SetVelocity( 1.5 )
		
		Brain = LTImageVisual.FromFile( "media/brain.png" )
		Brain.SetColorFromHex( "AACCFF" )
		Brain.SetVisualScale( 1.77, 1.77 )
		Brain.AlterColor( -0.2, 0.2 )
		
		Visor = LTImageVisual.FromFile( "media/visor.png" )
		Visor.SetColorFromHex( "CCAAFF" )
		Visor.AlterColor( -0.2, 0.2 )
		Visor.SetVisualScale( 2.0, 2.0 )
		
		Target.Visual = LTImageVisual.FromFile( "media/target.png" )
		Target.Visual.Scaling = False
		
		LeftWeapon = TChaingun.Create( LeftSide )
		
		' ============================= Map =============================
		
		L_CurrentCamera.SetMagnification( L_ScreenXSize / 8, L_ScreenXSize / 8 )
		
		TileMap.SetResolution( 128, 128 )
		TileMap.Visual = LTImageVisual.FromFile( "media/tileset.png", 5, 4 )
		TileMap.SetSize( 128.0, 128.0 )
		
		HeightMap.SetResolution( 128, 128 )
		HeightMap.PerlinNoise( 16, 16, 0.25, 0.5, 4 )
		HeightMap.ExtractTo( TileMap, 0.4, 1.0, 1 )
		
		TileMap.Stretch( 2, 2 )
		TileSet = LTTileSet.FromFile( "media/simple.lts" )
		TileMap.EnframeBy( TileSet )
		
		HideMouse()
	End Method
	
	
	
	Method Logic()
		Target.SetMouseCoords()
		Player.DirectToPivot( Target )
		Player.MoveUsingWSAD()
		L_CurrentCamera.JumpToPivot( Player )
		L_CurrentCamera.Update()
		LeftWeapon.Logic()
		
		If KeyHit( key_Escape ) Then End
	End Method
	
	
	
	Method Render()
		TileMap.Draw()
		Player.DrawUsingVisual( Brain )
		LeftWeapon.Render()
		'Player.DrawUsingVisual( Visor )
		Target.Draw()
	End Method
End Type