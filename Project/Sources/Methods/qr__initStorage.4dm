//%attributes = {"invisible":true,"preemptive":"incapable","shared":false}
//================================================================================
//@xdoc-start : en
//@name : qr__initStorage
//@scope : private 
//@deprecated : no
//@description : This method inits the storage for the component
//@notes : 
//@example : qr__initStorage
//@see : 
//@version : 1.00.00
//@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2024
//@history : 
//  CREATION : Bruno LEGAY (BLE) - 24/01/2024, 23:57:40 - 4.00.00
//@xdoc-end
//================================================================================

C_TEXT:C284($vt_debugMethodName)
$vt_debugMethodName:=""

ARRAY TEXT:C222($tt_componentsList; 0)
COMPONENT LIST:C1001($tt_componentsList)
If (Find in array:C230($tt_componentsList; "dbg_component")>0)
	$vt_debugMethodName:="DBG_module_Debug_DateTimeLine"
End if 
ARRAY TEXT:C222($tt_componentsList; 0)

Use (Storage:C1525)
	Storage:C1525.qr:=New shared object:C1526(\
		"debugMethodName"; $vt_debugMethodName; \
		"init"; False:C215)
End use 