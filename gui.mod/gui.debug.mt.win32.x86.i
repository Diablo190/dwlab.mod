ModuleInfo "Version: 1.0"
ModuleInfo "Author: Matt Merkulov"
ModuleInfo "License: Artistic License 2.0"
ModuleInfo "Modserver: DWLAB"
ModuleInfo "History: v1.0 (09.10.11)"
ModuleInfo "History: &nbsp; &nbsp; Initial release."
import brl.blitz
import dwlab.frmwork
import maxgui.localization
LTGUIProject^dwlab.frmwork.LTProject{
.Windows:brl.linkedlist.TList&
.GUICamera:dwlab.frmwork.LTCamera&
.Locked%&
-New%()="_dwlab_gui_LTGUIProject_New"
-LoadWindow:LTWindow(World:dwlab.frmwork.LTWorld,Name$=$"",Class$=$"")="_dwlab_gui_LTGUIProject_LoadWindow"
-FindWindow:LTWindow(Name$=$"",Class$=$"")="_dwlab_gui_LTGUIProject_FindWindow"
-CloseWindow%(Window:LTWindow="bbNullObject")="_dwlab_gui_LTGUIProject_CloseWindow"
-Execute%()="_dwlab_gui_LTGUIProject_Execute"
}="dwlab_gui_LTGUIProject"
LTWindow^dwlab.frmwork.LTLayer{
.World:dwlab.frmwork.LTWorld&
.Project:LTGUIProject&
.MouseOver:brl.map.TMap&
.Modal%&
-New%()="_dwlab_gui_LTWindow_New"
-Draw%()="_dwlab_gui_LTWindow_Draw"
-Act%()="_dwlab_gui_LTWindow_Act"
-OnButtonPress%(Gadget:LTGadget,ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTWindow_OnButtonPress"
-OnButtonUnpress%(Gadget:LTGadget,ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTWindow_OnButtonUnpress"
-OnButtonDown%(Gadget:LTGadget,ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTWindow_OnButtonDown"
-OnButtonUp%(Gadget:LTGadget,ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTWindow_OnButtonUp"
-OnMouseOver%(Gadget:LTGadget)="_dwlab_gui_LTWindow_OnMouseOver"
-OnMouseOut%(Gadget:LTGadget)="_dwlab_gui_LTWindow_OnMouseOut"
-Save%()="_dwlab_gui_LTWindow_Save"
}="dwlab_gui_LTWindow"
LTCheckBox^LTButton{
-New%()="_dwlab_gui_LTCheckBox_New"
-OnMouseOut%()="_dwlab_gui_LTCheckBox_OnMouseOut"
-OnButtonPress%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTCheckBox_OnButtonPress"
-OnButtonDown%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTCheckBox_OnButtonDown"
-OnButtonUp%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTCheckBox_OnButtonUp"
}="dwlab_gui_LTCheckBox"
LTButton^LTLabel{
.State%&
.Focus%&
-New%()="_dwlab_gui_LTButton_New"
-Draw%()="_dwlab_gui_LTButton_Draw"
-GetClassTitle$()="_dwlab_gui_LTButton_GetClassTitle"
-OnMouseOver%()="_dwlab_gui_LTButton_OnMouseOver"
-OnMouseOut%()="_dwlab_gui_LTButton_OnMouseOut"
-OnButtonDown%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTButton_OnButtonDown"
-OnButtonUp%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTButton_OnButtonUp"
}="dwlab_gui_LTButton"
LTLabel^LTGadget{
.Text$&
.Icon:dwlab.frmwork.LTShape&
.TextVisualizer:dwlab.frmwork.LTVisualizer&
.DX!&
.DY!&
.Align%&
-New%()="_dwlab_gui_LTLabel_New"
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
-Init%()="_dwlab_gui_LTTextField_Init"
-Draw%()="_dwlab_gui_LTTextField_Draw"
-GetClassTitle$()="_dwlab_gui_LTTextField_GetClassTitle"
-OnButtonPress%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTTextField_OnButtonPress"
}="dwlab_gui_LTTextField"
LTListBox^LTGadget{
.ListType%&
.Items:brl.linkedlist.TList&
.ItemSize!&
.Shift!&
-New%()="_dwlab_gui_LTListBox_New"
-GetClassTitle$()="_dwlab_gui_LTListBox_GetClassTitle"
-Draw%()="_dwlab_gui_LTListBox_Draw"
-GetItemSprite:dwlab.frmwork.LTSprite(Num%)="_dwlab_gui_LTListBox_GetItemSprite"
-DrawItem%(Item:Object,Num%,Sprite:dwlab.frmwork.LTSprite)="_dwlab_gui_LTListBox_DrawItem"
-OnButtonPress%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTListBox_OnButtonPress"
-OnButtonPressOnItem%(ButtonAction:dwlab.frmwork.LTButtonAction,Item:Object,Num%)="_dwlab_gui_LTListBox_OnButtonPressOnItem"
}="dwlab_gui_LTListBox"
LTSlider^LTGadget{
Moving%=0
Filling%=1
.Position!&
.Size!&
.SliderType%&
.SelectionType%&
.ListBox:LTListBox&
.Slider:dwlab.frmwork.LTShape&
.Dragging%&
.StartingX!&
.StartingY!&
.StartingPosition!&
.ListBoxSize!&
.ContentsSize!&
-New%()="_dwlab_gui_LTSlider_New"
-GetClassTitle$()="_dwlab_gui_LTSlider_GetClassTitle"
-Init%()="_dwlab_gui_LTSlider_Init"
-Draw%()="_dwlab_gui_LTSlider_Draw"
-Act%()="_dwlab_gui_LTSlider_Act"
-OnButtonDown%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTSlider_OnButtonDown"
-OnButtonUnpress%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTSlider_OnButtonUnpress"
}="dwlab_gui_LTSlider"
LTGadget^dwlab.frmwork.LTSprite{
-New%()="_dwlab_gui_LTGadget_New"
-Init%()="_dwlab_gui_LTGadget_Init"
-OnButtonPress%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTGadget_OnButtonPress"
-OnButtonUnpress%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTGadget_OnButtonUnpress"
-OnButtonDown%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTGadget_OnButtonDown"
-OnButtonUp%(ButtonAction:dwlab.frmwork.LTButtonAction)="_dwlab_gui_LTGadget_OnButtonUp"
-OnMouseOver%()="_dwlab_gui_LTGadget_OnMouseOver"
-OnMouseOut%()="_dwlab_gui_LTGadget_OnMouseOut"
}="dwlab_gui_LTGadget"
L_Window:LTWindow&=mem:p("dwlab_gui_L_Window")
L_ActiveTextField:LTTextField&=mem:p("dwlab_gui_L_ActiveTextField")
L_Cursor:dwlab.frmwork.LTSprite&=mem:p("dwlab_gui_L_Cursor")
L_LeftMouseButton:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_LeftMouseButton")
L_RightMouseButton:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_RightMouseButton")
L_MiddleMouseButton:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_MiddleMouseButton")
L_CharacterLeft:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_CharacterLeft")
L_CharacterRight:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_CharacterRight")
L_DeletePreviousCharacter:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_DeletePreviousCharacter")
L_DeleteNextCharacter:dwlab.frmwork.LTButtonAction&=mem:p("dwlab_gui_L_DeleteNextCharacter")
L_GUIButtons:brl.linkedlist.TList&=mem:p("dwlab_gui_L_GUIButtons")