//%attributes = {"shared":true,"invisible":false}
//================================================================================
//@xdoc-start : en
//@name : qr_componentVersionGet
//@scope : private 
//@attributes :    
//@deprecated : no
//@description : This function returns the component version
//@parameter[0-OUT-componentVersion-TEXT] : component version (e.g. "4.00.00")
//@notes : 
//@example : qr_componentVersionGet
//@see : 
//@version : 4.00.00
//@author : Bruno LEGAY (BLE) - Copyrights A&C Consulting - 2024
//@history : 
//  CREATION : Bruno LEGAY - 24/01/2024, 22:08:23 - v4.00.00
//@xdoc-end
//================================================================================

C_TEXT:C284($0; $vt_componentVersion)

//<Modif> Bruno LEGAY (BLE) (24/01/2024)
$vt_componentVersion:="4.00.00"
//<Modif>

If (False:C215)
	
End if 

$0:=$vt_componentVersion
