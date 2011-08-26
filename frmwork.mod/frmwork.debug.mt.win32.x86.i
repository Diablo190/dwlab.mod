ModuleInfo "Version: 1.1.2"
ModuleInfo "Author: Matt Merkulov"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Modserver: DWLAB"
ModuleInfo "History: &nbsp; &nbsp; "
ModuleInfo "History: v1.1.2 (26.08.11)"
ModuleInfo "History: &nbsp; &nbsp; Added isometric camera support to marching ants rectangle."
ModuleInfo "History: &nbsp; &nbsp; Added camera and incbin parametes to the world class."
ModuleInfo "History: v1.1.1 (24.08.11)"
ModuleInfo "History: &nbsp; &nbsp; Implemented incbin support."
ModuleInfo "History: v1.1 (03.08.11)"
ModuleInfo "History: &nbsp; &nbsp; Implemented isometric cameras."
ModuleInfo "History: &nbsp; &nbsp; Added camera saving/loading method."
ModuleInfo "History: &nbsp; &nbsp; Added pivot mode to sprite maps."
ModuleInfo "History: &nbsp; &nbsp; Added Flipping flag to the LTProject."
ModuleInfo "History: &nbsp; &nbsp; EmptyTile parameter was moved from LTTIleMap to LTTileSet."
ModuleInfo "History: v1.0.4.1 (01.08.11)"
ModuleInfo "History: &nbsp; &nbsp; Removed support for different axis magnification."
ModuleInfo "History: &nbsp; &nbsp; Added camera field into the LTWorld."
ModuleInfo "History: v1.0.4 (22.07.11)"
ModuleInfo "History: &nbsp; &nbsp; Added full support of Oval shape type (replaced Circle)."
ModuleInfo "History: v1.0.3.1 (19.07.11)"
ModuleInfo "History: &nbsp; &nbsp; Removed multiple collision reactions when executing CollisionsWithSpriteMap method."
ModuleInfo "History: v1.0.3 (18.07.11)"
ModuleInfo "History: &nbsp; &nbsp; Added Parallax() function."
ModuleInfo "History: &nbsp; &nbsp; Added sprite map clearing method."
ModuleInfo "History: &nbsp; &nbsp; Fixed bug in LTDoubleMap.ToNewImage() method."
ModuleInfo "History: v1.0.2.1 (07.07.11)"
ModuleInfo "History: &nbsp; &nbsp; Fixed bug of visualizer's DX/DY not saving/loading."
ModuleInfo "History: v1.0.2 (06.07.11)"
ModuleInfo "History: &nbsp; &nbsp; CollisionsWithSpriteMap() method now have Map parameter to add collided sprites to."
ModuleInfo "History: &nbsp; &nbsp; Added visualizer cloning method."
ModuleInfo "History: &nbsp; &nbsp; ImageVisualizer is merged with Visualizer."
ModuleInfo "History: &nbsp; &nbsp; Fixed bug in SetSize (old method cleared collision map)."
ModuleInfo "History: &nbsp; &nbsp; Collision maps are renamed to sprite maps."
ModuleInfo "History: &nbsp; &nbsp; Added sprite maps saving/loading method."
ModuleInfo "History: &nbsp; &nbsp; Added GetSprites() method."
ModuleInfo "History: v1.0.1.1 (05.07.11)"
ModuleInfo "History: &nbsp; &nbsp; ShowDebugInfo() method is now without parameters."
ModuleInfo "History: &nbsp; &nbsp; MoveUsingKeys() methods are now in LTShape and have velocity parameter."
ModuleInfo "History: &nbsp; &nbsp; Max2D drivers import is now inside framework."
ModuleInfo "History: v1.0.1 (04.07.11)"
ModuleInfo "History: &nbsp; &nbsp; Added sorting parameter to collision maps."
ModuleInfo "History: &nbsp; &nbsp; Border parameter of collision map is turned to 4 margin parameters."
ModuleInfo "History: &nbsp; &nbsp; Now setting all collision map margins to one value is possible by using SetBorder() method."
ModuleInfo "History: &nbsp; &nbsp; Visualizer's DX and DY parameters are now image-relative."
ModuleInfo "History: v1.0.0.1 (30.06.11)"
ModuleInfo "History: &nbsp; &nbsp; Fixed bug of ChopFilename() function under Mac."
ModuleInfo "History: v1.0 (28.06.11)"
ModuleInfo "History: &nbsp; &nbsp; Initial release."
import brl.blitz
import brl.d3d9max2d
import brl.random
import brl.reflection
import brl.retro
L_Version$=$"1.1.2"
LTObject^brl.blitz.Object{
.Name$&
-New%()="_dwlab_frmwork_LTObject_New"
-GetNamePart$(Num%=1)="_dwlab_frmwork_LTObject_GetNamePart"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTObject_XMLIO"
+LoadFromFile:LTObject(FileName$)="_dwlab_frmwork_LTObject_LoadFromFile"
-SaveToFile%(FileName$)="_dwlab_frmwork_LTObject_SaveToFile"
}="dwlab_frmwork_LTObject"
LTProject^LTObject{
.LogicFPS!&
.MinFPS!&
.FPS%&
.Pass%&
.Time!&
.CurrentPause:LTPause&
.Exiting%&
.Flipping%&
-New%()="_dwlab_frmwork_LTProject_New"
-Init%()="_dwlab_frmwork_LTProject_Init"
-Render%()="_dwlab_frmwork_LTProject_Render"
-Logic%()="_dwlab_frmwork_LTProject_Logic"
-DeInit%()="_dwlab_frmwork_LTProject_DeInit"
-LoadAndInitLayer%(NewLayer:LTLayer Var,Layer:LTLayer)="_dwlab_frmwork_LTProject_LoadAndInitLayer"
-LoadLayer:LTLayer(Layer:LTLayer)="_dwlab_frmwork_LTProject_LoadLayer"
-CreateShape:LTShape(Shape:LTShape)="_dwlab_frmwork_LTProject_CreateShape"
-Execute%()="_dwlab_frmwork_LTProject_Execute"
-PerSecond!(Value!)="_dwlab_frmwork_LTProject_PerSecond"
-ShowDebugInfo%()="_dwlab_frmwork_LTProject_ShowDebugInfo"
-ApplyPause%(NewPause:LTPause,Key%)="_dwlab_frmwork_LTProject_ApplyPause"
}="dwlab_frmwork_LTProject"
LTShape^LTObject{
Horizontal%=1
Vertical%=2
LeftFacing!=-1!
RightFacing!=1!
.X!&
.Y!&
.Width!&
.Height!&
.Visualizer:LTVisualizer&
.Visible%&
.Active%&
.BehaviorModels:brl.linkedlist.TList&
-New%()="_dwlab_frmwork_LTShape_New"
-Draw%()="_dwlab_frmwork_LTShape_Draw"
-DrawUsingVisualizer%(Vis:LTVisualizer)="_dwlab_frmwork_LTShape_DrawUsingVisualizer"
-DrawIsoTile%(X!,Y!,TileX%,TileY%)="_dwlab_frmwork_LTShape_DrawIsoTile"
-SpriteGroupCollisions%(Sprite:LTSprite,CollisionType%)="_dwlab_frmwork_LTShape_SpriteGroupCollisions"
-TileShapeCollisionsWithSprite%(Sprite:LTSprite,DX!,DY!,XScale!,YScale!,TileMap:LTTileMap,TileX%,TileY%,CollisionType%)="_dwlab_frmwork_LTShape_TileShapeCollisionsWithSprite"
-LeftX!()="_dwlab_frmwork_LTShape_LeftX"
-TopY!()="_dwlab_frmwork_LTShape_TopY"
-RightX!()="_dwlab_frmwork_LTShape_RightX"
-BottomY!()="_dwlab_frmwork_LTShape_BottomY"
-DistanceToPoint!(PointX!,PointY!)="_dwlab_frmwork_LTShape_DistanceToPoint"
-DistanceTo!(Shape:LTShape)="_dwlab_frmwork_LTShape_DistanceTo"
-IsAtPositionOf%(Shape:LTShape)="_dwlab_frmwork_LTShape_IsAtPositionOf"
-SetX%(NewX!)="_dwlab_frmwork_LTShape_SetX"
-SetY%(NewY!)="_dwlab_frmwork_LTShape_SetY"
-SetCoords%(NewX!,NewY!)="_dwlab_frmwork_LTShape_SetCoords"
-AlterCoords%(DX!,DY!)="_dwlab_frmwork_LTShape_AlterCoords"
-SetCornerCoords%(NewX!,NewY!)="_dwlab_frmwork_LTShape_SetCornerCoords"
-JumpTo%(Shape:LTShape)="_dwlab_frmwork_LTShape_JumpTo"
-SetMouseCoords%()="_dwlab_frmwork_LTShape_SetMouseCoords"
-SetCoordsRelativeTo%(Sprite:LTAngularSprite,NewX!,NewY!)="_dwlab_frmwork_LTShape_SetCoordsRelativeTo"
-PositionOnTileMap%(TileMap:LTTileMap,TileX!,TileY!)="_dwlab_frmwork_LTShape_PositionOnTileMap"
-Move%(DX!,DY!)="_dwlab_frmwork_LTShape_Move"
-PlaceBetween%(Shape1:LTShape,Shape2:LTShape,K!)="_dwlab_frmwork_LTShape_PlaceBetween"
-MoveUsingWSAD%(Velocity!)="_dwlab_frmwork_LTShape_MoveUsingWSAD"
-MoveUsingArrows%(Velocity!)="_dwlab_frmwork_LTShape_MoveUsingArrows"
-MoveUsingKeys%(KUp%,KDown%,KLeft%,KRight%,Velocity!)="_dwlab_frmwork_LTShape_MoveUsingKeys"
-Parallax%(Shape:LTShape)="_dwlab_frmwork_LTShape_Parallax"
-LimitWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitWith"
-LimitLeftWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitLeftWith"
-LimitTopWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitTopWith"
-LimitRightWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitRightWith"
-LimitBottomWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitBottomWith"
-LimitHorizontallyWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitHorizontallyWith"
-LimitVerticallyWith%(Rectangle:LTShape)="_dwlab_frmwork_LTShape_LimitVerticallyWith"
-DirectionToPoint!(PointX!,PointY!)="_dwlab_frmwork_LTShape_DirectionToPoint"
-DirectionTo!(Shape:LTShape)="_dwlab_frmwork_LTShape_DirectionTo"
-SetWidth%(NewWidth!)="_dwlab_frmwork_LTShape_SetWidth"
-SetHeight%(NewHeight!)="_dwlab_frmwork_LTShape_SetHeight"
-SetSize%(NewWidth!,NewHeight!)="_dwlab_frmwork_LTShape_SetSize"
-GetDiameter!()="_dwlab_frmwork_LTShape_GetDiameter"
-SetDiameter%(NewDiameter!)="_dwlab_frmwork_LTShape_SetDiameter"
-CorrectHeight%()="_dwlab_frmwork_LTShape_CorrectHeight"
-GetFacing!()="_dwlab_frmwork_LTShape_GetFacing"
-SetFacing%(NewFacing!)="_dwlab_frmwork_LTShape_SetFacing"
-AttachModel%(Model:LTBehaviorModel,Activated%=1)="_dwlab_frmwork_LTShape_AttachModel"
-FindModel:LTBehaviorModel(TypeName$)="_dwlab_frmwork_LTShape_FindModel"
-ActivateAllModels%()="_dwlab_frmwork_LTShape_ActivateAllModels"
-DeactivateAllModels%()="_dwlab_frmwork_LTShape_DeactivateAllModels"
-ActivateModel%(TypeName$)="_dwlab_frmwork_LTShape_ActivateModel"
-DeactivateModel%(TypeName$)="_dwlab_frmwork_LTShape_DeactivateModel"
-ToggleModel%(TypeName$)="_dwlab_frmwork_LTShape_ToggleModel"
-RemoveModel%(TypeName$)="_dwlab_frmwork_LTShape_RemoveModel"
-LimitByWindow%(X!,Y!,Width!,Height!)="_dwlab_frmwork_LTShape_LimitByWindow"
-LimitByWindowShape%(Shape:LTShape)="_dwlab_frmwork_LTShape_LimitByWindowShape"
-RemoveWindowLimit%()="_dwlab_frmwork_LTShape_RemoveWindowLimit"
-Init%()="_dwlab_frmwork_LTShape_Init"
-Clone:LTShape()="_dwlab_frmwork_LTShape_Clone"
-CopyTo%(Shape:LTShape)="_dwlab_frmwork_LTShape_CopyTo"
-Act%()="_dwlab_frmwork_LTShape_Act"
-Update%()="_dwlab_frmwork_LTShape_Update"
-Destroy%()="_dwlab_frmwork_LTShape_Destroy"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTShape_XMLIO"
}="dwlab_frmwork_LTShape"
LTGroup^LTShape{
.Children:brl.linkedlist.TList&
-New%()="_dwlab_frmwork_LTGroup_New"
-Draw%()="_dwlab_frmwork_LTGroup_Draw"
-DrawUsingVisualizer%(Vis:LTVisualizer)="_dwlab_frmwork_LTGroup_DrawUsingVisualizer"
-Init%()="_dwlab_frmwork_LTGroup_Init"
-Act%()="_dwlab_frmwork_LTGroup_Act"
-SpriteGroupCollisions%(Sprite:LTSprite,CollisionType%)="_dwlab_frmwork_LTGroup_SpriteGroupCollisions"
-TileShapeCollisionsWithSprite%(Sprite:LTSprite,DX!,DY!,XScale!,YScale!,TileMap:LTTileMap,TileX%,TileY%,CollisionType%)="_dwlab_frmwork_LTGroup_TileShapeCollisionsWithSprite"
-AddLast:brl.linkedlist.TLink(Shape:LTShape)="_dwlab_frmwork_LTGroup_AddLast"
-Remove%(Shape:LTShape)="_dwlab_frmwork_LTGroup_Remove"
-Clear%()="_dwlab_frmwork_LTGroup_Clear"
-ValueAtIndex:LTShape(Index%)="_dwlab_frmwork_LTGroup_ValueAtIndex"
-ObjectEnumerator:brl.linkedlist.TListEnum()="_dwlab_frmwork_LTGroup_ObjectEnumerator"
-Clone:LTShape()="_dwlab_frmwork_LTGroup_Clone"
-Update%()="_dwlab_frmwork_LTGroup_Update"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTGroup_XMLIO"
}="dwlab_frmwork_LTGroup"
LTLayer^LTGroup{
.Bounds:LTShape&
-New%()="_dwlab_frmwork_LTLayer_New"
-Draw%()="_dwlab_frmwork_LTLayer_Draw"
-CountSprites%()="_dwlab_frmwork_LTLayer_CountSprites"
-FindShape:LTShape(ShapeName$,IgnoreError%=0)="_dwlab_frmwork_LTLayer_FindShape"
-FindShapeWithType:LTShape(ShapeType$,Name$=$"",IgnoreError%=0)="_dwlab_frmwork_LTLayer_FindShapeWithType"
-FindShapeWithTypeID:LTShape(ShapeTypeID:brl.reflection.TTypeId,Name$=$"",IgnoreError%=0)="_dwlab_frmwork_LTLayer_FindShapeWithTypeID"
-Remove%(Shape:LTShape)="_dwlab_frmwork_LTLayer_Remove"
-SetBounds%(Shape:LTShape)="_dwlab_frmwork_LTLayer_SetBounds"
-CopyTo%(Shape:LTShape)="_dwlab_frmwork_LTLayer_CopyTo"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTLayer_XMLIO"
}="dwlab_frmwork_LTLayer"
LTWorld^LTLayer{
.Images:brl.linkedlist.TList&
.Tilesets:brl.linkedlist.TList&
.Camera:LTCamera&
.IncbinValue%&
-New%()="_dwlab_frmwork_LTWorld_New"
+FromFile:LTWorld(Filename$)="_dwlab_frmwork_LTWorld_FromFile"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTWorld_XMLIO"
}="dwlab_frmwork_LTWorld"
LTSprite^LTShape{
Pivot%=0
Circle%=1
Oval%=1
Rectangle%=2
.ShapeType%&
.Frame%&
.SpriteMap:LTSpriteMap&
-New%()="_dwlab_frmwork_LTSprite_New"
-Draw%()="_dwlab_frmwork_LTSprite_Draw"
-DrawUsingVisualizer%(Vis:LTVisualizer)="_dwlab_frmwork_LTSprite_DrawUsingVisualizer"
-TileShapeCollisionsWithSprite%(Sprite:LTSprite,DX!,DY!,XScale!,YScale!,TileMap:LTTileMap,TileX%,TileY%,CollisionType%)="_dwlab_frmwork_LTSprite_TileShapeCollisionsWithSprite"
-CollidesWithSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTSprite_CollidesWithSprite"
-CollidesWithLine%(Line:LTLine)="_dwlab_frmwork_LTSprite_CollidesWithLine"
-TileSpriteCollidesWithSprite%(Sprite:LTSprite,DX!,DY!,XScale!,YScale!)="_dwlab_frmwork_LTSprite_TileSpriteCollidesWithSprite"
-Overlaps%(Sprite:LTSprite)="_dwlab_frmwork_LTSprite_Overlaps"
-CollisionsWithGroup%(Group:LTGroup,CollisionType%=0)="_dwlab_frmwork_LTSprite_CollisionsWithGroup"
-CollisionsWithSprite%(Sprite:LTSprite,CollisionType%=0)="_dwlab_frmwork_LTSprite_CollisionsWithSprite"
-CollisionsWithTileMap%(TileMap:LTTileMap,CollisionType%=0)="_dwlab_frmwork_LTSprite_CollisionsWithTileMap"
-CollisionsWithLine%(Line:LTLine,CollisionType%=0)="_dwlab_frmwork_LTSprite_CollisionsWithLine"
-CollisionsWithSpriteMap%(SpriteMap:LTSpriteMap,CollisionType%=0,Map:brl.map.TMap="bbNullObject")="_dwlab_frmwork_LTSprite_CollisionsWithSpriteMap"
-SpriteGroupCollisions%(Sprite:LTSprite,CollisionType%=0)="_dwlab_frmwork_LTSprite_SpriteGroupCollisions"
-HandleCollisionWithSprite%(Sprite:LTSprite,CollisionType%=0)="_dwlab_frmwork_LTSprite_HandleCollisionWithSprite"
-HandleCollisionWithTile%(TileMap:LTTileMap,TileX%,TileY%,CollisionType%=0)="_dwlab_frmwork_LTSprite_HandleCollisionWithTile"
-HandleCollisionWithLine%(Line:LTLine,CollisionType%)="_dwlab_frmwork_LTSprite_HandleCollisionWithLine"
-WedgeOffWithSprite%(Sprite:LTSprite,SelfMass!,SpriteMass!)="_dwlab_frmwork_LTSprite_WedgeOffWithSprite"
-PushFromSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTSprite_PushFromSprite"
-PushFromTile%(TileMap:LTTileMap,TileX%,TileY%)="_dwlab_frmwork_LTSprite_PushFromTile"
-PushFromTileSprite%(TileSprite:LTSprite,DX!,DY!,XScale!,YScale!)="_dwlab_frmwork_LTSprite_PushFromTileSprite"
-SetCoords%(NewX!,NewY!)="_dwlab_frmwork_LTSprite_SetCoords"
-MoveForward%()="_dwlab_frmwork_LTSprite_MoveForward"
-SetSize%(NewWidth!,NewHeight!)="_dwlab_frmwork_LTSprite_SetSize"
-SetAsTile%(TileMap:LTTileMap,TileX%,TileY%)="_dwlab_frmwork_LTSprite_SetAsTile"
-Animate%(Project:LTProject,Speed!,FramesQuantity%=0,FrameStart%=0,StartingTime!=0!,PingPong%=0)="_dwlab_frmwork_LTSprite_Animate"
-Clone:LTShape()="_dwlab_frmwork_LTSprite_Clone"
-CopyTo%(Shape:LTShape)="_dwlab_frmwork_LTSprite_CopyTo"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTSprite_XMLIO"
}="dwlab_frmwork_LTSprite"
LTAngularSprite^LTSprite{
.Angle!&
.Velocity!&
-New%()="_dwlab_frmwork_LTAngularSprite_New"
-MoveTowards%(Shape:LTShape)="_dwlab_frmwork_LTAngularSprite_MoveTowards"
-MoveForward%()="_dwlab_frmwork_LTAngularSprite_MoveForward"
-DirectAs%(Sprite:LTAngularSprite)="_dwlab_frmwork_LTAngularSprite_DirectAs"
-Turn%(TurningSpeed!)="_dwlab_frmwork_LTAngularSprite_Turn"
-DirectTo%(Shape:LTShape)="_dwlab_frmwork_LTAngularSprite_DirectTo"
-Clone:LTShape()="_dwlab_frmwork_LTAngularSprite_Clone"
-CopyTo%(Shape:LTShape)="_dwlab_frmwork_LTAngularSprite_CopyTo"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTAngularSprite_XMLIO"
}="dwlab_frmwork_LTAngularSprite"
LTVectorSprite^LTSprite{
.DX!&
.DY!&
-New%()="_dwlab_frmwork_LTVectorSprite_New"
-MoveForward%()="_dwlab_frmwork_LTVectorSprite_MoveForward"
-Clone:LTShape()="_dwlab_frmwork_LTVectorSprite_Clone"
-CopyTo%(Shape:LTShape)="_dwlab_frmwork_LTVectorSprite_CopyTo"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTVectorSprite_XMLIO"
}="dwlab_frmwork_LTVectorSprite"
LTCamera^LTSprite{
.Viewport:LTShape&
.K!&
.DX!&
.DY!&
.ViewportClipping%&
.Isometric%&
.VX1!&
.VY1!&
.VX2!&
.VY2!&
.VK!&
-New%()="_dwlab_frmwork_LTCamera_New"
-ScreenToField%(ScreenX!,ScreenY!,FieldX! Var,FieldY! Var)="_dwlab_frmwork_LTCamera_ScreenToField"
-SizeScreenToField%(ScreenWidth!,ScreenHeight!,FieldWidth! Var,FieldHeight! Var)="_dwlab_frmwork_LTCamera_SizeScreenToField"
-DistScreenToField!(ScreenDist!)="_dwlab_frmwork_LTCamera_DistScreenToField"
-FieldToScreen%(FieldX!,FieldY!,ScreenX! Var,ScreenY! Var)="_dwlab_frmwork_LTCamera_FieldToScreen"
-SizeFieldToScreen%(FieldWidth!,FieldHeight!,ScreenWidth! Var,ScreenHeight! Var)="_dwlab_frmwork_LTCamera_SizeFieldToScreen"
-DistFieldToScreen!(ScreenDist!)="_dwlab_frmwork_LTCamera_DistFieldToScreen"
-SetCameraViewport%()="_dwlab_frmwork_LTCamera_SetCameraViewport"
-ResetViewport%()="_dwlab_frmwork_LTCamera_ResetViewport"
-SetMagnification%(NewK!)="_dwlab_frmwork_LTCamera_SetMagnification"
-ShiftCameraToPoint%(NewX!,NewY!)="_dwlab_frmwork_LTCamera_ShiftCameraToPoint"
-AlterCameraMagnification%(NewK!)="_dwlab_frmwork_LTCamera_AlterCameraMagnification"
-Update%()="_dwlab_frmwork_LTCamera_Update"
+Create:LTCamera(Width!,Height!,UnitSize!)="_dwlab_frmwork_LTCamera_Create"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTCamera_XMLIO"
}="dwlab_frmwork_LTCamera"
L_InitGraphics%(Width%=800,Height%=600,UnitSize!=32!)="dwlab_frmwork_L_InitGraphics"
L_Inaccuracy!=1e-006!
L_PivotWithPivot%(Pivot1X!,Pivot1Y!,Pivot2X!,Pivot2Y!)="dwlab_frmwork_L_PivotWithPivot"
L_PivotWithOval%(PivotX!,PivotY!,OvalX!,OvalY!,OvalWidth!,OvalHeight!)="dwlab_frmwork_L_PivotWithOval"
L_PivotWithRectangle%(PivotX!,PivotY!,RectangleX!,RectangleY!,RectangleWidth!,RectangleHeight!)="dwlab_frmwork_L_PivotWithRectangle"
L_OvalWithOval%(Oval1X!,Oval1Y!,Oval1Width!,Oval1Height!,Oval2X!,Oval2Y!,Oval2Width!,Oval2Height!)="dwlab_frmwork_L_OvalWithOval"
L_OvalWithRectangle%(OvalX!,OvalY!,OvalWidth!,OvalHeight!,RectangleX!,RectangleY!,RectangleWidth!,RectangleHeight!)="dwlab_frmwork_L_OvalWithRectangle"
L_RectangleWithRectangle%(Rectangle1X!,Rectangle1Y!,Rectangle1Width!,Rectangle1Height!,Rectangle2X!,Rectangle2Y!,Rectangle2Width!,Rectangle2Height!)="dwlab_frmwork_L_RectangleWithRectangle"
L_OvalWithLine%(OvalX!,OvalY!,OvalWidth!,OvalHeight!,LineX1!,LineY1!,LineX2!,LineY2!)="dwlab_frmwork_L_OvalWithLine"
L_OvalOverlapsOval%(Oval1X!,Oval1Y!,Oval1Width!,Oval1Height!,Oval2X!,Oval2Y!,Oval2Width!,Oval2Height!)="dwlab_frmwork_L_OvalOverlapsOval"
L_RectangleOverlapsRectangle%(Rectangle1X!,Rectangle1Y!,Rectangle1Width!,Rectangle1Height!,Rectangle2X!,Rectangle2Y!,Rectangle2Width!,Rectangle2Height!)="dwlab_frmwork_L_RectangleOverlapsRectangle"
L_GetOvalDiameter!(OvalX! Var,OvalY! Var,OvalWidth!,OvalHeight!,X!,Y!)="dwlab_frmwork_L_GetOvalDiameter"
L_WedgingValuesOfOvalAndOval%(Oval1X!,Oval1Y!,Oval1Width!,Oval1Height!,Oval2X!,Oval2Y!,Oval2Width!,Oval2Height!,DX! Var,DY! Var)="dwlab_frmwork_L_WedgingValuesOfOvalAndOval"
L_WedgingValuesOfOvalAndRectangle%(OvalX!,OvalY!,OvalWidth!,OvalHeight!,RectangleX!,RectangleY!,RectangleWidth!,RectangleHeight!,DX! Var,DY! Var)="dwlab_frmwork_L_WedgingValuesOfOvalAndRectangle"
L_WedgingValuesOfRectangleAndRectangle%(Rectangle1X!,Rectangle1Y!,Rectangle1Width!,Rectangle1Height!,Rectangle2X!,Rectangle2Y!,Rectangle2Width!,Rectangle2Height!,DX! Var,DY! Var)="dwlab_frmwork_L_WedgingValuesOfRectangleAndRectangle"
L_Separate%(Pivot1:LTSprite,Pivot2:LTSprite,DX!,DY!,Mass1!,Mass2!)="dwlab_frmwork_L_Separate"
LTMap^LTShape{
.XQuantity%&
.YQuantity%&
.XMask%&
.YMask%&
.Masked%&
-New%()="_dwlab_frmwork_LTMap_New"
-SetResolution%(NewXQuantity%,NewYQuantity%)="_dwlab_frmwork_LTMap_SetResolution"
-WrapX%(Value%)="_dwlab_frmwork_LTMap_WrapX"
-WrapY%(Value%)="_dwlab_frmwork_LTMap_WrapY"
-Stretch:LTMap(XMultiplier%,YMultiplier%)="_dwlab_frmwork_LTMap_Stretch"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTMap_XMLIO"
}="dwlab_frmwork_LTMap"
LTIntMap^LTMap{
.Value%&[,]&
-New%()="_dwlab_frmwork_LTIntMap_New"
-SetResolution%(NewXQuantity%,NewYQuantity%)="_dwlab_frmwork_LTIntMap_SetResolution"
+FromFile:LTIntMap(Filename$)="_dwlab_frmwork_LTIntMap_FromFile"
-Stretch:LTIntMap(XMultiplier%,YMultiplier%)="_dwlab_frmwork_LTIntMap_Stretch"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTIntMap_XMLIO"
}="dwlab_frmwork_LTIntMap"
LTTileMap^LTIntMap{
.TileSet:LTTileset&
.TilesQuantity%&
.Wrapped%&
-New%()="_dwlab_frmwork_LTTileMap_New"
-GetTileWidth!()="_dwlab_frmwork_LTTileMap_GetTileWidth"
-GetTileHeight!()="_dwlab_frmwork_LTTileMap_GetTileHeight"
-GetTileCollisionShape:LTShape(TileX%,TileY%)="_dwlab_frmwork_LTTileMap_GetTileCollisionShape"
-Draw%()="_dwlab_frmwork_LTTileMap_Draw"
-DrawUsingVisualizer%(Visualizer:LTVisualizer)="_dwlab_frmwork_LTTileMap_DrawUsingVisualizer"
-DrawIsoTile%(X!,Y!,TileX%,TileY%)="_dwlab_frmwork_LTTileMap_DrawIsoTile"
-Enframe%(ByTileSet:LTTileset="bbNullObject")="_dwlab_frmwork_LTTileMap_Enframe"
-GetTile%(TileX%,TileY%)="_dwlab_frmwork_LTTileMap_GetTile"
-SetTile%(TileX%,TileY%,TileNum%)="_dwlab_frmwork_LTTileMap_SetTile"
-RefreshTilesQuantity%()="_dwlab_frmwork_LTTileMap_RefreshTilesQuantity"
+Create:LTTileMap(TileSet:LTTileSet,XQuantity%,YQuantity%)="_dwlab_frmwork_LTTileMap_Create"
-Clone:LTShape()="_dwlab_frmwork_LTTileMap_Clone"
-CopyTo%(Shape:LTShape)="_dwlab_frmwork_LTTileMap_CopyTo"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTTileMap_XMLIO"
}="dwlab_frmwork_LTTileMap"
LTTileSet^LTObject{
.Image:LTImage&
.CollisionShape:LTShape&[]&
.BlockWidth%&[]&
.BlockHeight%&[]&
.Categories:brl.linkedlist.TList&
.TilesQuantity%&
.TileCategory%&[]&
.EmptyTile%&
-New%()="_dwlab_frmwork_LTTileSet_New"
-RefreshTilesQuantity%()="_dwlab_frmwork_LTTileSet_RefreshTilesQuantity"
-Enframe%(TileMap:LTTileMap,X%,Y%)="_dwlab_frmwork_LTTileSet_Enframe"
-GetTileCategory%(TileMap:LTTileMap,X%,Y%)="_dwlab_frmwork_LTTileSet_GetTileCategory"
-Update%()="_dwlab_frmwork_LTTileSet_Update"
+Create:LTTileSet(Image:LTImage)="_dwlab_frmwork_LTTileSet_Create"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTTileSet_XMLIO"
}="dwlab_frmwork_LTTileSet"
LTTileCategory^LTObject{
.Num%&
.TileRules:brl.linkedlist.TList&
-New%()="_dwlab_frmwork_LTTileCategory_New"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTTileCategory_XMLIO"
}="dwlab_frmwork_LTTileCategory"
LTTileRule^LTObject{
.TileNums%&[]&
.TilePositions:brl.linkedlist.TList&
.X%&
.Y%&
.XDivider%&
.YDivider%&
-New%()="_dwlab_frmwork_LTTileRule_New"
-TilesQuantity%()="_dwlab_frmwork_LTTileRule_TilesQuantity"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTTileRule_XMLIO"
}="dwlab_frmwork_LTTileRule"
LTTilePos^LTObject{
.DX%&
.DY%&
.TileNum%&
.Category%&
-New%()="_dwlab_frmwork_LTTilePos_New"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTTilePos_XMLIO"
}="dwlab_frmwork_LTTilePos"
LTDoubleMap^LTMap{
Red%=0
Green%=1
Blue%=2
Alpha%=3
RGB%=4
Overwrite%=0
Add%=1
Multiply%=2
Maximum%=3
Minimum%=4
CircleBound!=0.707107!
.Value!&[,]&
-New%()="_dwlab_frmwork_LTDoubleMap_New"
-SetResolution%(NewXQuantity%,NewYQuantity%)="_dwlab_frmwork_LTDoubleMap_SetResolution"
-ToNewImage:LTImage(Channel%=4)="_dwlab_frmwork_LTDoubleMap_ToNewImage"
-ToNewPixmap:brl.pixmap.TPixmap(Channel%=4)="_dwlab_frmwork_LTDoubleMap_ToNewPixmap"
-PasteToImage%(Image:LTImage,XShift%=0,YShift%=0,Frame%=0,Channel%=4)="_dwlab_frmwork_LTDoubleMap_PasteToImage"
-PasteToPixmap%(Pixmap:brl.pixmap.TPixmap,XShift%=0,YShift%=0,Channel%=4)="_dwlab_frmwork_LTDoubleMap_PasteToPixmap"
-Paste%(SourceMap:LTDoubleMap,X%,Y%,Mode%=0)="_dwlab_frmwork_LTDoubleMap_Paste"
-ExtractTo%(TileMap:LTIntMap,VFrom!,VTo!,TileNum%)="_dwlab_frmwork_LTDoubleMap_ExtractTo"
-Blur%()="_dwlab_frmwork_LTDoubleMap_Blur"
-PerlinNoise%(StartingXFrequency%,StartingYFrequency!,StartingAmplitude!,DAmplitude!,LayersQuantity%)="_dwlab_frmwork_LTDoubleMap_PerlinNoise"
-DrawCircle%(XCenter!,YCenter!,Radius!,Color!=1!)="_dwlab_frmwork_LTDoubleMap_DrawCircle"
-Limit%()="_dwlab_frmwork_LTDoubleMap_Limit"
}="dwlab_frmwork_LTDoubleMap"
LTSpriteMap^LTMap{
.Sprites:brl.linkedlist.TList&[,]&
.CellWidth!&
.CellHeight!&
.LeftMargin!&
.RightMargin!&
.TopMargin!&
.BottomMargin!&
.Sorted%&
.PivotMode%&
.ObjectRadius!&
-New%()="_dwlab_frmwork_LTSpriteMap_New"
-SetResolution%(NewXQuantity%,NewYQuantity%)="_dwlab_frmwork_LTSpriteMap_SetResolution"
-SetCellSize%(NewCellWidth!,NewCellHeight!)="_dwlab_frmwork_LTSpriteMap_SetCellSize"
-SetBorder%(Border!)="_dwlab_frmwork_LTSpriteMap_SetBorder"
-SetMargins%(NewLeftMargin!,NewTopMargin!,NewRightMargin!,NewBottomMargin!)="_dwlab_frmwork_LTSpriteMap_SetMargins"
-GetSprites:brl.map.TMap()="_dwlab_frmwork_LTSpriteMap_GetSprites"
-Draw%()="_dwlab_frmwork_LTSpriteMap_Draw"
-DrawUsingVisualizer%(Vis:LTVisualizer)="_dwlab_frmwork_LTSpriteMap_DrawUsingVisualizer"
-DrawIsoTile%(X!,Y!,TileX%,TileY%)="_dwlab_frmwork_LTSpriteMap_DrawIsoTile"
-InsertSprite%(Sprite:LTSprite,ChangeSpriteMapField%=1)="_dwlab_frmwork_LTSpriteMap_InsertSprite"
-InsertSpriteTo%(Sprite:LTSprite,MapX%,MapY%)="_dwlab_frmwork_LTSpriteMap_InsertSpriteTo"
-RemoveSprite%(Sprite:LTSprite,ChangeSpriteMapField%=1)="_dwlab_frmwork_LTSpriteMap_RemoveSprite"
-Clear%()="_dwlab_frmwork_LTSpriteMap_Clear"
+Create:LTSpriteMap(XQuantity%,YQuantity%,CellWidth!=1!,CellHeight!=1!,Sorted%=0)="_dwlab_frmwork_LTSpriteMap_Create"
+CreateForShape:LTSpriteMap(Shape:LTShape,CellSize!=1!,Sorted%=0)="_dwlab_frmwork_LTSpriteMap_CreateForShape"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTSpriteMap_XMLIO"
}="dwlab_frmwork_LTSpriteMap"
LTLine^LTShape{
.Pivot:LTSprite&[]&
-New%()="_dwlab_frmwork_LTLine_New"
-Create:LTLine(Pivot1:LTSprite,Pivot2:LTSprite)="_dwlab_frmwork_LTLine_Create"
-Draw%()="_dwlab_frmwork_LTLine_Draw"
-DrawUsingVisualizer%(Vis:LTVisualizer)="_dwlab_frmwork_LTLine_DrawUsingVisualizer"
-SpriteGroupCollisions%(Sprite:LTSprite,CollisionType%)="_dwlab_frmwork_LTLine_SpriteGroupCollisions"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTLine_XMLIO"
}="dwlab_frmwork_LTLine"
LTGraph^LTShape{
.Pivots:brl.map.TMap&
.Lines:brl.map.TMap&
-New%()="_dwlab_frmwork_LTGraph_New"
-Draw%()="_dwlab_frmwork_LTGraph_Draw"
-DrawUsingVisualizer%(Vis:LTVisualizer)="_dwlab_frmwork_LTGraph_DrawUsingVisualizer"
-DrawPivotsUsing%(Visualizer:LTVisualizer)="_dwlab_frmwork_LTGraph_DrawPivotsUsing"
-DrawLinesUsing%(Visualizer:LTVisualizer)="_dwlab_frmwork_LTGraph_DrawLinesUsing"
-AddPivot:brl.linkedlist.TList(Pivot:LTSprite)="_dwlab_frmwork_LTGraph_AddPivot"
-AddLine%(Line:LTLine)="_dwlab_frmwork_LTGraph_AddLine"
-RemovePivot%(Pivot:LTSprite)="_dwlab_frmwork_LTGraph_RemovePivot"
-RemoveLine%(Line:LTLine)="_dwlab_frmwork_LTGraph_RemoveLine"
-FindPivotCollidingWith:LTSprite(Sprite:LTSprite)="_dwlab_frmwork_LTGraph_FindPivotCollidingWith"
-FindLineCollidingWith:LTLine(Sprite:LTSprite)="_dwlab_frmwork_LTGraph_FindLineCollidingWith"
-ContainsPivot%(Pivot:LTSprite)="_dwlab_frmwork_LTGraph_ContainsPivot"
-ContainsLine%(Line:LTLine)="_dwlab_frmwork_LTGraph_ContainsLine"
-FindLine:LTLine(Pivot1:LTSprite,Pivot2:LTSprite)="_dwlab_frmwork_LTGraph_FindLine"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTGraph_XMLIO"
}="dwlab_frmwork_LTGraph"
LTAddPivotToGraph^LTAction{
.Graph:LTGraph&
.Pivot:LTSprite&
-New%()="_dwlab_frmwork_LTAddPivotToGraph_New"
+Create:LTAddPivotToGraph(Graph:LTGraph,Pivot:LTSprite)="_dwlab_frmwork_LTAddPivotToGraph_Create"
-Do%()="_dwlab_frmwork_LTAddPivotToGraph_Do"
-Undo%()="_dwlab_frmwork_LTAddPivotToGraph_Undo"
}="dwlab_frmwork_LTAddPivotToGraph"
LTAddLineToGraph^LTAction{
.Graph:LTGraph&
.Line:LTLine&
-New%()="_dwlab_frmwork_LTAddLineToGraph_New"
+Create:LTAddLineToGraph(Graph:LTGraph,Line:LTLine)="_dwlab_frmwork_LTAddLineToGraph_Create"
-Do%()="_dwlab_frmwork_LTAddLineToGraph_Do"
-Undo%()="_dwlab_frmwork_LTAddLineToGraph_Undo"
}="dwlab_frmwork_LTAddLineToGraph"
LTRemovePivotFromGraph^LTAction{
.Graph:LTGraph&
.Pivot:LTSprite&
.Lines:brl.linkedlist.TList&
-New%()="_dwlab_frmwork_LTRemovePivotFromGraph_New"
+Create:LTRemovePivotFromGraph(Graph:LTGraph,Pivot:LTSprite)="_dwlab_frmwork_LTRemovePivotFromGraph_Create"
-Do%()="_dwlab_frmwork_LTRemovePivotFromGraph_Do"
-Undo%()="_dwlab_frmwork_LTRemovePivotFromGraph_Undo"
}="dwlab_frmwork_LTRemovePivotFromGraph"
LTRemoveLineFromGraph^LTAction{
.Graph:LTGraph&
.Line:LTLine&
-New%()="_dwlab_frmwork_LTRemoveLineFromGraph_New"
+Create:LTRemoveLineFromGraph(Graph:LTGraph,Line:LTLine)="_dwlab_frmwork_LTRemoveLineFromGraph_Create"
-Do%()="_dwlab_frmwork_LTRemoveLineFromGraph_Do"
-Undo%()="_dwlab_frmwork_LTRemoveLineFromGraph_Undo"
}="dwlab_frmwork_LTRemoveLineFromGraph"
LTVisualizer^LTObject{
.Red!&
.Green!&
.Blue!&
.Alpha!&
.DX!&
.DY!&
.XScale!&
.YScale!&
.Scaling%&
.Angle!&
.Rotating%&
.Image:LTImage&
-New%()="_dwlab_frmwork_LTVisualizer_New"
+FromFile:LTVisualizer(Filename$,XCells%=1,YCells%=1)="_dwlab_frmwork_LTVisualizer_FromFile"
+FromImage:LTVisualizer(Image:LTImage)="_dwlab_frmwork_LTVisualizer_FromImage"
-SetDXDY%(NewDX!,NewDY!)="_dwlab_frmwork_LTVisualizer_SetDXDY"
-SetVisualizerScale%(NewXScale!,NewYScale!)="_dwlab_frmwork_LTVisualizer_SetVisualizerScale"
-SetVisualizerScales%(NewScale!)="_dwlab_frmwork_LTVisualizer_SetVisualizerScales"
-GetImage:LTImage()="_dwlab_frmwork_LTVisualizer_GetImage"
-SetImage%(NewImage:LTImage)="_dwlab_frmwork_LTVisualizer_SetImage"
-DrawUsingSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTVisualizer_DrawUsingSprite"
-DrawUsingLine%(Line:LTLine)="_dwlab_frmwork_LTVisualizer_DrawUsingLine"
-DrawUsingTileMap%(TileMap:LTTileMap,Shapes:brl.linkedlist.TList="bbNullObject")="_dwlab_frmwork_LTVisualizer_DrawUsingTileMap"
-DrawTile%(TileMap:LTTileMap,X!,Y!,TileX%,TileY%)="_dwlab_frmwork_LTVisualizer_DrawTile"
-SetColorFromHex%(S$)="_dwlab_frmwork_LTVisualizer_SetColorFromHex"
-SetColorFromRGB%(NewRed!,NewGreen!,NewBlue!)="_dwlab_frmwork_LTVisualizer_SetColorFromRGB"
-AlterColor%(D1!,D2!)="_dwlab_frmwork_LTVisualizer_AlterColor"
-ApplyColor%()="_dwlab_frmwork_LTVisualizer_ApplyColor"
-ResetColor%()="_dwlab_frmwork_LTVisualizer_ResetColor"
-Clone:LTVisualizer()="_dwlab_frmwork_LTVisualizer_Clone"
-CopyTo%(Visualizer:LTVisualizer)="_dwlab_frmwork_LTVisualizer_CopyTo"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTVisualizer_XMLIO"
}="dwlab_frmwork_LTVisualizer"
LTImageVisualizer^LTVisualizer{
-New%()="_dwlab_frmwork_LTImageVisualizer_New"
}="dwlab_frmwork_LTImageVisualizer"
LTTile^brl.blitz.Object{
.TileX%&
.TileY%&
.TileDX%&
.TileDY%&
.DX!&
.DY!&
-New%()="_dwlab_frmwork_LTTile_New"
}="dwlab_frmwork_LTTile"
LTImage^LTObject{
.BMaxImage:brl.max2d.TImage&
.Filename$&
.XCells%&
.YCells%&
-New%()="_dwlab_frmwork_LTImage_New"
+FromFile:LTImage(Filename$,XCells%=1,YCells%=1)="_dwlab_frmwork_LTImage_FromFile"
-Init%()="_dwlab_frmwork_LTImage_Init"
-SetHandle%(X!,Y!)="_dwlab_frmwork_LTImage_SetHandle"
-FramesQuantity%()="_dwlab_frmwork_LTImage_FramesQuantity"
-Width!()="_dwlab_frmwork_LTImage_Width"
-Height!()="_dwlab_frmwork_LTImage_Height"
-XMLIO%(XMLObject:LTXMLObject)="_dwlab_frmwork_LTImage_XMLIO"
}="dwlab_frmwork_LTImage"
LTAnimatedTileMapVisualizer^LTVisualizer{
.TileNum%&[]&
-New%()="_dwlab_frmwork_LTAnimatedTileMapVisualizer_New"
-DrawTile%(TileMap:LTTileMap,X!,Y!,TileX%,TileY%)="_dwlab_frmwork_LTAnimatedTileMapVisualizer_DrawTile"
}="dwlab_frmwork_LTAnimatedTileMapVisualizer"
LTEmptyPrimitive^LTVisualizer{
.LineWidth!&
-New%()="_dwlab_frmwork_LTEmptyPrimitive_New"
-DrawUsingSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTEmptyPrimitive_DrawUsingSprite"
-DrawUsingLine%(Line:LTLine)="_dwlab_frmwork_LTEmptyPrimitive_DrawUsingLine"
-SetProperLineWidth%()="_dwlab_frmwork_LTEmptyPrimitive_SetProperLineWidth"
}="dwlab_frmwork_LTEmptyPrimitive"
LTMarchingAnts^LTVisualizer{
-New%()="_dwlab_frmwork_LTMarchingAnts_New"
-DrawUsingSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTMarchingAnts_DrawUsingSprite"
+DrawMARect%(X%,Y%,Width%,Height%)="_dwlab_frmwork_LTMarchingAnts_DrawMARect"
+MakeMALine:brl.max2d.TImage(Width%,Pos% Var)="_dwlab_frmwork_LTMarchingAnts_MakeMALine"
+DrawMALine%(Image:brl.max2d.TImage,X1%,Y1%,X2%,Y2%)="_dwlab_frmwork_LTMarchingAnts_DrawMALine"
}="dwlab_frmwork_LTMarchingAnts"
LTWindowedVisualizer^LTVisualizer{
.Viewport:LTShape&
.Visualizer:LTVisualizer&
-New%()="_dwlab_frmwork_LTWindowedVisualizer_New"
-GetImage:LTImage()="_dwlab_frmwork_LTWindowedVisualizer_GetImage"
-SetImage%(NewImage:LTImage)="_dwlab_frmwork_LTWindowedVisualizer_SetImage"
-DrawUsingSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTWindowedVisualizer_DrawUsingSprite"
}="dwlab_frmwork_LTWindowedVisualizer"
LTDebugVisualizer^LTVisualizer{
.ShowCollisionShapes%&
.ShowVectors%&
.ShowNames%&
-New%()="_dwlab_frmwork_LTDebugVisualizer_New"
-DrawUsingSprite%(Sprite:LTSprite)="_dwlab_frmwork_LTDebugVisualizer_DrawUsingSprite"
-DrawUsingTileMap%(TileMap:LTTileMap,Tiles:brl.linkedlist.TList="bbNullObject")="_dwlab_frmwork_LTDebugVisualizer_DrawUsingTileMap"
-DrawTile%(TileMap:LTTileMap,X!,Y!,TileX%,TileY%)="_dwlab_frmwork_LTDebugVisualizer_DrawTile"
-DrawCollisionSprite%(TileMap:LTTileMap,X!,Y!,Sprite:LTSprite)="_dwlab_frmwork_LTDebugVisualizer_DrawCollisionSprite"
}="dwlab_frmwork_LTDebugVisualizer"
LTBehaviorModel^LTObject{
.Active%&
.Link:brl.linkedlist.TLink&
-New%()="_dwlab_frmwork_LTBehaviorModel_New"
-Init%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_Init"
-Activate%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_Activate"
-Deactivate%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_Deactivate"
-Watch%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_Watch"
-ApplyTo%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_ApplyTo"
-HandleCollisionWithSprite%(Sprite1:LTSprite,Sprite2:LTSprite,CollisionType%)="_dwlab_frmwork_LTBehaviorModel_HandleCollisionWithSprite"
-HandleCollisionWithTile%(Sprite:LTSprite,TileMap:LTTileMap,TileX%,TileY%,CollisionType%)="_dwlab_frmwork_LTBehaviorModel_HandleCollisionWithTile"
-ActivateModel%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_ActivateModel"
-DeactivateModel%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_DeactivateModel"
-Remove%(Shape:LTShape)="_dwlab_frmwork_LTBehaviorModel_Remove"
}="dwlab_frmwork_LTBehaviorModel"
LTFixedJoint^LTBehaviorModel{
.ParentPivot:LTAngularSprite&
.Angle!&
.Distance!&
.DAngle!&
-New%()="_dwlab_frmwork_LTFixedJoint_New"
+Create:LTFixedJoint(ParentPivot:LTAngularSprite)="_dwlab_frmwork_LTFixedJoint_Create"
-Init%(Shape:LTShape)="_dwlab_frmwork_LTFixedJoint_Init"
-ApplyTo%(Shape:LTShape)="_dwlab_frmwork_LTFixedJoint_ApplyTo"
}="dwlab_frmwork_LTFixedJoint"
LTRevoluteJoint^LTBehaviorModel{
.ParentPivot:LTAngularSprite&
.Pivot:LTSprite&
.Angle!&
.Distance!&
-New%()="_dwlab_frmwork_LTRevoluteJoint_New"
+Create:LTRevoluteJoint(ParentPivot:LTAngularSprite)="_dwlab_frmwork_LTRevoluteJoint_Create"
-Init%(Shape:LTShape)="_dwlab_frmwork_LTRevoluteJoint_Init"
-ApplyTo%(Shape:LTShape)="_dwlab_frmwork_LTRevoluteJoint_ApplyTo"
}="dwlab_frmwork_LTRevoluteJoint"
LTAlign^brl.blitz.Object{
ToRight%=0
ToTop%=0
ToCenter%=1
ToLeft%=2
ToBottom%=2
Stretch%=3
-New%()="_dwlab_frmwork_LTAlign_New"
}="dwlab_frmwork_LTAlign"
LTBitmapFont^LTObject{
.LetterLength%&[]&
.FromNum%&
.ToNum%&
.BMaxImage:brl.max2d.TImage&
-New%()="_dwlab_frmwork_LTBitmapFont_New"
-Print%(Text$,X!,Y!,FontHeightInUnits!,HorizontalAlignment%=2,VerticalAlignment%=0)="_dwlab_frmwork_LTBitmapFont_Print"
-PrintInShape%(Text$,Shape:LTShape,FontHeightInUnits!,HorizontalAlignment%=2,VerticalAlignment%=0)="_dwlab_frmwork_LTBitmapFont_PrintInShape"
-Width%(Text$)="_dwlab_frmwork_LTBitmapFont_Width"
-Height%()="_dwlab_frmwork_LTBitmapFont_Height"
+FromFile:LTBitmapFont(FileName$,FromNum%=32,ToNum%=255,SymbolsPerRow%=16,VariableLength%=0)="_dwlab_frmwork_LTBitmapFont_FromFile"
}="dwlab_frmwork_LTBitmapFont"
LTPath^LTObject{
.Pivots:brl.linkedlist.TList&
-New%()="_dwlab_frmwork_LTPath_New"
+Find:LTPath(FromPivot:LTSprite,ToPivot:LTSprite,Graph:LTGraph)="_dwlab_frmwork_LTPath_Find"
}="dwlab_frmwork_LTPath"
LTDrag^LTObject{
.DraggingState%&
-New%()="_dwlab_frmwork_LTDrag_New"
-DragKey%()="_dwlab_frmwork_LTDrag_DragKey"
-DraggingConditions%()="_dwlab_frmwork_LTDrag_DraggingConditions"
-StartDragging%()="_dwlab_frmwork_LTDrag_StartDragging"
-Dragging%()="_dwlab_frmwork_LTDrag_Dragging"
-EndDragging%()="_dwlab_frmwork_LTDrag_EndDragging"
-Execute%()="_dwlab_frmwork_LTDrag_Execute"
}="dwlab_frmwork_LTDrag"
LTAction^LTObject{
-New%()="_dwlab_frmwork_LTAction_New"
-Do%()="_dwlab_frmwork_LTAction_Do"
-Undo%()="_dwlab_frmwork_LTAction_Undo"
}="dwlab_frmwork_LTAction"
L_PushActionsList%()="dwlab_frmwork_L_PushActionsList"
L_Undo%()="dwlab_frmwork_L_Undo"
L_Redo%()="dwlab_frmwork_L_Redo"
LTPause^LTObject{
.PreviousPause:LTPause&
.Project:LTProject&
.Key%&
-New%()="_dwlab_frmwork_LTPause_New"
-Render%()="_dwlab_frmwork_LTPause_Render"
-Update%()="_dwlab_frmwork_LTPause_Update"
-CheckKey%()="_dwlab_frmwork_LTPause_CheckKey"
-Remove%()="_dwlab_frmwork_LTPause_Remove"
}="dwlab_frmwork_LTPause"
L_XMLGet%=0
L_XMLSet%=1
LTXMLObject^LTObject{
.Attributes:brl.linkedlist.TList&
.Children:brl.linkedlist.TList&
.Fields:brl.linkedlist.TList&
.Closing%&
-New%()="_dwlab_frmwork_LTXMLObject_New"
-GetAttribute$(AttrName$)="_dwlab_frmwork_LTXMLObject_GetAttribute"
-SetAttribute%(AttrName$,AttrValue$)="_dwlab_frmwork_LTXMLObject_SetAttribute"
-GetField:LTXMLObject(FieldName$)="_dwlab_frmwork_LTXMLObject_GetField"
-SetField:LTXMLObjectField(FieldName$,XMLObject:LTXMLObject)="_dwlab_frmwork_LTXMLObject_SetField"
-ManageIntAttribute%(AttrName$,AttrVariable% Var,DefaultValue%=0)="_dwlab_frmwork_LTXMLObject_ManageIntAttribute"
-ManageDoubleAttribute%(AttrName$,AttrVariable! Var,DefaultValue!=0!)="_dwlab_frmwork_LTXMLObject_ManageDoubleAttribute"
-ManageStringAttribute%(AttrName$,AttrVariable$ Var)="_dwlab_frmwork_LTXMLObject_ManageStringAttribute"
-ManageObjectAttribute:LTObject(AttrName$,Obj:LTObject)="_dwlab_frmwork_LTXMLObject_ManageObjectAttribute"
-ManageIntArrayAttribute%(AttrName$,IntArray%&[] Var)="_dwlab_frmwork_LTXMLObject_ManageIntArrayAttribute"
-ManageObjectField:LTObject(FieldName$,FieldObject:LTObject)="_dwlab_frmwork_LTXMLObject_ManageObjectField"
-ManageListField%(FieldName$,List:brl.linkedlist.TList Var)="_dwlab_frmwork_LTXMLObject_ManageListField"
-ManageObjectMapField%(FieldName$,Map:brl.map.TMap Var)="_dwlab_frmwork_LTXMLObject_ManageObjectMapField"
-ManageObjectArrayField%(FieldName$,FieldObjectsArray:LTObject&[] Var)="_dwlab_frmwork_LTXMLObject_ManageObjectArrayField"
-ManageObject:LTObject(Obj:LTObject)="_dwlab_frmwork_LTXMLObject_ManageObject"
-ManageChildList%(List:brl.linkedlist.TList Var)="_dwlab_frmwork_LTXMLObject_ManageChildList"
-ManageChildArray%(ChildArray:LTObject&[] Var)="_dwlab_frmwork_LTXMLObject_ManageChildArray"
+ReadFromFile:LTXMLObject(Filename$)="_dwlab_frmwork_LTXMLObject_ReadFromFile"
-WriteToFile%(Filename$)="_dwlab_frmwork_LTXMLObject_WriteToFile"
+ReadObject:LTXMLObject(Txt$ Var,N% Var,FieldName$ Var)="_dwlab_frmwork_LTXMLObject_ReadObject"
-WriteObject%(File:brl.stream.TStream,Indent$=$"")="_dwlab_frmwork_LTXMLObject_WriteObject"
-ReadAttributes%(Txt$ Var,N% Var,FieldName$ Var)="_dwlab_frmwork_LTXMLObject_ReadAttributes"
+IDSym%(Sym%)="_dwlab_frmwork_LTXMLObject_IDSym"
}="dwlab_frmwork_LTXMLObject"
LTXMLAttribute^brl.blitz.Object{
.Name$&
.Value$&
-New%()="_dwlab_frmwork_LTXMLAttribute_New"
}="dwlab_frmwork_LTXMLAttribute"
LTXMLObjectField^brl.blitz.Object{
.Name$&
.Value:LTXMLObject&
-New%()="_dwlab_frmwork_LTXMLObjectField_New"
}="dwlab_frmwork_LTXMLObjectField"
L_HexToInt%(HexString$)="dwlab_frmwork_L_HexToInt"
L_DrawEmptyRect%(X!,Y!,Width!,Height!)="dwlab_frmwork_L_DrawEmptyRect"
L_DeleteList%(List:brl.linkedlist.TList)="dwlab_frmwork_L_DeleteList"
L_TrimDouble$(Val!)="dwlab_frmwork_L_TrimDouble"
L_FirstZeroes$(Value%,TotalSymbols%)="dwlab_frmwork_L_FirstZeroes"
L_Symbols$(Symbol$,Times%)="dwlab_frmwork_L_Symbols"
L_LimitDouble!(Value!,FromValue!,ToValue!)="dwlab_frmwork_L_LimitDouble"
L_LimitInt%(Value%,FromValue%,ToValue%)="dwlab_frmwork_L_LimitInt"
L_IsPowerOf2%(Value%)="dwlab_frmwork_L_IsPowerOf2"
L_WrapInt%(Value%,Size%)="dwlab_frmwork_L_WrapInt"
L_WrapInt2%(Value%,FromValue%,ToValue%)="dwlab_frmwork_L_WrapInt2"
L_WrapDouble!(Value!,Size!)="dwlab_frmwork_L_WrapDouble"
L_TryExtensions$(Filename$,Extensions$&[])="dwlab_frmwork_L_TryExtensions"
L_ClearPixmap%(Pixmap:brl.pixmap.TPixmap,Red!=0!,Green!=0!,Blue!=0!,Alpha!=1!)="dwlab_frmwork_L_ClearPixmap"
L_Round!(Value!)="dwlab_frmwork_L_Round"
L_Distance!(DX!,DY!)="dwlab_frmwork_L_Distance"
L_ChopFilename$(Filename$)="dwlab_frmwork_L_ChopFilename"
L_AddItemToIntArray%(Array%&[] Var,Item%)="dwlab_frmwork_L_AddItemToIntArray"
L_RemoveItemFromIntArray%(Array%&[] Var,Index%)="dwlab_frmwork_L_RemoveItemFromIntArray"
L_IntInLimits%(Value%,FromValue%,ToValue%)="dwlab_frmwork_L_IntInLimits"
L_GetTypeID:brl.reflection.TTypeId(TypeName$)="dwlab_frmwork_L_GetTypeID"
L_ToPowerOf2%(Value%)="dwlab_frmwork_L_ToPowerOf2"
L_Error%(Text$)="dwlab_frmwork_L_Error"
L_SetIncbin%(Value%)="dwlab_frmwork_L_SetIncbin"
L_IDMap:brl.map.TMap&=mem:p("dwlab_frmwork_L_IDMap")
L_RemoveIDMap:brl.map.TMap&=mem:p("dwlab_frmwork_L_RemoveIDMap")
L_DefinitionsMap:brl.map.TMap&=mem:p("dwlab_frmwork_L_DefinitionsMap")
L_Definitions:LTXMLObject&=mem:p("dwlab_frmwork_L_Definitions")
L_IDNum%&=mem("dwlab_frmwork_L_IDNum")
L_IDArray:LTObject&[]&=mem:p("dwlab_frmwork_L_IDArray")
LayerName$&=mem:p("dwlab_frmwork_LayerName")
L_CollisionChecks%&=mem("dwlab_frmwork_L_CollisionChecks")
L_TilesDisplayed%&=mem("dwlab_frmwork_L_TilesDisplayed")
L_SpritesDisplayed%&=mem("dwlab_frmwork_L_SpritesDisplayed")
L_SpritesActed%&=mem("dwlab_frmwork_L_SpritesActed")
L_SpriteActed%&=mem("dwlab_frmwork_L_SpriteActed")
L_DeltaTime!&=mem:d("dwlab_frmwork_L_DeltaTime")
L_CurrentCamera:LTCamera&=mem:p("dwlab_frmwork_L_CurrentCamera")
L_CameraSpeed!&=mem:d("dwlab_frmwork_L_CameraSpeed")
L_CameraMagnificationSpeed!&=mem:d("dwlab_frmwork_L_CameraMagnificationSpeed")
L_ProlongTiles%&=mem("dwlab_frmwork_L_ProlongTiles")
L_DefaultVisualizer:LTVisualizer&=mem:p("dwlab_frmwork_L_DefaultVisualizer")
L_LoadImages%&=mem("dwlab_frmwork_L_LoadImages")
L_DebugVisualizer:LTDebugVisualizer&=mem:p("dwlab_frmwork_L_DebugVisualizer")
L_UndoStack:brl.linkedlist.TList&=mem:p("dwlab_frmwork_L_UndoStack")
L_CurrentUndoList:brl.linkedlist.TList&=mem:p("dwlab_frmwork_L_CurrentUndoList")
L_RedoStack:brl.linkedlist.TList&=mem:p("dwlab_frmwork_L_RedoStack")
L_CurrentRedoList:brl.linkedlist.TList&=mem:p("dwlab_frmwork_L_CurrentRedoList")
L_XMLMode%&=mem("dwlab_frmwork_L_XMLMode")
L_Discrete%&=mem("dwlab_frmwork_L_Discrete")
L_Incbin$&=mem:p("dwlab_frmwork_L_Incbin")