import brl.blitz
import brl.eventqueue
import maxgui.win32maxguiex
import dwlab.frmwork
LTForm^dwlab.frmwork.LTObject{
.Gadget:maxgui.maxgui.TGadget&
.Margins%&
.HorizontalCellSpacing%&
.VerticalCellSpacing%&
.VerticalList:brl.linkedlist.TList&
.CurrentHorizontalList:LTHorizontalList&
.MaxWidth%&
.CurrentHeight%&
.X%&
.Y%&
-New%()="_dwlab_forms_LTForm_New"
-Delete%()="_dwlab_forms_LTForm_Delete"
+Create:LTForm(Gadget:maxgui.maxgui.TGadget,Margins%=8,HorizontalCellSpacing%=8,VerticalCellSpacing%=8)="_dwlab_forms_LTForm_Create"
-NewLine%(Alignment%=1)="_dwlab_forms_LTForm_NewLine"
-AddLabel:maxgui.maxgui.TGadget(Text$,Width%,Style%=8)="_dwlab_forms_LTForm_AddLabel"
-AddButton:maxgui.maxgui.TGadget(Text$,Width%,Style%=8)="_dwlab_forms_LTForm_AddButton"
-AddCanvas:maxgui.maxgui.TGadget(Width%,Height%)="_dwlab_forms_LTForm_AddCanvas"
-AddTextField:maxgui.maxgui.TGadget(LabelText$,LabelWidth%,TextFieldWidth%=56,TextFieldStyle%=0)="_dwlab_forms_LTForm_AddTextField"
-AddComboBox:maxgui.maxgui.TGadget(LabelText$,LabelWidth%,ComboBoxWidth%=56,ComboBoxStyle%=0)="_dwlab_forms_LTForm_AddComboBox"
-AddSliderWidthTextField%(Slider:maxgui.maxgui.TGadget Var,TextField:maxgui.maxgui.TGadget Var,LabelText$,LabelWidth%,SliderWidth%=56,TextFieldWidth%=56,SliderStyle%=5)="_dwlab_forms_LTForm_AddSliderWidthTextField"
-AddGadget:LTGadget(LabelText$,Width%,Height%,LabelWidth%,SliderWidth%,GadgetType%,Style%)="_dwlab_forms_LTForm_AddGadget"
-Finalize%(Center%=1,FormDX%=0,FormDY%=0)="_dwlab_forms_LTForm_Finalize"
-MoveGadgets%(LabGadget:LTGadget,DX%,DWidth%=0)="_dwlab_forms_LTForm_MoveGadgets"
-MoveGadget%(Gadget:maxgui.maxgui.TGadget,X%,Y%,DWidth%=0)="_dwlab_forms_LTForm_MoveGadget"
}="dwlab_forms_LTForm"
LTGadget^dwlab.frmwork.LTObject{
Button%=0
TextField%=1
ComboBox%=2
SliderWithTextField%=3
Label%=4
Canvas%=5
.GadgetType%&
.Gadget:maxgui.maxgui.TGadget&
.X%&
.Y%&
.LabelGadget:maxgui.maxgui.TGadget&
.LabelX%&
.LabelY%&
.SliderGadget:maxgui.maxgui.TGadget&
.SliderX%&
-New%()="_dwlab_forms_LTGadget_New"
-Delete%()="_dwlab_forms_LTGadget_Delete"
}="dwlab_forms_LTGadget"
LTHorizontalList^brl.linkedlist.TList{
.TotalWidth%&
.Alignment%&
-New%()="_dwlab_forms_LTHorizontalList_New"
-Delete%()="_dwlab_forms_LTHorizontalList_Delete"
}="dwlab_forms_LTHorizontalList"
L_LabelIndent%&=mem("dwlab_forms_L_LabelIndent")
L_FieldHeight%&=mem("dwlab_forms_L_FieldHeight")