SuperStrict

Framework brl.basic
Import dwlab.frmwork
Import dwlab.graphicsdrivers

Incbin "tileset.png"
Incbin "mario.png"

Global Example:TExample = New TExample
Example.Execute()

Type TExample Extends LTProject
	Const CoinsQuantity:Int = 100
	Const PlatformsQuantity:Int = 100
	Const MinPlatformLength:Int = 3
	Const MaxPlatformLength:Int = 12
	Const MapSize:Int = 128
	
	Const Void:Int = 0
	Const Bricks:Int = 1
	Const Coin:Int = 2
	
	Field Player:TPlayer = TPlayer.Create()
	Field TileMap:LTTileMap = LTTileMap.Create( LTTileSet.Create( LTImage.FromFile( "incbin::tileset.png", 4, 1 ), 0 ), MapSize, MapSize )
	Field Coins:Int
	
	Method Init()
		TileMap.SetSize( MapSize, MapSize )
		For Local N:Int = 0 Until CoinsQuantity
			TileMap.Value[ Rand( 1, MapSize - 2 ), Rand( 1, MapSize - 2 ) ] = Coin
		Next
		For Local N:Int = 0 Until PlatformsQuantity
			Local Size:Int = Rand( MinPlatformLength, MaxPlatformLength )
			Local X:Int = Rand( 1, MapSize - 1 - Size )
			Local Y:Int = Rand( 1, MapSize - 2 )
			For Local DX:Int = 0 Until Size
				TileMap.Value[ X + DX, Y ] = Bricks
			Next
		Next
		For Local N:Int = 0 Until MapSize 
			TileMap.Value[ N, 0 ] = Bricks
			TileMap.Value[ N, MapSize - 1 ] = Bricks
			TileMap.Value[ 0, N ] = Bricks
			TileMap.Value[ MapSize - 1, N ] = Bricks
		Next
		TileMap.TileSet.CollisionShape = New LTShape[ 3 ]
		TileMap.TileSet.CollisionShape[ 1 ] = LTSprite.FromShape( 0.5, 0.5 )
		TileMap.TileSet.CollisionShape[ 2 ] = LTSprite.FromShape( 0.5, 0.5, , , LTSprite.Oval )
		L_InitGraphics()
	End Method
	
	Method Logic()
		L_CurrentCamera.JumpTo( Player )
		L_CurrentCamera.LimitWith( TileMap )
		If AppTerminate() Or KeyHit( Key_Escape ) Then Exiting = True
		Player.Act()
	End Method

	Method Render()
		TileMap.Draw()
		Player.Draw()
		DrawText( "Move player with arrow keys", 0, 0 )
		DrawText( "Coins: " + Coins, 0, 16 )
		L_PrintText( "LTVectorSprite, CollisionsWithTileMap, HandleCollisionWithTile example", L_CurrentCamera.X, L_CurrentCamera.Y + 12, LTAlign.ToCenter, LTAlign.ToBottom )
	End Method
End Type




Type TPlayer Extends LTVectorSprite
	Const Gravity:Double = 10.0
	Const HorizontalSpeed:Double = 5.0
	Const JumpStrength:Double = 15.0
	
	Field OnLand:Int
	Field HorizontalCollisionHandler:THorizontalCollisionHandler = New THorizontalCollisionHandler
	Field VerticalCollisionHandler:TVerticalCollisionHandler = New TVerticalCollisionHandler
	
	Function Create:TPlayer()
		Local Player:TPlayer = New TPlayer
		Player.SetSize( 0.8, 1.8 )
		Player.SetCoords( 0, 2 -0.5 * Example.MapSize )
		Player.Visualizer.Image = LTImage.FromFile( "incbin::mario.png", 4 )
		Return Player
	End Function
	
	Method Act()
		Move( DX, 0 )
		CollisionsWithTileMap( Example.TileMap, HorizontalCollisionHandler )
		
		OnLand = False
		Move( 0, DY )
		DY = DY + Example.PerSecond( Gravity )
		CollisionsWithTileMap( Example.TileMap, VerticalCollisionHandler )
		
		DX = 0.0
		If KeyDown( Key_Left ) Then
			DX = -HorizontalSpeed
			SetFacing( LeftFacing )
		ElseIf KeyDown( Key_Right ) Then
			DX = HorizontalSpeed
			SetFacing( RightFacing )
		End If 
		
		If OnLand Then If KeyDown( Key_Up ) Then DY = -JumpStrength
	End Method
End Type



Type THorizontalCollisionHandler Extends LTSpriteAndTileCollisionHandler
	Method HandleCollision( Sprite:LTSprite, TileMap:LTTileMap, TileX:Int, TileY:Int, CollisionSprite:LTSprite )
		If Bricks( TileMap, TileX, TileY ) Then Sprite.PushFromTile( TileMap, TileX, TileY )
	End Method
End Type



Type TVerticalCollisionHandler Extends LTSpriteAndTileCollisionHandler
	Method HandleCollision( Sprite:LTSprite, TileMap:LTTileMap, TileX:Int, TileY:Int, CollisionSprite:LTSprite )
		If Bricks( TileMap, TileX, TileY ) Then 
			Sprite.PushFromTile( TileMap, TileX, TileY )
			Local Player:TPlayer = TPlayer( Sprite )
			If Player.DY > 0 Then Player.OnLand = True
			Player.DY = 0
		End If
	End Method
End Type



Function Bricks:Int( TileMap:LTTileMap, TileX:Int, TileY:Int )
	Local TileNum:Int = TileMap.GetTile( TileX, TileY )
	If TileNum = Example.Coin Then
		TileMap.Value[ TileX, TileY ] = Example.Void
		Example.Coins :+ 1
	ElseIf TileNum = Example.Bricks Then
		Return True
	End If
	Return False
End Function