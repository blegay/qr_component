//%attributes = {"shared":false,"invisible":true}
//================================================================================
//@xdoc-start : en
//@name : qr_moduleDebugDateTimeLine
//@scope : private 
//@deprecated : no
//@description : This method writes a log
//@parameter[1-IN-level-LONGINT] : level
//@parameter[2-IN-methodName-TEXT] : methodName
//@parameter[3-IN-debugMessage-TEXT] : debugMessage
//@parameter[4-IN-moduleCode-TEXT] : moduleCode (optional, default value : "qr")
//@notes :  
//@example : qr_moduleDebugDateTimeLine
//@see : 
//@version : 1.00.00
//@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2024
//@history : 
//  CREATION : Bruno LEGAY (BLE) - 24/01/2024, 23:57:40 - 4.00.00
//@xdoc-end
//================================================================================

C_LONGINT:C283($1; $vl_level)
C_TEXT:C284($2; $vt_methodName)
C_TEXT:C284($3; $vt_debugMessage)
C_TEXT:C284($4; $vt_moduleCode)

ASSERT:C1129(Count parameters:C259>2; "requires 2 parameters")

$vl_level:=$1
$vt_methodName:=$2
$vt_debugMessage:=$3

If (Count parameters:C259>3)
	$vt_moduleCode:=$4
End if 

If (Length:C16(Storage:C1525.qr.debugMethodName)>0)
	
	If (Length:C16($vt_moduleCode)=0)
		$vt_moduleCode:="qr"
	End if 
	
	EXECUTE METHOD:C1007(Storage:C1525.qr.debugMethodName; *; $vt_moduleCode; $vl_level; $vt_methodName; $vt_debugMessage)
	
End if 


