'
' Color Lines - Digital Wizard's Lab example
' Copyright (C) 2011, Matt Merkulov
'
' All rights reserved. Use of this code is allowed under the
' Artistic License 2.0 terms, as specified in the license.txt
' file distributed with this code, or available from
' http://www.opensource.org/licenses/artistic-license-2.0.php
'

Type THUD Extends LTWindow
	Field Icon:LTSprite
	Field Count:LTLabel
	Field Ball:LTSprite
	Field Size:Double
	Field Distance:Double
	Field Goal1X:Double
	Field GoalDX:Double
	
	Method Init()
		Super.Init()
		Game.Background = FindShape( "Background" )
		Remove( Game.Background )
		Icon = LTSprite( FindShape( "GoalIcon" ) )
		Remove( Icon )
		Count = LTLabel( FindShape( "GoalCount" ) )
		Remove( Count )
		Ball = LTSprite( FindShape( "Ball" ) )
		Remove( Ball )
		Size = Ball.GetDiameter()
		Distance = Ball.GetParameter( "distance" ).ToDouble()
		Goal1X = FindShape( "Goal1" ).X
		GoalDX = FindShape( "Goal2" ).X - Goal1X
	End Method

	Method Draw()
		Super.Draw()
		if Profile.NextBalls Then
			Local StartingX:Double = FindShape( "Balls" ).X - 0.5 * Distance * ( Profile.NextBalls.Dimensions()[ 0 ] - 1 )
			Local N:Int = 0
			Ball.SetDiameter( Size )
			For Local BallNum:Int = Eachin Profile.NextBalls
				Ball.SetX( StartingX + N * Distance )
				Ball.Frame = BallNum
				Ball.Draw()
				N :+ 1
			Next
		End If
		
		Local GoalX:Double = Goal1X
		For Local Goal:TGoal = Eachin Profile.Goals
			Goal.Draw( Goal1X, Icon, Ball, Count )
			GoalX :+ GoalDX
		Next
	End Method
	
	Method Act()
		Super.Act()
		LTLabel( FindShape( "Score" ) ).Text = Profile.Score
		LTLabel( FindShape( "CurrentProfile" ) ).Text = LocalizeString( Profile.Name )
	End Method
End Type