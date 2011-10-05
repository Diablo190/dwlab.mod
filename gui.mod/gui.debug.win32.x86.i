ModuleInfo "Version: 1.0"
ModuleInfo "Author: Matt Merkulov"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Modserver: DWLAB"
ModuleInfo "History: v1.0 (28.06.11)"
ModuleInfo "History: &nbsp; &nbsp; Initial release."
import brl.blitz
import dwlab.frmwork
import maxgui.localization
LTGUIProject^dwlab.frmwork.LTProject{
.Windows:brl.linkedlist.TList&
.GUICamera:dwlab.frmwork.LTCamera&
.MouseHits%&[]&
-New%()="_dwlab_gui_LTGUIProject_New"
-Delete%()="_dwlab_gui_LTGUIProject_Delete"
-LoadWindow:LTWindow(World:dwlab.frmwork.LTWorld,Name$=$"",Class$=$"")="_dwlab_gui_LTGUIProject_LoadWindow"
-CloseWindow%(Window:LTWindow="bbNullObject")="_dwlab_gui_LTGUIProject_CloseWindow"
-Execute%()="_dwlab_gui_LTGUIProject_Execute"
}="dwlab_gui_LTGUIProject"
LTWindow^dwlab.frmwork.LTLayer{
.World:dwlab.frmwork.LTWorld&
.Project:LTGUIProject&
.MouseOver:brl.map.TMap&
.Modal%&
-New%()="_dwlab_gui_LTWindow_New"
-Delete%()="_dwlab_gui_LTWindow_Delete"
-Draw%()="_dwlab_gui_LTWindow_Draw"
-Act%()="_dwlab_gui_LTWindow_Act"
-GetTextFieldText$(Name$)="_dwlab_gui_LTWindow_GetTextFieldText"
-OnClick%(Gadget:LTGadget,Button%)="_dwlab_gui_LTWindow_OnClick"
-OnMouseDown%(Gadget:LTGadget,Button%)="_dwlab_gui_LTWindow_OnMouseDown"
-OnMouseOver%(Gadget:LTGadget)="_dwlab_gui_LTWindow_OnMouseOver"
-OnMouseOut%(Gadget:LTGadget)="_dwlab_gui_LTWindow_OnMouseOut"
-Save%()="_dwlab_gui_LTWindow_Save"
}="dwlab_gui_LTWindow"
LTCheckBox^LTButton{
-New%()="_dwlab_gui_LTCheckBox_New"
-Delete%()="_dwlab_gui_LTCheckBox_Delete"
-GetValue$()="_dwlab_gui_LTCheckBox_GetValue"
-SetValue%(Value$)="_dwlab_gui_LTCheckBox_SetValue"
-OnClick%(Button%)="_dwlab_gui_LTCheckBox_OnClick"
-OnMouseDown%(Button%)="_dwlab_gui_LTCheckBox_OnMouseDown"
-OnMouseUp%(Button%)="_dwlab_gui_LTCheckBox_OnMouseUp"
}="dwlab_gui_LTCheckBox"
LTButton^LTLabel{
.State%&
.Focus%&
-New%()="_dwlab_gui_LTButton_New"
-Delete%()="_dwlab_gui_LTButton_Delete"
-Draw%()="_dwlab_gui_LTButton_Draw"
-GetClassTitle$()="_dwlab_gui_LTButton_GetClassTitle"
-OnMouseOver%()="_dwlab_gui_LTButton_OnMouseOver"
-OnMouseOut%()="_dwlab_gui_LTButton_OnMouseOut"
-OnMouseDown%(Button%)="_dwlab_gui_LTButton_OnMouseDown"
-OnMouseUp%(Button%)="_dwlab_gui_LTButton_OnMouseUp"
}="dwlab_gui_LTButton"
LTLabel^LTGadget{
.Text$&
.Icon:dwlab.frmwork.LTShape&
.TextVisualizer:dwlab.frmwork.LTVisualizer&
.DX!&
.DY!&
.Align%&
-New%()="_dwlab_gui_LTLabel_New"
-Delete%()="_dwlab_gui_LTLabel_Delete"
-GetClassTitle$()="_dwlab_gui_LTLabel_GetClassTitle"
-Init%()="_dwlab_gui_LTLabel_Init"
-Draw%()="_dwlab_gui_LTLabel_Draw"
-Activate%()="_dwlab_gui_LTLabel_Activate"
-Deactivate%()="_dwlab_gui_LTLabel_Deactivate"
}="dwlab_gui_LTLabel"
LTTextField^LTGadget{
.Text$&
.LeftPart$&
.RightPart$&
-New%()="_dwlab_gui_LTTextField_New"
-Delete%()="_dwlab_gui_LTTextField_Delete"
-Init%()="_dwlab_gui_LTTextField_Init"
-Draw%()="_dwlab_gui_LTTextField_Draw"
-GetClassTitle$()="_dwlab_gui_LTTextField_GetClassTitle"
-OnClick%(Button%)="_dwlab_gui_LTTextField_OnClick"
}="dwlab_gui_LTTextField"
LTListBox^LTGadget{
.ListType%&
.Items:brl.linkedlist.TList&
.ItemSize!&
.Shift!&
-New%()="_dwlab_gui_LTListBox_New"
-Delete%()="_dwlab_gui_LTListBox_Delete"
-GetClassTitle$()="_dwlab_gui_LTListBox_GetClassTitle"
-Draw%()="_dwlab_gui_LTListBox_Draw"
-GetItemSprite:dwlab.frmwork.LTSprite(Num%)="_dwlab_gui_LTListBox_GetItemSprite"
-DrawItem%(Item:Object,Num%,Sprite:dwlab.frmwork.LTSprite)="_dwlab_gui_LTListBox_DrawItem"
-OnClick%(Button%)="_dwlab_gui_LTListBox_OnClick"
-OnClickOnItem%(Button%,Item:Object,Num%)="_dwlab_gui_LTListBox_OnClickOnItem"
}="dwlab_gui_LTListBox"
LTSlider^LTGadget{
Moving%=0
Filling%=1
.ListBox:LTListBox&
.Slider:dwlab.frmwork.LTShape&
.Position!&
.SliderType%&
.SelectionType%&
.Size!&
.Dragging%&
.StartingX!&
.StartingY!&
.StartingPosition!&
-New%()="_dwlab_gui_LTSlider_New"
-Delete%()="_dwlab_gui_LTSlider_Delete"
-Init%()="_dwlab_gui_LTSlider_Init"
-Draw%()="_dwlab_gui_LTSlider_Draw"
-GetClassTitle$()="_dwlab_gui_LTSlider_GetClassTitle"
-OnMouseDown%(Button%)="_dwlab_gui_LTSlider_OnMouseDown"
-OnMouseUp%(Button%)="_dwlab_gui_LTSlider_OnMouseUp"
}="dwlab_gui_LTSlider"
LTGadget^dwlab.frmwork.LTSprite{
-New%()="_dwlab_gui_LTGadget_New"
-Delete%()="_dwlab_gui_LTGadget_Delete"
-Init%()="_dwlab_gui_LTGadget_Init"
-GetValue$()="_dwlab_gui_LTGadget_GetValue"
-SetValue%(Value$)="_dwlab_gui_LTGadget_SetValue"
-OnMouseOver%()="_dwlab_gui_LTGadget_OnMouseOver"
-OnMouseOut%()="_dwlab_gui_LTGadget_OnMouseOut"
-OnClick%(Button%)="_dwlab_gui_LTGadget_OnClick"
-OnMouseDown%(Button%)="_dwlab_gui_LTGadget_OnMouseDown"
-OnMouseUp%(Button%)="_dwlab_gui_LTGadget_OnMouseUp"
}="dwlab_gui_LTGadget"
L_Window:LTWindow&=mem:p("dwlab_gui_L_Window")
L_ActiveTextField:LTTextField&=mem:p("dwlab_gui_L_ActiveTextField")
L_Cursor:dwlab.frmwork.LTSprite&=mem:p("dwlab_gui_L_Cursor")
